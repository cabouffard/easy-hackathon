class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  def set_locale
    I18n.locale = cookies.signed[:locale] || extract_locale_from_accept_language_header
  end

  def extract_locale_from_accept_language_header
    case request.env['HTTP_ACCEPT_LANGUAGE'].to_s.scan(/^[a-z]{2}/).first
    when 'en'
      'en'
    when 'fr'
      'fr'
    else
      I18n.default_locale
    end
  end
end
