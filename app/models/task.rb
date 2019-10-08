class Task < ApplicationRecord
	belongs_to :project
	has_many :items, inverse_of: :task
	accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
end
