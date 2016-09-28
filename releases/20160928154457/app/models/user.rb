class User < ApplicationRecord
  belongs_to :role, optional: true
  has_many :messages
  has_and_belongs_to_many :projects, optional: true
  before_create :set_default_role
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  #client side validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  
  def name
    first_name + " " + last_name
  end

  def set_default_role
    self.role ||= Role.find_by_name('user')
  end
           
end
