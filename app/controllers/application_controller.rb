class ApplicationController < ActionController::Base
  	protect_from_forgery

  	def check_authority!
		@branch = Branch.where(:id => params[:id])

		if (@branch.count > 0)
			@branch = @branch[0]
			
			if @branch.user_ids.exclude? current_user.id
				render_401
			end
		else
			render_404
		end
  	end

  	def check_inventory_view_authority
  		if current_user.cannot? :view, @branch, :inventory
  			render_401
  		end
  	end

  	def check_inventory_creation_authority
  		if current_user.cannot? :create, @branch, :inventory
  			render_401
  		end
  	end

  	def normalize_branch
  		if not params[:id].present? and (current_user.branches.count == 1)
  			params[:id] = current_user.branches.first.id
  		end
  	end


  	def render_404
    	render :template => '../../public/404.html', :layout => false, :status => :not_found
  	end

  	def render_401
    	render :template => '../../public/401.html', :layout => false, :status => 401
  	end

  	def getpagelist(page)
		pages=pagelist
		pages.each_with_index do |p, i|
			if (page==p[:title])
				pages[i][:active]=true
				return pages
			end
		end
		return pagelist
	end

	def pagelist
		return [
			{
				:title => "Dashboard",
				:icon  => "icon-home", 
				:slug  => root_path,
				:sub   => nil
			},
			{
				:title => "Inventory",
				:icon  => "icon-th-list", 
				:slug  => inventory_path,
				:sub   => nil
			},
			{
				:title => "Sales & Returns",
				:icon  => "icon-barcode", 
				:slug  => sales_path,
				:sub   => nil
			},
			{
				:title => "UI Features",
				:icon  => "icon-bookmark-empty", 
				:slug  => nil,
				:sub   => [
					{
						:title => "General",
						:slug  => "#"
					}
				]
			},
			{
				:title => "Form Stuff",
				:icon  => "icon-table", 
				:slug  => "#",
				:sub   => nil
			},
			{
				:title => "Visual Charts",
				:icon  => "icon-bar-chart", 
				:slug  => "#",
				:sub   => nil
			},
			{
				:title => "Sign Out",
				:icon  => "icon-user", 
				:slug  => destroy_user_session_path,
				:sub   => nil
			}
		]
	end	
end
