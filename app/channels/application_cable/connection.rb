
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.name
    end

    private

    def find_verified_user
      # or however you want to verify the user on your system
      access_token = request.params[:'access-token']
      client_id = request.params[:client]
      verified_user = env['warden'].user
      if verified_user && verified_user&.valid_token?(access_token, client_id)
        verified_user
      else
        reject_unauthorized_connection
      end
    end

    protected

    def find_user(key_sym, value)
      User.find_by(key_sym => value)
    end
  end
end