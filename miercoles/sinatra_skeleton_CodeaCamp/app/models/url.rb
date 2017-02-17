class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_create :shorten_link
  # validates :url, :uniqueness => true
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, allow_blank: true
  # def validate!
  #   errors.add(:url, :blank, message: "cannotfsdfsda be nil") if url.nil?
  # end
    def shorten_link
      # http://stackoverflow.com/questions/88311/how-best-to-generate-a-random-string-in-ruby
      o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
      string = (0...6).map { o[rand(o.length)] }.join
      self.short_url = "http://www.sho.rt/#{string}"
    end
end
