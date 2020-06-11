class SightingSerializer

    def initialize(sighting_obj)
        @sighting = sighting_obj
    end

    def to_serialized_json
        # @sighting.to_json(:include => {
        #     :bird => {:only =>[:name, :species]}, 
        #     :location => {:only =>[:latitude, :longitude]}
        #     }, :except => [:updated_at])

        #Better for readability
        options = {
            include: {
                bird: {only: [:name, :species]},
                location: {only: [:longitude, :latitude]}
            },
            except: [:updated_at, :created_at]
        }
        @sighting.to_json(options)
    end
end