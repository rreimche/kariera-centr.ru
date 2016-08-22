module Common
	extend ActiveSupport::Concern

	def process_galleries(src)
		# TODO
		# substitute <p>[галерея]</p> ... <p>[/галерея]</p>
		# with <div class="gallery"> content </div>
		# during this from "..." take all the images and 
		# wrap them with links and place instead of the "..."
		# Then do the same for [галерея] ... [/галерея]
	end

	module ClassMethods
		
  	end
end