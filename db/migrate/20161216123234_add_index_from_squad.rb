class AddIndexFromSquad < ActiveRecord::Migration
  def change
    add_index :squads, :teacher_id
  end
end
