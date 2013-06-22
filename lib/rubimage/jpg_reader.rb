 module Rubimage
  
  class JpgReader < ImageReader
    SOf = ['ff', 'c4']

    def initialize(path)
      super(path)
      read
    end

    private 
      def read
        until closed? or end?
          buf = next_byte
          if buf == SOf[0] and next_byte == SOf[1]
            skip_bytes 3
            @height = convert_to_decimal next_short
            @width  = convert_to_decimal next_short
            @dimensions = [@width, @height]
            close
          end
        end
      end
  end
  
end
