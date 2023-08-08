class Goal < ApplicationRecord
  validates :name, :details, presence: true


  belongs_to :user, inverse_of: :goals

end
