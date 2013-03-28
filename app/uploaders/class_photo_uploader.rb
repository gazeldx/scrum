class ClassPhotoUploader < BaseUploader
  process :resize_to_limit => [1400, 800]

  version :photo do
    process :resize_to_fill => [615, 360]
  end

  version :thumb do
    process :resize_to_fill => [75, 40]
  end
end
