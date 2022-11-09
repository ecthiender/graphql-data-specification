module Schema.Model.Type.SelectableField.Name
  ( name,
  )
where

import DDL.Model qualified as DDL
import Language.GraphQL.Draft.Syntax as GraphQL

name :: DDL.ModelName -> GraphQL.Name
name modelName = GraphQL.unsafeMkName $ modelName.wrapped <> "_field"