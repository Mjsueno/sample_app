class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def feed
    # Micropost.where("user_id = ?", id)
    self.microposts
  end

end