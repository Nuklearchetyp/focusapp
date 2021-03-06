module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    #from: https://www.sitepoint.com/create-a-chat-app-with-rails-5-actioncable-and-devise/
    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
      user_id = request.headers['HTTP_AUTHORIZATION']
      if verified_user = User.find_by(user_id)
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
