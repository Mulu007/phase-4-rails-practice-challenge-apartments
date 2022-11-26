class ApartmentsController < ApplicationController

    def index
        render json: Apartment.all, status: :ok
    end

    def show
        render json: find_apartments, status: :ok
    end

    def create
        render json: Apartment.create!(apartment_params), status: :created
    end

    def update
        render json: find_apartments.update!(apartment_params), status: :accepted
    end

    def destroy
        find_apartments.destroy
        head :no_content
    end

    private
    def find_apartments
        Apartment.find(params[:id])
    end

    def apartment_params
        params.permit(:number)
    end

end
