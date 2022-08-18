class LeasesController < ApplicationController

    def create
        leases = Lease.create!(lease_params)
        render json: leases, status: :created
    end

    def destroy
        leases = Lease.find(params[:id])
        leases.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent, :tenant_id, :apartment_id)
    end

end
