class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]


    def index
      if logged_in? && @user == current_user
        @workouts = Workout.all
      else
        redirect_to signin_path
      end
    end

    def new
      if logged_in? && @user = current_user
        @workout = Workout.new
      else
        redirect_to signin_path
      end
    end

    def create
      if logged_in? && @user = current_user
        @workout = Workout.new(workout_params)
        @workout.user = current_user
          if @workout.save
            session[:workout_id] = @workout.id
            redirect_to workout_path(@workout)
          else
            render :new
          end
      else
          redirect_to signin_path
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
