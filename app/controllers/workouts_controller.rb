class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]


    def show
      @workout = Workout.find(params[:id])
    end

    def index
      @workouts = Workout.all
    end

    def new
      @workout = Workout.new(user_id: params[:user_id])
    end

    def create
      respond_to do |format|
        if logged_in?
          @workout = current_user.workouts.build(workout_params)
          @workout.save
          session[:workout_id] =@workout.id
            format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        else
            format.html { redirect_to root_url }
            end
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
        :description,
        :user_id
        )
      end

      def set_workout
        @workout = Workout.find(params[:id])
      end


end
