class LinksController < ApplicationController
  before_action :authenticate_user!

  def new
    @link = Link.new
  end

  def create
    UrlParser.generate_link(url: params.fetch(:link).fetch(:url), user: current_user)
    flash[:notice] = "Link was successfully created"
    redirect_to links_path
  end

  def index
    @links = current_user.links
  end

  def show
    @link = Link.find(params.fetch(:id))
    @content= Pismo::Document.new(@link.url).body
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
