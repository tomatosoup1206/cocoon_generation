class ProjectsController < ApplicationController

  # GET /projects/new
  def new
    @project = Project.new
    task = @project.tasks.build
    item = task.items.build
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to projects_path
  end

  def index
    @project = Project.all
    @task = Task.all
    @item = Item.all
  end

  private
    
    def project_params
      params.require(:project).permit(:title, :body, task_attributes: [:id, :name, :quantity, :_destroy, item_attributes: [:id, :detail, :people, :_destroy]])
    end
end
