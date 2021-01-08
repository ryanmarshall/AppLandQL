namespace :load_json do

  desc "Load json test data"
  task :parse => :environment do

    file = File.read('./data/appland.results.JVCLD-42862-with-info.json')
    parser = Yajl::Parser.new(:symbolize_keys => true)
    json = parser.parse(file)

    puts "Parsing JSON..."
    @app = App.find_by_name(json[:metadata][:client][:name])

    puts "Inserting ClassMaps"
    json[:classMap].each do |node|
      parse_class_map(@app.client_id, @app.id, node)
    end

    puts "Insert #{json[:events].length} Events"
    Event.transaction do
      count = 0
      json[:events].each_slice(1000) do |events|
        count += events.length
        puts "Creating #{count} events of #{json[:events].length}"
        insert_events = []
        events.each do |event|
          insert_events << Event.json_to_event(@app, event)
        end
        Event.import insert_events
      end
    end

  end

end


def parse_class_map(client_id, app_id, node, parent_id=nil)
  hash = {
    client_id: client_id,
    app_id: app_id,
    parent_id: parent_id,
    name: node[:name],
    type_name: node[:type],
    location: node[:location],
    static: node[:static],
  }
  class_map = ClassMap.create(hash)
  if node[:children]
    node[:children].each do |child|
      parse_class_map(client_id, app_id, child, class_map.id)
    end
  end
end