class CreateTopicResults < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_results do |t|
      t.text :results
      t.references :topic
      t.timestamps
    end
  end
end
