class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def redirect_back_or_to_default(path = "/")
    if referrer = request.headers["Referer"]
      redirect_to referrer
    else
      redirect_to path
    end
  end
end
