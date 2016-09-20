class Topic < ApplicationRecord
  belongs_to :chat, optional: true
  has_one :topic_result

  validates :title, presence: true

  accepts_nested_attributes_for :topic_result

  #after_create_commit { TopicBroadcastJob.perform_later(self)}

end
