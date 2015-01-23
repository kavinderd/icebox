class WelcomeController < ApplicationController
  before_filter :to_dashboard?

  def index
  end

  private

  def to_dashboard?
    if user_signed_in?
      redirect_to dashboard_index_path
    end
  end
end
