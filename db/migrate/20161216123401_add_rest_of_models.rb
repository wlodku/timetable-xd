class AddRestOfModels < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :short

      t.timestamps null: false
    end

    create_table :cards do |t|
      t.integer :day
      t.integer :period
      t.integer :classroom_id
      t.integer :lesson_id
      t.index :classroom_id
      t.index :lesson_id

      t.timestamps null: false
    end

    create_table :lessons do |t|


      t.integer :periodspercard
      t.integer :teacher_id
      t.integer :subject_id
      t.integer :group_id
      t.integer :squad_id
      t.integer :classroom_id

      t.index :teacher_id
      t.index :subject_id
      t.index :group_id
      t.index :squad_id
      t.index :classroom_id


      t.timestamps null: false
    end

  end
end
