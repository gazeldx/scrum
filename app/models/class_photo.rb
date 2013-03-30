class ClassPhoto < ActiveRecord::Base
  attr_accessible :avatar, :course_id
  belongs_to :course
  mount_uploader :avatar, ClassPhotoUploader
end
