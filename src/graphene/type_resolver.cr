module Graphene
  abstract class TypeResolver
    abstract def resolve_type(object, context)
  end
end