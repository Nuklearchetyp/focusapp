class PagesController < ApplicationController
  def contact
  end

  def help
  end

  def welcome
    if user_signed_in?
      redirect_to user_path(current_user)
    end  
  end
end
