module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		if user.image
			user.image + "?type=large"
		else
		"https://www.gravatar.com/avatar.jpg?d=identical&s=150"
		end
	end
end
