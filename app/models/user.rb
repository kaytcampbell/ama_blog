class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # add back :registerable to add users from the ui
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
end
