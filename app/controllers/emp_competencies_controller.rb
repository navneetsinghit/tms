class EmpCompetenciesController < ApplicationController
	before_action :valid_user
	def index
		@competencies = @employee.competencies
		@products = Product.all
	end

	def edit
		@product = Product.find(params[:id])
		if(competency_exists?)
			print "Competency competency_exists"
			@competency = find_competency
			print "#{@competency} , find_competency"
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
				redirect_to user_emp_competencies_path(@employee.id)
			else
				render 'edit'
			end
		else
			@competency =  Competency.new(competency_params)
			@competency.user_id = @employee.id
			@competency.product_id = params[:id]
			if @competency.save
				redirect_to user_emp_competencies_path(@employee.id)
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
		@employee.competencies.exists?(product_id: params[:id])
	end

	def find_competency
    	@competency = @employee.competencies.find_by(product_id: params[:id] )
  	end

  	def valid_user
  		@employee = User.find(params[:user_id])
  		unless ((@employee.has_role?(:employee) && @employee == current_user) || current_user.has_role?(:manager))
  			flash[:alert] = 'Access Denied'
  			redirect_to :back
  		end
  	end
end
