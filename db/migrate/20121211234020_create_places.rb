class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string     :name_en
      t.string     :name_lv
      t.string     :name_ru
      t.integer    :city_id
      t.text       :address

      t.timestamps
    end
  end
end
