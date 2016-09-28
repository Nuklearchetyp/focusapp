class AddCurrentTopicToChat < ActiveRecord::Migration[5.0]
  def change
  	add_reference :chats, :currenttopic, index: true
  end
end
