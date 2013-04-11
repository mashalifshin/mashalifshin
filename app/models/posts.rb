class Posts < ActiveRecord::Base
  has_many :comments

  attr_accessible :body, :date, :title

  scope :chronological, :order => "created_at DESC"
end
