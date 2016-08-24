class AddShort < ActiveRecord::Migration
  def change
  	add_column :shorts, :short, :string
  	add_index :shorts, :long
  end
end