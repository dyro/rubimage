module Rubimage
  class ImageReader

    BINARY     = 'rb'
    BYTE       = 1
    TWO_BYTES  = 2
    FOUR_BYTES = 4
    SHORT      = 'n'
    INT        = 'N'

    attr_reader :width, :height, :dimensions
    
    def initialize(path)
      @file = File.open path, BINARY
    end

    private 
      def end?
        @file.eof?
      end

      def skip_bytes(bytes = 1)
        @file.read BYTE * bytes
      end

      def next_byte
        @file.readbyte
      end

      def next_short
        @file.read(TWO_BYTES).unpack(SHORT)[0]
      end

      def next_int
        @file.read(FOUR_BYTES).unpack(INT)[0]
      end

      def closed?
        @file.closed?
      end

      def close
        @file.close
      end
  end
end