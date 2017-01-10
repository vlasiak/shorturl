class LinksController < ApplicationController
  def new; end

  def create
    link = Link.create!(href: params[:href])
    hash = UrlShortener.encode(link.id)
    @short_url = request.host_with_port + '/' + hash
  end
end
