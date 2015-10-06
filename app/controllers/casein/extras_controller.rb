# Scaffolding generated by Casein v5.1.1.5

module Casein
  class ExtrasController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Extras'
  		@extras = Extra.order(sort_order(:title)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View extra'
      @extra = Extra.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new extra'
    	@extra = Extra.new
    end

    def create
      @extra = Extra.new extra_params
    
      if @extra.save
        flash[:notice] = 'Extra created'
        redirect_to casein_extras_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new extra'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update extra'
      
      @extra = Extra.find params[:id]
    
      if @extra.update_attributes extra_params
        flash[:notice] = 'Extra has been updated'
        redirect_to casein_extras_path
      else
        flash.now[:warning] = 'There were problems when trying to update this extra'
        render :action => :show
      end
    end
 
    def destroy
      @extra = Extra.find params[:id]

      @extra.destroy
      flash[:notice] = 'Extra has been deleted'
      redirect_to casein_extras_path
    end
  
    private
      
      def extra_params
        params.require(:extra).permit(:title, :text)
      end

  end
end