class ExercisesController < ApplicationController

	def create
		@workout = Workout.find(params[:workout_id])
		@exercise = @workout.exercises.build(exercise_params)
		@exercise.save!
		redirect_to workout_path(@workout)
	end

	private

	def exercise_params
		params.require(:exercise).permit(:name, :sets, :reps)
	end
	
end
