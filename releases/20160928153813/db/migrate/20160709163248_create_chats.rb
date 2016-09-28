class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.datetime :deadline

      t.timestamps
    end
    
    add_reference :projects, :chat
    add_reference :chats, :project
  end
end
