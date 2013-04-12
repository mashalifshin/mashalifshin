class Post < ActiveRecord::Base
  has_many :comments

  attr_accessible :body, :title

  validates :title, :uniqueness => true
  validates :title, :body, :presence => true

  scope :chronological, :order => "created_at DESC"
end
