module ApplicationHelper
	def admin?
		@user.email == "edgarallenpoed@gmail.com"
	end
end
