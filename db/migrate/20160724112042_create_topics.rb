class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :information
      
      t.references :chat
      t.timestamps
    end
  end
end
