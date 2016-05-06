class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  before_save :parse_email
  before_save { self.role ||= :member }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: {minimum: 6}, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }
  has_secure_password

  enum role: [:member, :admin]

  def parse_email
    self.email.downcase! if self.email
  end
end