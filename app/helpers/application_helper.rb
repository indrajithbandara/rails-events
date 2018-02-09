module ApplicationHelper
	def gravatar_for(user, options = { size: 80})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.username, class: "rounded-circle")
	end

	def all_users
		User.all
	end

	def is_registered?(user, event)
		@registrations = Registration.all	
		@registrations.each do |registration|     
      if @registrations.any? { |r| user.id == r.user_id && event.id == r.event_id } 
      	return '<span class="status badge badge-success" id="status">
					         			Already Invited
					         		</span>'.html_safe
      else
      	return '<span class="status badge badge-warning" id="status">
					         			Not Invited
					         		</span>'.html_safe
      end
		end
	end


end
