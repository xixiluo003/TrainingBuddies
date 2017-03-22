class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.references :user, foreign_key: true
      t.string :workout_type
      t.text :workout_content

      t.timestamps
    end
  end
end
