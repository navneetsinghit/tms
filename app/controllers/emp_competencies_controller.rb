class EmpCompetenciesController < ApplicationController
	#before_action :find_competency, only:[:edit]
	def index
		#@competencies = current_user.competencies
		@products = Product.all
	end

	def edit
		@product = Product.find(params[:id])
		if(competency_exists?)
			@competency = find_competency
			if(@competency)
				@competency_level = @competency.competency_level
			end
		else
			@competency = Competency.new
			@competency.competency_level = 0
		end
	end

	def update
		@product = Product.find(params[:id])
		if(competency_exists?)
			find_competency
			if(@competency.update(competency_params))
				redirect_to emp_competencies_path
			else
				render 'edit'
			end
		else
			@competency =  Competency.new(competency_params)
			@competency.user_id = current_user.id
			@competency.product_id = params[:id]
			if @competency.save
				redirect_to emp_competencies_path
			else  
				render 'edit'
			end
		end
	end
private
	def competency_params
		params.require(:competency).permit(:competency_level)
	end

	def competency_exists?
		current_user.competencies.exists?(product_id: params[:id])
	end

	def find_competency
    	@competency = current_user.competencies.find(params[:id] )
  	end
end
