class Week < ApplicationRecord
	has_many :weekly_reports, dependent: :destroy
end
