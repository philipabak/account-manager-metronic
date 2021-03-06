class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def raise_not_found!
    # render 'visitors/404'
    render :file => 'public/404.html', :status => :not_found, :layout => false
  end

end
