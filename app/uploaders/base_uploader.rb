class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
