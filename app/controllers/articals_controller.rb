class ArticalsController < ApplicationController
    before_action :set_params, only: [:edit,:show,:update,:destroy]
    before_action :require_user, except: [:show, :index] # require_user function define in application controller.rb
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def new
        @artical=Artical.new
    end
    def create
    
        @artical=Artical.new(params_data)
        @artical.user=current_user
        if @artical.save
            flash[:success] = "article created successfully"
            redirect_to artical_path(@artical);
        else
            render 'new'
        end
      #  @artical.save
    end
    def edit
        @artical=Artical.find(params[:id])
    end
    def update
         @artical=Artical.find(params[:id])
        if @artical.update(params_data)
             flash[:success] = "article updated successfully"
             redirect_to artical_path(@artical)
        else  
            render 'edit'
        end
    end
    def show
        @artical=Artical.find(params[:id])
    end
    def index
       @articals=Artical.paginate(page: params[:page], per_page: 5)
    end
    def destroy
     
       @artical.destroy
       flash[:danger] = "article successfully deleted"
       redirect_to articals_path
    end
    private
    def set_params
        @artical=Artical.find(params[:id]) 
    end
     def params_data
         params[:artical].permit(:title,:description,category_ids:[])
     end
     def require_same_user
        if current_user != @artical.user and !current_user.admin
            flash[:danger]="you can't update other's articles"
            redirect_to root_path
        end
     end
end