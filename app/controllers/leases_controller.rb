class LeasesController < ApplicationController

    def create
        render json: Lease.create!(lease_params), status: :created
    end

    def destroy
        find_lease.destroy
        head :no_content
    end

    private
    def find_lease
        Lease.find(params[:id])
    end

    def lease_params
        params.permit(:rent, :tenant_id, :apartment_id)
    end
end
