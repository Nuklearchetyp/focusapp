class UsersController < ApplicationController
  before_action :authenticate_user!
    
  def show
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to :action => 'index'
  end
  
  def index
    @users = User.order('last_name ASC')
  end

  def profile
    @user = User.find(params[:id])
  end
end
