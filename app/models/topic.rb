class Topic < ApplicationRecord
  belongs_to :chat
  has_one :topic_result
end
