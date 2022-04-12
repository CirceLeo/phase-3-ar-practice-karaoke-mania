class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.integer :karaoke_singer_id
      t.integer :song_id
    
      t.timestamps
    end
  end
end
