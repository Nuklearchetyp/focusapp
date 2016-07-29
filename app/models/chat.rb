class Chat < ApplicationRecord
  belongs_to :project, inverse_of: :chat
  has_many :messages, dependent: :destroy
  has_many :topics, inverse_of: :chat
  validates :deadline, presence: true
  
  accepts_nested_attributes_for :topics, :allow_destroy => true
end
