SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create view [Utils].[uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint]
as
select concat(tbl.TABLE_SCHEMA, '.', tbl.TABLE_NAME)   as FullyQualifiedTableName
     , tbl.TABLE_SCHEMA                                as SchemaName
     , tbl.TABLE_NAME                                  as TableName
     , col.COLUMN_NAME                                 as ColumnName
     , col.ORDINAL_POSITION                            as OrdinalPosition
     , concat(col.DOMAIN_SCHEMA, '.', col.DOMAIN_NAME) as FullyQualifiedDomainName
     , col.DOMAIN_NAME                                 as DomainName
     , case
           when col.DATA_TYPE = 'varchar' then
               concat('varchar(', CHARACTER_MAXIMUM_LENGTH, ')')
           when col.DATA_TYPE = 'char' then
               concat('char(', CHARACTER_MAXIMUM_LENGTH, ')')
           when col.DATA_TYPE = 'nvarchar' then
               concat('nvarchar(', CHARACTER_MAXIMUM_LENGTH, ')')
           when col.DATA_TYPE = 'nchar' then
               concat('nchar(', CHARACTER_MAXIMUM_LENGTH, ')')
           when col.DATA_TYPE = 'numeric' then
               concat('numeric(', NUMERIC_PRECISION_RADIX, ', ', NUMERIC_SCALE, ')')
           when col.DATA_TYPE = 'decimal' then
               concat('decimal(', NUMERIC_PRECISION_RADIX, ', ', NUMERIC_SCALE, ')')
           else
               col.DATA_TYPE
       end                                             as DataType
     , col.IS_NULLABLE                                 as IsNullable
     , dcn.DefaultName
     , col.COLUMN_DEFAULT                              as DefaultNameDefinition
     , cc.CONSTRAINT_NAME                              as CheckConstraintRuleName
     , cc.CHECK_CLAUSE                                 as CheckConstraintRuleNameDefinition
from
(
    select TABLE_CATALOG
         , TABLE_SCHEMA
         , TABLE_NAME
         , TABLE_TYPE
    from INFORMATION_SCHEMA.TABLES
    where (TABLE_TYPE = 'BASE TABLE')
)     as tbl
    inner join
    (
        select TABLE_CATALOG
             , TABLE_SCHEMA
             , TABLE_NAME
             , COLUMN_NAME
             , ORDINAL_POSITION
             , COLUMN_DEFAULT
             , IS_NULLABLE
             , DATA_TYPE
             , CHARACTER_MAXIMUM_LENGTH
             , CHARACTER_OCTET_LENGTH
             , NUMERIC_PRECISION
             , NUMERIC_PRECISION_RADIX
             , NUMERIC_SCALE
             , DATETIME_PRECISION
             , CHARACTER_SET_CATALOG
             , CHARACTER_SET_SCHEMA
             , CHARACTER_SET_NAME
             , COLLATION_CATALOG
             , COLLATION_SCHEMA
             , COLLATION_NAME
             , DOMAIN_CATALOG
             , DOMAIN_SCHEMA
             , DOMAIN_NAME
        from INFORMATION_SCHEMA.COLUMNS
    ) as col
        on col.TABLE_CATALOG = tbl.TABLE_CATALOG
           and col.TABLE_SCHEMA = tbl.TABLE_SCHEMA
           and col.TABLE_NAME = tbl.TABLE_NAME
    left outer join
    (
        select t.name                   as TableName
             , schema_name(s.schema_id) as SchemaName
             , ac.name                  as ColumnName
             , d.name                   as DefaultName
        from sys.all_columns                   as ac
            inner join sys.tables              as t
                on ac.object_id = t.object_id
            inner join sys.schemas             as s
                on t.schema_id = s.schema_id
            inner join sys.default_constraints as d
                on ac.default_object_id = d.object_id
    ) as dcn
        on dcn.SchemaName = tbl.TABLE_SCHEMA
           and dcn.TableName = tbl.TABLE_NAME
           and dcn.ColumnName = col.COLUMN_NAME
    left outer join
    (
        select cu.TABLE_CATALOG
             , cu.TABLE_SCHEMA
             , cu.TABLE_NAME
             , cu.COLUMN_NAME
             , c.CONSTRAINT_CATALOG
             , c.CONSTRAINT_SCHEMA
             , c.CONSTRAINT_NAME
             , c.CHECK_CLAUSE
        from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE     as cu
            inner join INFORMATION_SCHEMA.CHECK_CONSTRAINTS as c
                on c.CONSTRAINT_NAME = cu.CONSTRAINT_NAME
    ) as cc
        on cc.TABLE_SCHEMA = tbl.TABLE_SCHEMA
           and cc.TABLE_NAME = tbl.TABLE_NAME
           and cc.COLUMN_NAME = col.COLUMN_NAME;


GO
