class User < ActiveRecord::Base

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: {minimum: 6}, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  # You should keep methods simple, one method should do one thing.
  before_save :scrub_email
  before_save :scrub_name

  has_secure_password

  def scrub_email
    # normalize email to lowercase
    self.email.downcase! if self.email
  end
  
  def scrub_name
    # make name look right
    self.name = self.name.split(" ").map { |s| s.capitalize }.join(" ") if self.name
  end

end
