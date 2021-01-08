class CreateApps < ActiveRecord::Migration[6.1]
  def change
    create_table :apps do |t|
      t.belongs_to :client
      t.string :name, null: false, empty: false, index: true
      t.string :url, null: false, empty: false
      t.timestamps
    end
  end
end
