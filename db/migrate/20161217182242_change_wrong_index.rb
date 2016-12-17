class ChangeWrongIndex < ActiveRecord::Migration
  def change
    remove_index :groups, :squd_id
    add_index :groups, :squad_id
  end
end
