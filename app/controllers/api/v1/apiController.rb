module Api::V1
  class ApiController < ApplicationController
    # Global methods of Api v1 controller
    acts_as_token_authentication_handler_for User
    before_action :require_authentication! # based on current user, req this authentication

    private
      def require_authentication!
        throw(:warden, scope: :user) unless current_user.presence # if !current user, go throw error
      end
  end
end