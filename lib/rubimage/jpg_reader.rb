 module Rubimage
  
  class JpgReader < ImageReader
    FF  = 'ff'
    SOf = %w[c0 c1 c2 c3 c5 c6 c7 c9 ca cb cd ce cf]

    def initialize(path)
      super(path)
      read
    end

    private 
      def read
        until closed? or end?
          buf = next_byte
          if buf == FF and SOf.include? next_byte
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
