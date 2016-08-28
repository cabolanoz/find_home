class PhotoCreate
  def initialize(property)
    @property = property
  end

  def create(photos)
    # Folder path
    directory = Rails.root.join('public', 'uploads')

    # Create uploads folder if not created
    FileUtils.mkdir_p(directory) unless File.directory?(directory)

    # Iterate through all photos added to property
    photos.each do |key|
      # Skip saving photo if key is nil
      next if photos[key].nil?

      # Create photo
      photo = Photo.create(property: @property, content_type: photos[key].content_type)

      # Create image name
      image_name_200 = "#{photo.uuid}200x200#{Rack::Mime::MIME_TYPES.invert[photos[key].content_type]}"
      image_name_1200 = "#{photo.uuid}1200x1200#{Rack::Mime::MIME_TYPES.invert[photos[key].content_type]}"
      image_data = photos[key].read

      image = Magick::Image::from_blob(image_data).first

      # Resize image to 200x200
      image = image.resize(200,200)
      # Place photo to uploads folder
      image.write(Rails.root.join('public', 'uploads', "#{image_name_200}"))

      # Resize image to 1200x1200
      image = image.resize(1200,1200)
      # Place photo to uploads folder
      image.write(Rails.root.join('public', 'uploads', "#{image_name_1200}"))
    end
  end
end
