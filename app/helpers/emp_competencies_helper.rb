module EmpCompetenciesHelper
	def show_competency_level(product_id, employee)
		competency = employee.competencies.find_by(product_id: product_id)
		if competency
			competency.competency_level
		else
			0
		end
	end

	# def get_competency_id(product_id,employee)
	# 	competency = employee.competencies.find_by(product_id: product_id)
	# 	if competency
	# 		competency.id 
	# 	else
	# 		0
	# 	end
	# end
end
