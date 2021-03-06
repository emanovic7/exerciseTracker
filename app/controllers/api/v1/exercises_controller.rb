
class Api::V1::ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]



   def index
     #@exercises = Exercise.all
     render json: Exercise.all
   end

  def show
    #@exercise = Exercise.find(params[:id])
    render json: Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new(workout_id: params[:workout_id], user_id: params[:user_id])
  end


  # def create
  #   respond_to do |format|
  #     if current_workout.id == @workout.id
  #       @exercise = current_workout.exercises.build(exercise_params)
  #       binding.pry
  #       @exercise.save
  #
  #       session[:exercise_id] = @exercise.id
  #       format.html { redirect_to current_workout }
  #     else
  #       format.html{ redirect_to workouts_path }
  #     end
  #   end
  # end

  def create
    exercise = Exercise.create(exercise_params)
    render json: exercise
  end


  def edit

  end

  # def update
  #   if @exercise.update(exercise_params)
  #     redirect_to exercise_path(@exercise)
  #   else
  #     render :edit
  #   end
  # end

  def update
    exercise = Exercise.find(params[:id])
    exercise.update_attributes(exercise_params)
    render json: exercise
  end

  def destroy
    #@exercise.delete
    Exercise.destroy(params[:id])
  end



private
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end


  def exercise_params
    params.require(:exercise).permit(
    :name,
    :description,
    :sets,
    :reps,
    :rest,
    :workout_id,
    :user_id
    )
  end

end
