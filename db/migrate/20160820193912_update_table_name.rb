class UpdateTableName < ActiveRecord::Migration
  def change
  	rename_table(:shorts, :urls)
  end
end