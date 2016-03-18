class LocaleController < ApplicationController
  def switch
    case params[:locale]
    when 'fr'
      locale = :fr
    when 'en'
      locale = :en
    end

    if I18n.available_locales.include?(locale)
      cookies.permanent.signed[:locale] = locale
    end

    redirect_to :back
  end
end
