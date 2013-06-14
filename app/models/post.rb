class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_images, :order => 'image_order ASC'
  has_and_belongs_to_many :tags

  attr_accessible :body, :title, :date, :live, :comment_ids, :comments_attributes, :post_image_ids, :post_images_attributes, :tag_ids

  accepts_nested_attributes_for :post_images, :allow_destroy => true
  accepts_nested_attributes_for :comments, :allow_destroy => true

  validates :title, :uniqueness => true
  validates :title, :body, :presence => true

  scope :chronological, :order => "created_at ASC", :conditions => 'live IS TRUE'

  paginates_per 5

  def next_chronologically
    index = Post.chronological.index self
    Post.chronological[index+1]
  end

  def previous_chronologically
    index = Post.chronological.index self
    Post.chronological[index-1]
  end

  def to_param
    title.gsub ' ', '_'
  end

  def self.find_by_param input
      find_by_title input.gsub '_', ' '
  end

end
