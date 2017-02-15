class CreateLessonSquads < ActiveRecord::Migration
  def change
    create_table :lesson_squads do |t|
      t.integer :lesson_id
      t.integer :squad_id
      t.index :lesson_id
      t.index :squad_id

      t.timestamps null: false
    end
  end
end
