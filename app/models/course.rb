class Course < ApplicationRecord
  has_many :lessons
  has_many :assignments
  has_many :enrollments
  has_many :users, through: :enrollments
end
