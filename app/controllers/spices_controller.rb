class SpicesController < ApplicationController
    wrap_parameters formal: []

    # GET /spices
    def index
        render json: Spice.all
    end

    # POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # PATCH /spices/:id
    def update
        spice = Spice.find_by(id: params[:id])

        if spice
            spice.update(spice_params)
            render json: spice, status: :accepted
        else
            render json: { error: "Spice not found"}, status: :not_found
        end
    end

    # DELETE /spices/:id

    def destroy
        spice = Spice.find_by(id: params[:id])
        
        if spice
            spice.destroy
            render json: {}
        else
            render json: { error: "Spice not found"}, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
