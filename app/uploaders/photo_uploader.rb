class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))

    "http://res.cloudinary.com/djjs4pnpf/image/upload/v1528878490/jpsez3ep8okeusjdqinz.jpg"
  end
end
