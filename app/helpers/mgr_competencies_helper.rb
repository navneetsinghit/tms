module MgrCompetenciesHelper
	def show_emp_competency_level(employee,product_id)
		competency = employee.competencies.find_by(product_id: product_id)
		if competency
			competency.competency_level
		else
			0
		end
	end

	def show_emp_name(employee)
		"#{employee.first_name} #{employee.last_name}"
	end
end
