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
    @links = current_user.links
  end

  def show
    @link = current_user.links.find(params.fetch(:id))
    @content= Pismo::Document.new(@link.url).body
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
