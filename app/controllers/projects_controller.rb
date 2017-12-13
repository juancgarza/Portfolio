class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
    3.times { @project.technologies.build }
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params.require(:project).permit(:title,:subtitle,:body,technologies_attributes:[:name]))

    respond_to do |format|
      if @project.save
        format.html {redirect_to projects_path, notice: "Your portfolio item is now live"}
      else
        format.html {render :new}
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(params.require(:project).permit(:title,:subtitle,:body))
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @technology_set = Technology.find(params[:project_id])
    @project.destroy
    respond_to do |format|
      format.html {redirect_to projects_url, notice:"Record was removed"}
    end
  end

end
