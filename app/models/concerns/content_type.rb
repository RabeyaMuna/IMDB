module ContentType
  extend ActiveSupport::Concern

  IMAGE_TYPE = %i[image/jpg image/jpeg image/png]
  VIDEO_TYPE = %w[mp4 mov mkv h264 h265 webm].freeze
end
