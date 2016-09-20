class ProjectsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js


  def index
    @projects = Project.all
    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC")
    else
      @projects = Project.all.order("title DESC")
    end   
    respond_with(@projects)
  end

  def show
    @project = Project.find(params[:id])
    if @project.completed
      redirect_to project_data_path(:project_id => params[:id])
    end  
    rescue ActiveRecord::RecordNotFound
        redirect_to :action => 'index'
  end

  def data
    @project = Project.find(params[:project_id])
    if !(@project.projectleader_id == current_user.id || @project.moderator_id == current_user.id)
      redirect_to projects_path
    end  
  end

  def new
    @project = Project.new
    @project.build_chat(:project_id => params[:id], :deadline => params[:deadline])
    respond_with(@project)
  end

  def create
    @project = Project.create(project_params)
    @project.projectleader = current_user
    @project.chat_id = @project.chat.id
    @project.completed = false
    @project.save
    respond_with(@project)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @chat = Chat.find(@project.chat_id)
    @chat.destroy
    @project.destroy
    redirect_to :action => 'index'
  end

  def complete
    @project = Project.find(params[:project_id])
    @project.update_attribute(:completed,1)
    redirect_to :action => 'data'
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :information, :projectleader_id, :moderator_id, :user_ids => [],  chat_attributes: [:id, :deadline])
    end
end
