class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end