class Project < ActiveRecord::Base
  has_one :permission, as: :target
  has_many :aliases, -> { where { deleted.eq(false) & preferred_name_id.not_eq(nil) } }
  has_many :contributions
  has_many :positions
  belongs_to :logo
  belongs_to :best_analysis, foreign_key: :best_analysis_id, class_name: :Analysis
  belongs_to :organization

  scope :deleted, -> { where(deleted: true) }

  def to_param
    url_name
  end

  def active_managers
    Manage.for_project(self).active.to_a
  end
end
