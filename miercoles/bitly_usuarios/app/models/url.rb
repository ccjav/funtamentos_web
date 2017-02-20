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