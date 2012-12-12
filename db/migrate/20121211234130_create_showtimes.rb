class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.integer     :event_id
      t.datetime    :time

      t.timestamps
    end
  end
end
