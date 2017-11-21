class TasksController < ApplicationController
  def index
  @tasks = Task.all
  # GET /tasks
  end

  def show
  @tasks = Task.find(params[:id])          # GET /tasks/:id
  end

  def new
  @task = Task.new           # GET /tasks/new
  end

  def create
  @task = Task.new(task_params)
  @task.save        # POST /tasks
  redirect_to tasks_path(@task)
  end

  def edit
  @task = Task.find(params[:id])          # GET /tasks/:id/edit
  end

  def update
  @task = Task.find(params[:id])
  @task.update(task_params)
          # PATCH /tasks/:id
  redirect_to tasks_path(@task)
  end

  def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to tasks_path(@task)     # DELETE /tasks/:id
  end

  private

  def task_params
    params.require(:task).permit(:name, :details)
  end
end
