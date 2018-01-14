class ProjectsController < ApplicationController
   layout 'project'
  before_action :set_project, only: [:show,:edit,:update,:destroy]
  access all: [:show,:index], user: {except: [:destroy,:new,:create,:update,:edit]} , site_admin: :all
  def index
    @projects = Project.all
    @repos = Github.repos.list user:"juancgarza"
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
