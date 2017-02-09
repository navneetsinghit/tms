class MgrCompetenciesController < ApplicationController
	def index
		@employees = User.with_role(:employee).order('first_name')
		@products = Product.all
	end	
end
