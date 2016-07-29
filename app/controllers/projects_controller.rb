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
    rescue ActiveRecord::RecordNotFound
        redirect_to :action => 'index'
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

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :information, :projectleader_id, :moderator_id, :user_ids => [],  chat_attributes: [:id, :deadline])
    end
end
