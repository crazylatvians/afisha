class Event < ActiveRecord::Base
  
  attr_accessible :title_en, :title_lv, :description_lv, :title_ru, :description_ru, :trailer, :poster
  has_attached_file :poster, styles: { medium: "300x300>", thumb: "120x170>" },
                    convert_options: { thumb: "-quality 96" }

  include FriendlyId
  friendly_id :title_lv, use: [:slugged, :simple_i18n]

  def slug locale
    "/#{locale}/#{locale == 'ru' ? self.slug_ru : self.slug_lv }"
  end

  def title locale
    locale == 'ru' ? self.title_ru : self.title_lv
  end

  def description locale
    locale == 'ru' ? self.description_ru : self.description_lv
  end

end
