class User < ActiveRecord::Base

  before_save :parse_user

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: {minimum: 6}, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }
  has_secure_password

  def parse_user
    # normalize email to lowercase
    self.email.downcase! if self.email
    # make name look right
    self.name = self.name.split(" ").map { |s| s.capitalize }.join(" ") if self.name
  end
end
