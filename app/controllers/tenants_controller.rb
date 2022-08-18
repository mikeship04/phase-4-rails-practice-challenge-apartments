class TenantsController < ApplicationController

    def index
        tenants = Tenant.all
        render json: tenants, include: [:apartments]
    end

    def show
        tenants = Tenant.find(params[:id])
        render json: tenants
    end

    def create
        tenants = Tenant.create!(tenants_params)
        render json: tenants, status: :created
    end

    def update
        tenants = Tenant.find(params[:id])
        tenants.update!(tenants_params)
        render json: tenants, status: :accepted
    end

    def destroy
        tenants = Tenant.find(params[:id])
        tenants.destroy
        head :no_content
    end

    private

    def tenants_params
        params.permit(:name, :age)
    end
end
