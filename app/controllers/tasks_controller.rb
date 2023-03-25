class TasksController < ApplicationController
    before_action :set_task, only: %i[ toggle show edit update destroy]

    def toggle
        @task.update(completed: params[:completed])

        render json: { message: "Success" }
    end

    def index
        @tasks = Task.all
    end

    def create
        @task = Task.new(task_params)
    
        respond_to do |format|
          if @task.save
            format.html { redirect_to tasks_url, notice: "Task was successfully created" }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @task.update(task_params)
                format.html { redirect_to tasks_url, notice: "Successful updated" }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy 
        @task.destroy
        redirect_to tasks_url, notice: "Successfully deleted"
    end
    
    private
    
    def task_params
        params.require(:task).permit(:description)
    end

    def set_task
        @task = Task.find(params[:id])
    end

end
