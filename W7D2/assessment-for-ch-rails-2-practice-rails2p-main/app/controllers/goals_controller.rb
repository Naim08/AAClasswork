class GoalsController < ApplicationController

    def index
        @goals = Goal.all
        render :index
    end

    def show
        @goal = Goal.find(params[:id])
        render :show
    end

    def new
        @goal = Goal.new
        #debugger
        render :new
    end

    def create
        @goal = Goal.new(goal_params)
        if @goal.save
          #debugger
         # p @goal
         redirect_to user_url(@goal[:user_id])
        else
            flash.now[:errors] = @goal.errors.full_messages
            redirect_to user_url(@goal[:user_id])
        end
    end

    def edit
        @goal = Goal.find(params[:id])
        render :edit
    end

    def update
        @goal = Goal.find(params[:id])
        if @goal.update(goal_params)
            redirect_to goal_url(@goal)
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :edit
        end
    end

    def destroy
        @goal = Goal.find(params[:id])
        @goal.destroy
        redirect_to goals_url
    end

  private

    def goal_params
      params.require(:goal).permit(:name, :details, :status, :user_id)
    end
end
