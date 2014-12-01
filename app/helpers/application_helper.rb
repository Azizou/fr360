module ApplicationHelper

	def error_messages_for(object)
		render partial:  'application/error_messages', locals: {object: object}
	end




	def is_active?(link_path)
		current_page?(link_path) ? 'active' : ''
	end


end
