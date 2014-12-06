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

	def link_to_remove_fields(name, f)
		f.hidden_field(:_destroy) + link_to(name, 'remove_fields(this)')
	end

	def link_to_add_fields(name, f, association)
		new_object = f.object.class.reflect_on_association(association).klass.new
		fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
			render(association.to_s.singularize + '_fields', :f => builder)
		end
		link_to(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
	end




end
