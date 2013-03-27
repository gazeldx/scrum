class Student < ActiveRecord::Base
  attr_accessible :avatar, :title, :train_type, :trainer_id, :trainer_type

  mount_uploader :avatar, StudentUploader

end
