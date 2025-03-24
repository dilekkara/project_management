
class Project < ApplicationRecord
  belongs_to :advisor, class_name: 'User', foreign_key: 'advisor_id'
  has_many :project_requests

  validates :title, presence: true
  validates :description, presence: true

  after_initialize :set_default_published, if: :new_record?

  private

  def set_default_published
    self.published ||= true
  end
end

