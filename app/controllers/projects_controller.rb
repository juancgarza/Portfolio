class ProjectsController < ApplicationController
  before_action :set_project, only: [:show,:edit,:update,:destroy]
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
    3.times { @project.technologies.build }
  end

  def show
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html {redirect_to projects_path, notice: "Your portfolio item is now live"}
      else
        format.html {render :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @technology_set = Technology.find(params[:project_id])
    @project.destroy
    respond_to do |format|
      format.html {redirect_to projects_url, notice:"Record was removed"}
    end
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title,
                                    :subtitle,
                                    :body,
                                    technologies_attributes:[:name])
  end

end
