class BuildingsController < ApplicationController

    before_action :find_building, only: [:show, :edit, :update]

    def index
        @buildings = Building.all 
    end

    def show
    end

    def edit
    end

    def update
        @building.update(building_params)
        redirect_to building_path(@building)
    end

    private

    def building_params
        @building.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
    end

    def find_building
        @building = Building.find(params[:id])
    end

end