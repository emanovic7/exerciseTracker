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
    @exercise = Exercise.new(exercise_params)
      if @exercise.save
        session[:exercise_id] = @exercise.id
        
        redirect_to exercise_path(@exercise)
      else
        render :new
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
