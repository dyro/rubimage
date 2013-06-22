module Rubimage

  class PngReader < ImageReader
    def initialize(path)
      super(path)
      read
    end

    private 
      def read
        skip_bytes 16 # skip header
        @width  = convert_to_decimal next_long
        @height = convert_to_decimal next_long
        @dimensions = [@width, @height]
        close
      end
  end
  
end