# frozen_string_literal: true

class MediaFile
  SUPPORT_FORMATE = WahWah.support_formats.freeze

  class << self
    def file_paths
      media_path = File.expand_path(Setting.media_path)

      raise BlackCandyError::InvalidFilePath, I18n.t('error.media_path_blank') unless File.exist?(media_path)
      raise BlackCandyError::InvalidFilePath, I18n.t('error.media_path_unreadable') unless File.readable?(media_path)

      Dir.glob("#{media_path}/**/*.{#{SUPPORT_FORMATE.join(',')}}", File::FNM_CASEFOLD)
    end

    def format(file_path)
      File.extname(file_path).downcase.delete('.')
    end

    def image(file_path)
      tag = WahWah.open(file_path)
      image = tag.images.first

      { data: image[:data], format: MIME::Type.new(image[:mime_type]).sub_type } if image
    end

    def file_info(file_path)
      tag_info = get_tag_info(file_path)
      tag_info.merge(file_path: file_path, md5_hash: get_md5_hash(file_path))
    end

    private

      def get_tag_info(file_path)
        tag = WahWah.open(file_path)

        {
          name: tag.title.presence || File.basename(file_path),
          album_name: tag.album.presence,
          artist_name: tag.artist.presence,
          albumartist_name: tag.albumartist.presence,
          tracknum: tag.track,
          length: tag.duration
        }
      end

      def get_md5_hash(file_path)
        Digest::MD5.base64digest(file_path.to_s + File.mtime(file_path).to_s)
      end
  end
end
