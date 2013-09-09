class Comment < ActiveRecord::Base
  attr_accessible :body_zh, :comment_by_zh,
                  :body_en, :comment_by_en

  belongs_to :commentable, polymorphic: true

  validates_presence_of :body

  # For I18n.
  #
  #body
  #comment_by
  #

  %w{body comment_by}.each do |attr_name|
    define_method attr_name do
      send("#{attr_name}_#{I18n.locale}") || send("#{attr_name}_zh")
    end
  end
end
