class EventSerializer < ActiveModel::Serializer
  embed :events

  attributes :id, :title_lv, :title_en
end
