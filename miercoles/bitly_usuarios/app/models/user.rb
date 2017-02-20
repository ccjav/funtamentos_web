class User < ActiveRecord::Base
  has_many :urls, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end

