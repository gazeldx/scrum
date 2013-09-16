class Trainer < ActiveRecord::Base
  attr_accessible :avatar, :email, :phone, :url, :base, :need_assistant,
                  :name_zh, :description_zh, :bio_zh, :work_as_zh,
                  :name_en, :description_en, :bio_en, :work_as_en

  has_many :courses, :dependent => :destroy

  mount_uploader :avatar, AvatarUploader

  validates :name, :length => { :in => 2..100 }
  #validates :email, :uniqueness => true, :length => { :in => 9..36 }
  validates :url, :uniqueness => true, :length => { :in => 1..50 }

  # For I18n.
  #
  #name
  #description
  #bio
  #work_as
  #

  %w{name description bio work_as}.each do |attr_name|
    define_method attr_name do
      send("#{attr_name}_#{I18n.locale}") || send("#{attr_name}_zh")
    end
  end

end
