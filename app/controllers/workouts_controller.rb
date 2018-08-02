class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]


    def index
      @workouts = Workout.all
    end

    def new
      @workout = Workout.new
    end

    def create
      @workout = Workout.new(workout_params)
      @workout.user =user.id
      respond_to do |format|
         @workout.save
          format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        # else
        # format.html { render :new }
        # end
      end
    end


    def edit

    end

    def update
      if @workout.update(workout_params)
         redirect_to @workout
       else
         render :edit
       end
    end

    def destroy
      @workout.delete
    end



    private
      def workout_params
        params.require(:workout).permit(
        :name,
        :body_part,
        :description
        )
      end

      def set_workout
        @workout = Workout.find(params[:id])
      end


end
