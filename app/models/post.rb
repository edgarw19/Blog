class Post < ActiveRecord::Base
  attr_accessible :Post, :Title
  has_many :comments, dependent: :destroy
  validates :Title, presence: true, length: { minimum: 5 }
end
