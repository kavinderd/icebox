class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    UrlParser.generate_link(params.fetch(:link).fetch(:url))
    flash[:notice] = "Link was successfully created"
    redirect_to links_path
  end

  def index
    @links = Link.all
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
