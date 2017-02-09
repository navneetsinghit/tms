module ApplicationHelper
	def link_to_competency(image_path)
		if(current_user.has_role? :manager)
			link_to(image_tag(image_path),mgr_competencies_path)
		else
			link_to(image_tag(image_path), user_emp_competencies_path(current_user.id) )
		end
	end
end
