require "./schema_type"

module Graphene
  module Introspection
    QueryType = Graphene::Types::ObjectType.new(
      name: "__IntrospectionQuery",
      resolver: QueryResolver.new,
      fields: [
        Graphene::Field.new(
          name: "__schema",
          type: Graphene::Types::LateBoundType.new("__Schema")
        )
      ]
    )
  end
end