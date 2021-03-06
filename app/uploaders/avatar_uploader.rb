class AvatarUploader < BaseUploader  
  
  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    pic_type = "png"
    "/images/fallback/" + [version_name, "default." + pic_type].compact.join('_')
  end

  #Maybe means max width is 800 and max height is 1000
  #process :resize_to_fit => [800, 1000]
  #Maybe means max width is 800 and height is not limited
  process :resize_to_limit => [800, 1000]
  # Process files as they are uploaded:
  #process :scale => [800, 800]

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [126, 168]
  end

#  version :bigpic do
#   process :resize_to_fill => [120, 160]
#  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
