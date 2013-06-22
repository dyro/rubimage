module Rubimage
  module HexFormatter
    FORMAT = 'H*'
    
    private 
      def format(content)
        content.unpack(FORMAT)[0]
      end

      def convert_to_decimal(hex_value)
        hex_value.hex
      end
  end
end