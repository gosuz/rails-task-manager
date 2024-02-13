class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # This action should fetch all tasks,
  end

  def show
    # This action should find a specific task, thanks to its id, directly from params.
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # allows us to edit the task (change its title, and details)
    @task = Task.find(params[:id])
    raise
  end

  def update
    # When they click submit, it should update
    raise
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
