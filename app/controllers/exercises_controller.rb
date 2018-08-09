class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]


   def index
     @exercises = Exercise.all
   end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
      @exercise = Exercise.new
  end


  def create
    respond_to do |format|
     if logged_in?
       current_workout = current_user.workouts.find(params[:id])
        @exercise = current_workout.exercises.build(exercise_params)
        @exercise.save
        session[:exercise_id] = @exercise.id

        format.html { redirect_to workout_path(current_workout) }
      else
        format.html { render :new }
      end
    end
  end


  def edit

  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise)
    else
      render :edit
    end
  end

  def destroy
    @exercise.delete
  end



private
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def set_workout
    @workout = current_workout
  end


  def exercise_params
    params.require(:exercise).permit(
    :name,
    :description,
    :sets,
    :reps,
    :rest
    )
  end

end
