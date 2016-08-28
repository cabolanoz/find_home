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
      image_name = "#{photo.uuid}#{Rack::Mime::MIME_TYPES.invert[photos[key].content_type]}"

      # Place photo to uploads folder
      File.open(Rails.root.join('public', 'uploads', image_name), 'wb') do |file|
        file.write(photos[key].read)
      end
    end
  end
end
