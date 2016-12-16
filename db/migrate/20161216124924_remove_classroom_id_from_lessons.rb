class RemoveClassroomIdFromLessons < ActiveRecord::Migration
  def change
    remove_index :lessons, :classroom_id
    remove_column :lessons, :classroom_id
    add_column :lessons, :classroomids, :string
  end
end
