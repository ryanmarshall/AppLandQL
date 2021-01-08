module Types
  class QueryType < Types::BaseObject


    field :events, [EventType], description: "Search Events", null: false do
       argument :auth_provider, String, required: true
       argument :query, String, required: true
       argument :type, String, required: false, default_value: "sql_query"
    end
    def events(query:, type:, auth_provider:)
      @app = authorize(auth_provider)
      events = @app.events
      events.where("searchable ~* ?", query).where(parser: type)
    end


    field :class_map, [ClassMapType], description: "Search Class Maps", null: true do
      argument :auth_provider, String, required: true
      argument :name, String, required: false
      argument :location, String, required: false
      argument :type_name, String, required: false
    end
    def class_map(*args)
      args = args.first
      @app = authorize( args[:auth_provider] )
      class_maps = @app.class_maps
      class_maps = class_maps.where("name ~* ?", args[:name]) if args[:name]
      class_maps = class_maps.where("location ~* ?", args[:location]) if args[:location]
      class_maps = class_maps.where("type_name ~* ?", args[:type_name]) if args[:type_name]
    end



    private
    # authorize user
    def authorize(auth_provider)
      @app = App.find_by_auth_provider(auth_provider)
      raise GraphQL::ExecutionError.new("You must pass a valid :auth_provider for you app") unless @app
      @app
    end

  end
end
