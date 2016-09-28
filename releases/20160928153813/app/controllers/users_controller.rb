class UsersController < ApplicationController
  before_action :authenticate_user!
    
  def show
    @user = User.find(params[:id])
    @user_projects = @user.projects
    if @user.id != current_user.id
      redirect_to users_path
     #redirect_to :action => 'profile'
    end  
    rescue ActiveRecord::RecordNotFound
      redirect_to users_path
  end
  
  def index
    @users = User.order('last_name ASC')
  end

  def profile
    @user = User.find(params[:id])
  end
end
