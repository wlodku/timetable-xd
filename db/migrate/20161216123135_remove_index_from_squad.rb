class RemoveIndexFromSquad < ActiveRecord::Migration
  def change
    remove_index :squads, :teacher_id
  end
end
