class ArticalsController < ApplicationController
    def new
        @artical=Artical.new
    end
    def create
        @artical=Artical.new(params_data)
        if @artical.save
            flash[:notice] = "article created successfully"
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
             flash[:notice] = "article updated successfully"
             redirect_to artical_path(@artical)
        else  
            render 'edit'
        end
    end
    def show
        @artical=Artical.find(params[:id])
    end
    def index
       @articals=Artical.all 
    end
    def destroy
       @artical=Artical.find(params[:id]) 
       @artical.destroy
       flash[:notice] = "article successfully deleted"
       redirect_to articals_path
    end
    private
     def params_data
         params[:artical].permit(:title,:description)
     end
end