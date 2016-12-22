class ChangeWrongIndex < ActiveRecord::Migration
  def change
    remove_index :groups, :squad_id
    add_index :groups, :squad_id
  end
end
