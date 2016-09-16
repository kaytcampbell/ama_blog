class Post < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
  has_attached_file :photo, styles: { medium: "300x300>", large: "1000x1000>", thumb: "100x100>" }
  validates_attachment :photo, content_type: { content_type: /\Aimage\/.*\Z/ }
  has_many :popular_posts
end
