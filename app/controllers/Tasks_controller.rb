class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @tasks = Task.new

  end  

  def show
    @tasks = Task.find(params[:id])
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save
    redirect_to task_path(@tasks)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end

end