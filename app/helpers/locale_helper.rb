module LocaleHelper
  def locale_toggle
    link_to t('locale.switch_abbr'), locale_switch_path(I18n.locale == :en ? :fr : :en)
  end
end
