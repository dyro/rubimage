require_relative 'rubimage/image_reader'
require_relative 'rubimage/jpg_reader'
require_relative 'rubimage/png_reader'

module Rubimage

  PNG  = '.png'
  JPG  = '.jpg'
  JPEG = '.jpeg'

  def self.info(path)
    ext_type = File.extname path
    case ext_type
    when PNG
      type = Rubimage::PngReader.new path
    when JPG, JPEG
      type = Rubimage::JpgReader.new path
    else
      raise "#{ext_type} is not currently supported"
    end	
  end
end

