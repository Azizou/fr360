module ApplicationHelper

	def error_messages_for(object)
		render partial:  'application/error_messages', locals: {object: object}
	end

	def is_active?(link_path)
		current_page?(link_path) ? 'active' : ''
		#controller_name==link_path ? 'active':''
		#current_page? (link_path) ? 'active' : ''

	end

	def flash_class(level)
		case level
			when :notice then "alert alert-info"
			when :success then "alert alert-success"
			when :error then "alert alert-error"
			when :alert then "alert alert-alert"
		end
	end




end
