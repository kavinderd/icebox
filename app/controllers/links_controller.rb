class LinksController < ApplicationController
  before_action :authenticate_user!

  def new
    @link = current_user.links.build
  end

  def create
    UrlParser.generate_link(url: link_params.fetch(:url), user: current_user)
    flash[:notice] = "Link was successfully created"
    redirect_to links_path
  end

  def index
    @links = current_user.links.unread
  end

  def show
    @link = current_user.links.find(params.fetch(:id))
    @content= Pismo::Document.new(@link.url).body
  end

  def read
    @link = current_user.links.find(params.fetch(:id))
    if @link.read!
      flash[:notice] = "Link marked as read"
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
