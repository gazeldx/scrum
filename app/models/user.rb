class User < ActiveRecord::Base
  attr_accessible :email, :login, :reviewed

  validates_presence_of :email, :login
  validates_uniqueness_of :email, :login, allow_nil: true, message: "already exist."
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_nil: true, message: "is invalid"
  validates_format_of :login, with: /[%w_-]*/, allow_nil: true, message: "is invalid"
  validates_size_of :login, :within => 6..20, allow_nil: true, too_long: "is too long (maximum is %{count} characters)", too_short: "is too short (min is %{count} characters)"

  scope :unreviewed, where(reviewed: false)
end
