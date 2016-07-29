class User < ApplicationRecord
  belongs_to :role
  has_many :messages
  has_and_belongs_to_many :projects
  
  
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
           
end
