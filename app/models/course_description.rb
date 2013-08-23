class CourseDescription < ActiveRecord::Base
  attr_accessible :name_zh, :overview_zh, :features_zh, :bonus_zh, :audience_zh, :agenda_introduction_zh, :agenda_zh,
                  :name_en, :overview_en, :features_en, :bonus_en, :audience_en, :agenda_introduction_en, :agenda_en,
                  :comments_attributes

  has_many :comments, as: :commentable
  has_many :course

  validates_presence_of :name

  accepts_nested_attributes_for :comments, allow_destroy: true

  SPLIT_FLAG = /\r\n/
  # For I18n.
  #
  #name
  #overview
  #features
  #bonus
  #audience
  #agenda_introduction
  #agenda
  #

  %w{name overview features bonus audience agenda_introduction agenda}.each do |attr_name|
    define_method attr_name do
      value = send("#{attr_name}_#{I18n.locale}") || send("#{attr_name}_zh")
      attr_name == 'name' ? value : value.try(:split, SPLIT_FLAG)
    end
  end
end
