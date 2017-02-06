module ApplicationHelper
  def available_languages
    Dir.glob("#{Rails.root}/config/locales/*.yml")
        .map{ |file| file.sub(/.*\/(\w+).yml/, '\1') }
        .reject{ |lng| lng.to_s == I18n.locale.to_s }
  end
end
