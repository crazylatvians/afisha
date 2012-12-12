class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string    :title_en
      t.text      :description_en
      t.string    :title_lv
      t.text      :description_lv
      t.string    :title_ru
      t.text      :description_ru
      t.integer   :length
      t.integer   :type_id

      t.timestamps
    end
  end
end
