module Rubimage

  class PngReader < ImageReader
    PNG_HEADER = 16

    def initialize(path)
      super(path)
      read
    end

    private 
      def read
        skip_bytes PNG_HEADER
        @width  = next_int
        @height = next_int
        @dimensions = {height: @height, width: @width}
        close
      end
  end
  
end
