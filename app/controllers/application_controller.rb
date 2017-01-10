class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :render_404
  end

  private

  def render_404
    respond_to do |format|
      format.html { render file: 'public/404.html', layout: false, status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
end
