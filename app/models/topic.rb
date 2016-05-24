class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  scope :visible_to, -> (user) { user ? all : where(public: true) }
  scope :publicly_viewable, -> { visible_to(nil).where(public: true) }
  scope :privately_viewable, -> (user) { visible_to(user).where(public: false) }
end
