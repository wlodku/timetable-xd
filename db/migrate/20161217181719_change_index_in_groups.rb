class ChangeIndexInGroups < ActiveRecord::Migration
  def change
    remove_index :groups, :teacher_id
    add_index :groups, :squd_id
  end
end
