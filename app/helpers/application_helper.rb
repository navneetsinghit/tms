module ApplicationHelper
	def link_to_competency(image_path)
		if(current_user.has_role? :manager)
			link_to(image_tag(image_path),mgr_path)
		else
			link_to(image_tag(image_path), emp_competencies_path )
		end
	end
end
