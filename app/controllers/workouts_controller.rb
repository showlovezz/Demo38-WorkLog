class WorkoutsController < ApplicationController
	
	before_action :find_workout, only: [:show, :edit, :update, :destroy]

	def index
		@workouts = Workout.order("created_at DESC")
	end

	def new
		@workout = Workout.new
	end

	def create
		@workout = Workout.new(workout_params)
		if @workout.save
			redirect_to workouts_path, notice: "已建立"
		else
			render "new", alert: "建立失敗"
		end
	end

	def show
		@exercise = Exercise.new
	end

	def edit
	end

	def update
		if @workout.update(workout_params)
			redirect_to workouts_path, notice: "修改成功"
		else
			render "edit", alert: "修改失敗"
		end
	end

	def destroy
		@workout.destroy
		redirect_to workouts_path, alert: "已刪除"
	end

	private

	def workout_params
		params.require(:workout).permit(:date, :workout, :mood, :length)
	end

	def find_workout
		@workout = Workout.find(params[:id])
	end
	
end
