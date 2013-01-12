class Trainer < ActiveRecord::Base
  attr_accessible :avatar, :description, :email, :name, :phone, :url, :bio, :base, :work_as

  has_many :courses, :dependent => :destroy


  mount_uploader :avatar, AvatarUploader

  validates :name, :length => { :in => 2..100 }
  #validates :email, :uniqueness => true, :length => { :in => 9..36 }
  validates :url, :uniqueness => true, :length => { :in => 1..50 }
end
