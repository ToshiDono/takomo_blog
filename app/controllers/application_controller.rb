class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do
    redirect_to main_app.root_url, notice: t('errors.messages.access_denied')
  end
end
