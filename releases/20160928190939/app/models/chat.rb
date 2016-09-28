class Chat < ApplicationRecord
  belongs_to :project, inverse_of: :chat, optional: true
  has_many :messages, dependent: :destroy
  has_many :topics, inverse_of: :chat
  has_one :currenttopic, :class_name => "Topic"
  validates :deadline, presence: true
end
