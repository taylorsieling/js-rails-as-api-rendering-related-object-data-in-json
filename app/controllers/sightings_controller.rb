class SightingsController < ApplicationController
    def show
        sighting = Sighting.find_by(id: params[:id])
        # using hashes
        # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }

        # include method
        # works with action that renders an array
        if sighting
            render json: sighting, include: [:bird, :location]
        else
            render json: { message: "No sighting found with that id" }
        end
    end
end
