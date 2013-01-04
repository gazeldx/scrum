class Trainer < ActiveRecord::Base
  attr_accessible :avatar, :description, :email, :name, :phone, :url
end
