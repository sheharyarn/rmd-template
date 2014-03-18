class ApplicationController < ActionController::Base
  	protect_from_forgery

  	def check_authority!
		#CUSTOM AUTHORITY FUNCTION
  	end

  	def render_404
    	render :template => '../../public/404.html', :layout => false, :status => :not_found
  	end

  	def render_401
    	render :template => '../../public/401.html', :layout => false, :status => 401
  	end

end
