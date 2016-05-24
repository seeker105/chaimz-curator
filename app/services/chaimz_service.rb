class ChaimzService

#this class pulls data from the API and converts it to a ruby hash

  def initialize
    #first step is create a Faraday connection
    @connection = Faraday.new(url: "http://my-chaimz.herokuapp.com/")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def artists_hash
    parse(get_artists)
  end

  def get_artist(id)
    @connection.get "/api/v1/artists/#{id}"
  end

  def artist_hash(id)
    parse(get_artist(id))
  end

  def get_artists
    #remember that this method just returns the response from the web service
    @connection.get "/api/v1/artists/"
    #we know that every request is going to go to '/api/v1/-something' so we
    #can move the '/api/v1/' up into the initialize method as in:
    # @connection = Faraday.new(url: "http://my-chaimz.herokuapp.com/api/v1")
    #and then the get_artists method would just be:
    # @connection.get "artists"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
    #symbolize_names: true turns the string keys into symbols
  end

end
