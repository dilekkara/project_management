class Group < ApplicationRecord
  belongs_to :leader, class_name: "User"
  has_many :group_memberships
  has_many :students, through: :group_memberships, source: :student
end
