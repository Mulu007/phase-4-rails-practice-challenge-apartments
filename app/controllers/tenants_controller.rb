class TenantsController < ApplicationController

    def index
        render json: Tenant.all, status: :ok
    end

    def show
        render json: find_tenants, status: :ok
    end

    def create
        render json: Tenant.create!(tenant_params), status: :created
    end

    def update
        render json: find_tenants.update!(tenant_params), status: :accepted
    end

    def destroy
        find_tenants.destroy
        head :no_content
    end

    private
    def find_tenants
        Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end
end
