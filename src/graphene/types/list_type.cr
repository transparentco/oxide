require "../type"

module Graphene
  module Types
    class ListType < Type
      getter description : String?
      getter of_type : Graphene::Type

      def initialize(@of_type, @description = nil)
      end

      def resolve(field_name, argument_values, context, resolution_info) : Result
        case field_name
        when "kind"
          kind
        when "ofType"
          of_type
        end
      end

      def kind
        "LIST"
      end

      def coerce(value : Array) : CoercedInput
        value.map do |item|
          of_type.coerce(item).as(CoercedInput)
        end
      end

      def coerce(value : Nil) : CoercedInput
        value
      end

      def coerce(value) : CoercedInput
        Array(CoercedInput).new(1, of_type.coerce(value))
      end

      def serialize(value)
        value
      end

      def input_type? : Bool
        of_type.input_type?
      end

      def output_type? : Bool
        of_type.output_type?
      end
    end
  end
end
