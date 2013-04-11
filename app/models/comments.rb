class Comments < ActiveRecord::Base
  belongs_to :post

  attr_accessible :approved, :body, :name, :post_id
end
