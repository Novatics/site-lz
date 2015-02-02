ActiveAdmin.register Client do
	permit_params :name

	index do
	    selectable_column
	    id_column
	    column :name
	    column :created_at
	    column :updated_at
	    actions
  	end

	filter :name
    filter :portfolio_projects
    filter :projects
    filter :users
    filter :created_at
    filter :updated_at
	
  	form do |f|
	    f.inputs do
	    	f.input :name
	    end
	    f.actions
	end

	sidebar I18n.t("app.active_admin.more_information"), only: [:show, :edit] do
		ul do
			li link_to(I18n.t("activerecord.models.portfolio_project"), admin_client_portfolio_projects_path(client))
			li link_to(I18n.t("activerecord.models.project"), admin_client_projects_path(client))
			li link_to(I18n.t("activerecord.models.user"), admin_client_users_path(client))
		end
	end

	controller do
    	def find_resource
      		scoped_collection.friendly.find(params[:id])
    	end
	end
end