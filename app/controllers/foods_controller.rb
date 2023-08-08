class FoodsController < ApplicationController
    def index
        @foods = current_user.foods
    end

     def show;
     end
     
    def new
        @food = Food.new
    end

    def create
        @food = Food.new(food_params)
        @food.user_id = current_user.id
        if @food.save
            flash[:notice] = 'New Food successfully added!'
            redirect_to foods_path
        else
            flash[:alert] = 'Fill again'
            render :new
        end
    end

    def destroy
        @food = Food.find(params[:id])
        if @food.destroy
            flash[:notice] = 'Food successfully deleted!'
            else
            flash[:alert] = 'Food is not deleted!'
            end
    end


    private 

    def food_params
        params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
      end
      
end
