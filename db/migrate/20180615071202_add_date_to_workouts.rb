class AddDateToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :date, :datetime
  end
end
