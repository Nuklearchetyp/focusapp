class Project < ApplicationRecord
  belongs_to :projectleader, :class_name => "User"
  belongs_to :moderator, :class_name => "User"
  has_one :chat, :class_name => "Chat", inverse_of: :project 
  has_and_belongs_to_many  :users
  
  accepts_nested_attributes_for :chat, :allow_destroy => true

  validates :title, presence: true
  
  after_initialize :add_chat
  
  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
    else
      find(:all)
    end
  end
  
  private
    def add_chat
      chat || build_chat
    end
  
end
