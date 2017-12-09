class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params.require(:project).permit(:title,:subtitle,:body))

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

end
