module Rubimage
	class JpgReader < ImageReader

		FF  = 0xff
		SOf = 0xc0..0xcf

		def initialize(path)
			super path
			read
		end

		def read
			until closed? or end?
				buf = next_byte
				if buf == FF and SOf.include? next_byte
					skip_bytes 3
					@height = next_short
					@width  = next_short
					@dimensions = {height: @height, width: @width}
					close
				end
			end
		end
	end
end
