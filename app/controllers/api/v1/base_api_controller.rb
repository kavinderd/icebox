class Api::V1::BaseApiController < ApplicationController
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json
  

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  private

  def authenticate_user_from_token!
    user_email = request.headers["X-API-EMAIL"].presence
    user_auth_token = request.headers["X-API-TOKEN"].presence
    user = user_email && User.find_by_email(user_email)

    if user && Devise.secure_compare(user.authentication_token, user_auth_token)
      sign_in(user, store: false)
    else
      warden.custom_failure!
      render json: { success: false, message: "Missing or Invalid Token and Email"}, status: 401 
    end
  end

end
