class ArticalsController < ApplicationController
    def new
        @artical=Artical.new
    end
    def create
        @artical=Artical.new(params_data)
        @artical.save
        redirect_to articals_show(@artical);
    end
    private
     def params_data
         params[:artical].permit(:title,:description)
     end
end