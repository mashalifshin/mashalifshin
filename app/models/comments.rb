class Comments < ActiveRecord::Base
  attr_accessible :approved, :body, :name, :post_id
end
