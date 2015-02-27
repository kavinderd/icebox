class Api::V1::LinksController < Api::V1::BaseApiController

  def create
    @link = UrlParser.generate_link(url: link_params.fetch(:url), user: current_user)
    render json: @link
  end

  def link_params
    params.require(:link).permit(:url)
  end
end
