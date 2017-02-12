class Product < ApplicationRecord
	has_many :competencies, dependent: :destroy
end