# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }
  validates :username, presence: true, length: { in: 4..15 },
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 244 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :posts
end
