class User < ActiveRecord::Base
  has_many :urls, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end

class Url < ActiveRecord::Base
  belongs_to :user
  before_create :shorten_link
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, allow_blank: true
  def shorten_link
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    string = (0...6).map { o[rand(o.length)] }.join
    self.short_url = "http://www.sho.rt/#{string}"
  end
end