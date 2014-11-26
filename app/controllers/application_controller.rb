class ApplicationController < ActionController::API
	before_filter :cors_preflight_check
	after_filter :cors_set_access_control_headers

	def cors_preflight_check
		if request.method == :options
			headers['Access-Control-Allow-Origin'] = '*'
			headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
			headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
			headers['Access-Control-Max-Age'] = '1728000'
			render :text => '', :content_type => 'text/plain'
	  end
	end

	def cors_set_access_control_headers
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Headers'] = 'X-AUTH-TOKEN, X-API-VERSION, X-Requested-With, Content-Type, Accept, Origin'
		headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
		headers['Access-Control-Max-Age'] = "1728000"
	end
end
