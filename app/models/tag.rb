class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  validates :name, :uniqueness => true
  validates :name, :presence => true

  rails_admin do
    field :name
    field :posts do
      inverse_of :tags
    end
  end

  def self.find_by_param input
    find_by_name input.gsub '_', ' '
  end

  def to_param
    title.gsub ' ', '_'
  end

end
