class Album < OpenStruct

  def self.service
    AlbumService.new
  end

  def self.find(id)
    temp_album_hash = service.album_hash(id)
    Album.new(temp_album_hash)
  end

  def self.all
    temp_albums_hash = service.albums_hash
    temp_albums_hash.map do |temp_album_hash|
      Album.new(temp_album_hash)
    end
  end



end
