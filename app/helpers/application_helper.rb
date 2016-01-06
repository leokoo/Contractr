module ApplicationHelper
	def avatar_url(user)
		if user.image
			user.image + "?type=large"
		else

		"https://d3lut3gzcpx87s.cloudfront.net/res/img/UnknownProfile.png"

		end
	end
end
