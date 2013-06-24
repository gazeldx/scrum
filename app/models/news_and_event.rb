class NewsAndEvent < ActiveRecord::Base
  attr_accessible :abstract, :body, :category, :description, :keywords, :posted_on, :ref_link, :slug, :status, :title

  CATEGORY = %w[Newsletter News Event Promotion]
  STATUS = %w[online offline]

  validates :title, :abstract, :posted_on, presence: true
  validates_presence_of :ref_link, message: "required if category is newsletter", if: proc { |attributes| attributes[:category] == 'Newsletter' }
  validates_inclusion_of :category, in: CATEGORY

  scope :online, where(status: 'online')

end
