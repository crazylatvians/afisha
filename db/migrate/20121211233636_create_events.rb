class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string    :title_en
      t.string    :title_lv
      t.text      :description_lv
      t.string    :slug_lv
      t.string    :title_ru
      t.text      :description_ru
      t.string    :slug_ru
      t.integer   :length
      t.integer   :type_id
      t.string    :trailer

      t.timestamps
    end  

    add_attachment :events, :poster

    add_index :events, :slug_lv
    add_index :events, :slug_ru
  end
end
