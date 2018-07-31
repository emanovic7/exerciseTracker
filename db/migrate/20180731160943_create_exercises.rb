class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.integer :sets
      t.integer :reps
      t.integer :rest
      t.integer :user_id
      t.integer :workout_id

      t.timestamps
    end
  end
end
