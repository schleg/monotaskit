class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new params[:task]
    if @task.save
      flash[:notice] = "Task created"
      redirect_to root_path
      return
    end
    render :new
  end
  
end
