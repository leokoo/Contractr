class RegistrationsController < Devise::RegistrationsController
	def edit
		@user = current_user
  	@skills = Skill.all
  end

  def update
  	user_skill = []
    if !params[:user_skills].nil?
      params[:user_skills].each_key do |key|
        user_skill << key
      end
    end
    @user.user_skills = user_skill
    @user.update(devise_params)
    if !@user.user_skills.nil? #|| @user.user_skills.exists?
    	@user.user_skills.each do |skill|
	    	newskill = Skill.new(skill_params)
	  		newskill.skill = skill
	  		newskill.user_id = current_user.id
	  		newskill.save
	  	end
    end
    redirect_to user_path(@user)
  end

	protected
	def update_resource(resource, params)
		resource.update_without_password(params)
	end

	def devise_params
		params.require(:user).permit(:user_skills, :phone_number)
	end

	def skill_params
  	params.permit(:skill)
  end
end