# frozen_string_literal: false

# This class inherits from the Application Controller
class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def new; end
  def show; end
  def edit; end

  def index
    @tasks = Task.all
    flash.now[:notice] = "We have exactly #{@tasks.size} tasks available."
  end

  def create
    @task = Task.new(task_params)
    return flash.alert = %(Fields can't be blank!) unless @task.valid?

    @task.save
    redirect_to task_path(@task)
  end

  def update
    @task.update(task_params)
    return flash.alert = %(Fields can't be blank!) unless @task.valid?

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
