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

    # TODO(cab): Figure out how to change the locale of the URL, right now it
    # redirect to the same "locale" url but with a different locale
    redirect_to :back
  end
end
