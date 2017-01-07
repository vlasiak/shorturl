class LinksController < ApplicationController
  def new; end

  def create
    link = Link.create!(href: params[:href])
    @short_url = request.host + '/' + UrlShortener.encode(link.id)
  end
end
