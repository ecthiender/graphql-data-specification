# GraphQL Data Specification

The GDS is a fluent GraphQL API specification for transactional, analytical and streaming workloads across multiple data sources that contain semantically related data.

A key goal is to ensure that a GraphQL API following the GraphQL Data Specification is performant (high-concurrency, low-latency) & secure (fine-grained authorization).

There are 4 main components of this specification:
1. Data sources
2. Domain Description Language
3. Node Level Security
4. GraphQL Schema and API specification

## Data sources

A data source contains one or both of the following entities:
1. Logical or physical data models that can be read or written
2. Methods that access underlying data models (read or write) and expose a view of the data

A data source can be any kind of database or an API service.

## Domain Description Language

The domain description language is generated by taking input and configuration that helps map data sources entities into domain specific concepts. A domain refers to the particular business domain of the user.

The DDL has the following concepts:

- [Model](#model)
- [VirtualModel](#virtual-model)
- [Fields & Edges](#fields-and-edges)
- [Actions](#actions)

### Model
```
Model
  name :: String
  fields :: [Field]
  edges :: [Edge]
  selectable :: Boolean
  insertable :: Boolean
  updateable :: Boolean
  deleteable :: Boolean
  implements :: [VirtualModelName]
  implemented_by :: [VirtualModelName]
```
ModelName :: String

VirtualModel
	name :: VirtualModelName
fields :: [Field]
edges :: [Edge]
implements :: [VirtualModelName]
implemented_by :: [VirtualModelName]

VirtualModelName :: String

Edge
	name :: Fieldname
	target :: VirtualModel | Model
kind :: Object | Array

Enum
	name :: EnumName
	values: [String]

EnumName :: String

Field
name :: FieldName 
input :: VirtualModel
output :: FieldType

FieldType
FieldTypeNamed FieldTypeName | 
FieldTypeList FieldType | 
FieldTypeNotNull FieldType

FieldTypeName 
FieldTypeNameScalar ScalarFieldTypeName | 
FieldTypeNameModel ModelName | 
FieldTypeNameVirtualModel VirtualModelName | 
FieldTypeNameEnum EnumName

ScalarFieldTypeName 
Int | 
String |
Boolean | 
Id | ... | 

Action
	name :: ActionName
input :: VirtualModel
output :: FieldType
root :: Mutation | Query
