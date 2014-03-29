class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :app_id
      t.string :content
      t.string :sound
      t.integer :badge
      t.boolean :is_debug

      t.timestamps
    end
    
    add_index :notifications, :app_id
  end
end
