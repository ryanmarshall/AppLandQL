class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.belongs_to :client
      t.belongs_to :app
      t.integer :parser, default: :default, index: true
      t.integer :event_id
      t.string :event
      t.integer :thread_id
      t.string :defined_class, index: true
      t.string :searchable, index: true
      t.string :path
      t.json :body

      t.timestamps
    end
  end
end
