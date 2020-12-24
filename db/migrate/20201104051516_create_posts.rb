class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string "name"
      t.string "track"
      t.string "car"
      t.string "tyre"
      t.float "lap_time", :null => false
      t.datetime "event_time_date"
      t.string "weather"

      t.timestamps
    end
  end
end
