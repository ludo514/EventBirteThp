module ApplicationHelper
	def isAdmin?
		user_signed_in? && current_user.is_admin == true
	end
end
