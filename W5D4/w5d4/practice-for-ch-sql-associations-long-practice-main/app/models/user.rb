# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :enrollments,
    class_name: :Enrollment,
    foreign_key: :student_id,
    primary_key: :id

    has_many :taught_courses,
    class_name: :Course,
    foreign_key: :instructor_id,
    primary_key: :id


    has_many :courses, through: :enrollments, source: :course
end
