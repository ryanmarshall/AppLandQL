class CreateClassMaps < ActiveRecord::Migration[6.1]

  def change
    create_table :class_maps do |t|
      t.belongs_to :client
      t.belongs_to :app
      t.integer :parent_id, index: true
      t.string :name, index: true
      t.string :type_name
      t.string :location
      t.boolean :static
      t.timestamps
    end
  end

end
