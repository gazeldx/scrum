class Course < ActiveRecord::Base
  attr_accessible :name, :description, :location, :start_time, :end_time, :status, :trainer_id
  belongs_to :trainer
  has_many :registers, :dependent => :destroy
  
  validates :name, :length => { :in => 2..200 }
  validates :description, :length => { :in => 2..100000 }
  validates :location, :length => { :in => 2..300 }
  validates :status, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :trainer_id, :presence => true  
end