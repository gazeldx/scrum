class StudentUploader < BaseUploader
  process :resize_to_limit => [800, 1400]

  version :students do
    process :resize_to_fill => [360, 615]
  end

  version :thumb do
    process :resize_to_fill => [40, 75]
  end
end
