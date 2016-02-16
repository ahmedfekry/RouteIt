module API
	class MetrosController < ApplicationController
		respond_to :json,:html
		
		def find_nearest
			metros = Metro.all
			min = 100000
			minid = 1
			lat = params["lat"].to_f
			long = params["lng"].to_f
			res=1000
			for metro in metros
				res = Metro.calculate_distance lat,long,metro.lat,metro.long
				if res < min
					min = res
					minid = metro.id				
				end
			end
			
			@metro = Metro.find(minid)
			
			metro = {
				name: @metro.name,
				lat: @metro.lat,
				long: @metro.long,
				min: min
			}
			
			render json: metro, status: 200 
		end
	
	end
end