class LinksController < ApplicationController
  def new; end

  def create
    link = Link.create!(href: params[:href])
    @hash = UrlShortener.encode(link.id)
  end
end
