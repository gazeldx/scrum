class Message < ActiveRecord::Base
  attr_accessible :body, :company, :email, :name, :phone
end
