module Rubimage
  class ImageReader
    include HexFormatter

    BINARY = 'rb'
    BYTE   = 1
    SHORT  = 2
    LONG   = 4

    attr_accessor :width, :height, :dimensions
    
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
        format @file.read(BYTE)
      end

      def next_short
        format @file.read(SHORT)
      end

      def next_long
        format @file.read(LONG)
      end

      def closed?
        @file.closed?
      end

      def close
        @file.close
      end
  end
end