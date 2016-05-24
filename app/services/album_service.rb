class AlbumService

  def initialize
    @connection = Faraday.new(url: "http://my-chaimz.herokuapp.com/api/v1")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def get_albums_array
    @connection.get "albums/"
    #returns an array of hashes with album data
    # byebug
  end

  def albums_hash
    parse(get_albums_array)
  end

  def get_album_array(id)
    @connection.get "albums/#{id}"
  end

  def album_hash(id)
    parse(get_album_array(id))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end



end
