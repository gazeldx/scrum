class NewsAndEvent < ActiveRecord::Base
  attr_accessible :category, :description, :keywords, :posted_on, :ref_link, :slug, :status, :abstract_zh, :body_zh, :title_zh, :abstract_en, :body_en, :title_en

  extend FriendlyId

  CATEGORY = %w[Newsletter News Event Promotion]
  STATUS = %w[offline online]

  validates :title_zh, :abstract_zh, :title_en, :abstract_en, :posted_on, presence: true
  validates_presence_of :ref_link, message: "required if category is newsletter", if: proc { |attributes| attributes[:category] == 'Newsletter' }
  validates_presence_of :body_zh, :body_en, message: "required for news", if: proc { |attributes| attributes[:category] == 'News' }
  validates_inclusion_of :category, in: CATEGORY

  scope :online, where(status: 'online')

  friendly_id :title_en, use: :slugged

  # For I18n.
  #
  #title
  #abstract
  #body
  #

  %w{title abstract body}.each do |attr_name|
    define_method attr_name do
      send("#{attr_name}_#{I18n.locale}") || send("#{attr_name}_zh")
    end
  end

end
