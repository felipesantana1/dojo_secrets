class Secret < ActiveRecord::Base

  validates :secret, presence: true, length: { in: 10..255 }
  validates :user, presence: true

  has_many :likes
  has_many :users, through: :likes
  belongs_to :user

end
