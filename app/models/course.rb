class Course < ActiveRecord::Base
  attr_accessible :trainer_id, :course_description_id, :start_time, :end_time, :status,
                  :name_zh, :description_zh, :location_zh, :city_zh, :discount_zh,
                  :name_en, :description_en, :location_en, :city_en, :discount_en

  belongs_to :trainer
  has_many :registers, :dependent => :destroy
  has_many :class_photos, :dependent => :destroy
  belongs_to :course_description

  validates :name, :length => { :in => 2..200 }
  # validates :description, :length => { :in => 2..100000 }
  validates :city, :presence => true
  validates :location, :length => { :in => 2..300 }
  validates :status, :presence => true
  validates :discount, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :trainer_id, :presence => true

  scope :by_year, lambda { |year| where('extract(year from start_time) = ?', year) }
  scope :active, lambda {where('start_time > ?', Time.now)}
  scope :inactive, lambda {where('start_time <= ?', Time.now)}

  def active?
    start_time > Time.now
  end

  # For I18n.
  #
  #name
  #description
  #city
  #location
  #discount
  #

  %w{name description city location discount}.each do |attr_name|
    define_method attr_name do
      send("#{attr_name}_#{I18n.locale}") || send("#{attr_name}_zh")
    end
  end
end