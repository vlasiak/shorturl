class RedirectsController < ApplicationController
  def perform
    id = UrlShortener.decode(params[:hash])
    href = Link.find(id).href

    redirect_to href
  end
end
