class CatsController < ApplicationController
    def index 
        @cats= Cat.all 
        render :index 
    end

    def show 
        @cat = Cat.find(params[:id])
        render :show 
    end 

    def new
        @cat = Cat.new(cat_params)
        render :new 
    end 
    
    def create 
        @cat = Cat.new(cat_params)
        if @cat.save 
            redirect_to cat_url(@cat)
        else  
            render json: @cat.errors.fill_messages, status: 422
        end 
    end

    def cat_params
       params.require(:cat).permit(:birth_date, :color, :name, :sex)
    end
end
