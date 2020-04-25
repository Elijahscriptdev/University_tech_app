class Student < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { minimum: 3, maximum: 25 }

  validates :password, presence: true,
                       length: { minimum: 6, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  has_many :student_courses
  has_many :courses, through: :student_courses, dependent: :destroy
end
