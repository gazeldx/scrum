class Register < ActiveRecord::Base
  attr_accessible :name, :mobile, :email, :company_name, :headcount, :remarks

  belongs_to :course
  
  validates :name, :length => { :in => 1..30 }
  validates :mobile, :length => { :in => 7..30 }
  validates :email, :length => { :in => 6..40 }
  validates :headcount, :numericality => { :only_integer => true }
  validates :course_id, :presence => true
end