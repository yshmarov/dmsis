class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  def to_s
    id
  end
  validates :email, uniqueness: true
  has_many :ideas
  def username
    self.email.split(/@/).first
  end
  def total_ideas
    ideas.count
  end
    
end
