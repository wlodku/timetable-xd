class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :short
      t.string :color

      t.timestamps null: false
    end
    create_table :squads do |t|
      t.string :short
      t.integer :teacher_id
      t.index :teacher_id, unique: true

      t.timestamps null: false
    end
  end
end
