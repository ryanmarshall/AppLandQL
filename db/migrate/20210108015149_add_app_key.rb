class AddAppKey < ActiveRecord::Migration[6.1]
  def change

    add_column :apps, :auth_provider, :string

  end
end
