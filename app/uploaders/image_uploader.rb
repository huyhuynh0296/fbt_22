class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_fit: [100, 100]

  storage :file

  def default_url *_args
    ActionController::Base.helpers.asset_path("imagedefault/" +
      [version_name, "avatar.png"].compact.join("_"))
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
