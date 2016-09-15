class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
  has_attached_file :photo
  validates_attachment :photo, content_type: { content_type: /\Aimage\/.*\Z/ }
end
