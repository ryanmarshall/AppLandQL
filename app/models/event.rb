class Event < ApplicationRecord
  belongs_to :app
  belongs_to :client

  before_create :parse_searchable

  enum parser: {
    default: 0,
    sql_query: 1,
    return_value: 2,
    receiver: 3,
    http_server_request: 4,
    http_server_response: 5,
  }

  def self.json_to_event(app, event)
    event = event.symbolize_keys
    hash = {
      client_id: app.client_id,
      app_id: app.id,
      event_id: event[:id],
      event: event[:event],
      thread_id: event[:thread_id],
      defined_class: event[:defined_class],
      path: event[:path],
      body: event
    }
    e = self.new(hash)
    e.parse_searchable
    e
  end

  def parse_searchable
    assign_attributes( parser: :sql_query, searchable: body["sql_query"]["sql"] ) if body["sql_query"]
    assign_attributes( parser: :return_value, searchable: body["return_value"]["value"] ) if body["return_value"]
    assign_attributes( parser: :receiver, searchable: body["receiver"]["value"] ) if body["receiver"]
    assign_attributes( parser: :http_server_request, searchable: body["http_server_request"]["path_info"] ) if body["http_server_request"]
    assign_attributes( parser: :http_server_response, searchable: body["http_server_response"]["mime_type"] ) if body["http_server_response"]
    self
  end
end
