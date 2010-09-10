class TasksController < ApplicationController
  
  def index
    @tasks = @current_user.tasks
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new params[:task]
    @task.user_id = @current_user.id
    if @task.save
      flash[:notice] = "Task created"
      redirect_to root_path
      return
    end
    render :new
  end
  
  def start
    @task = Task.find params[:id]
    @task.started = DateTime.now
    @task.save
    redirect_to root_path
  end
  
  def stop
    @task = Task.find params[:id]
    @task.started = nil
    @task.save
    redirect_to root_path
  end
  
end
