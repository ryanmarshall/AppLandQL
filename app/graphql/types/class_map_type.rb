module Types
  class ClassMapType < Types::BaseObject
    # field :id, ID, null: false
    # field :client_id, Integer, null: true
    # field :app_id, Integer, null: true
    field :parent_id, Integer, null: true
    field :name, String, null: true
    field :type_name, String, null: true
    field :location, String, null: true
    field :static, Boolean, null: true
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
