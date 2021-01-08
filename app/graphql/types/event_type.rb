module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :client_id, Integer, null: true
    field :app_id, Integer, null: true
    field :parser, Integer, null: true
    field :event_id, Integer, null: true
    field :event, String, null: true
    field :thread_id, Integer, null: true
    field :defined_class, String, null: true
    field :searchable, String, null: true
    field :path, String, null: true
    field :body, GraphQL::Types::JSON, null: true
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
