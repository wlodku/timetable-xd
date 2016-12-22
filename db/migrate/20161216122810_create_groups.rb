class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :divisiontag
      t.integer :squad_id
      t.integer :teacher_id
      t.index :teacher_id

      t.timestamps null: false
    end
  end
end
