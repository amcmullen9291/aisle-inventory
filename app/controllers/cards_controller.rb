class CardsController < ApplicationController
    def new 
        @card = Card.new
    end

    def create 
        @card = Breed.new(card_params)
        if @card.save
            @card.avatar.attach(params[:avatar])
            @card.save
            redirect_to cards_path, notice: "Item Added"
        else
            render :new, notice: "Item not added. Try again"
        end 
    end 

    def edit 
    end 

    def update 
    end 

    def show 
    end 

    def destroy
    end 

    def index 
    end 

    private 
    def card_params
        params.require(:card).permit(:desription, :in_stock, :aisle_id, :occasion_id, :sku, :manufacturer_id, :avatar)
end
