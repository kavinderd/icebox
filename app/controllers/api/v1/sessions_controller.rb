class Api::V1::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, only: :create
  include Devise::Controllers::Helpers
  respond_to :json

  def create
    if self.resource = warden.authenticate(auth_options)
      sign_in(resource_name, resource)
      data = {
        authentication_token: self.resource.authentication_token,
        email: self.resource.email
      }
      render json: data, status: 201 
    else
      render json: { error: "Invalid Email or Password" }, status: 401
    end
  end
end
