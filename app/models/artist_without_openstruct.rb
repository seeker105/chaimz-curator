class Artist

  attr_accessor :id, :name, :created_at, :updated_at

  def initialize(new_artist_hash)
    #the service took the data and produced a hash. Now we take the hash
    #and turn it into an object.
    @id = new_artist_hash[:id]
    @name = new_artist_hash[:name]
    @created_at = new_artist_hash[:created_at]
    @updated_at = new_artist_hash[:updated_at]
  end

  def self.find(id)
    temp_artist_hash = ChaimzService.new.artist_hash(id)
    # creating the 'self.service' method lets us replace 'ChaimzService'
    # with just 'service'
    # temp_artist_hash = service.new.artist_hash(id)
    Artist.new(temp_artist_hash)
  end

  def self.all
    temp_artists_hash = ChaimzService.new.artists_hash
    temp_artists_hash.map do |temp_artist_hash|
      Artist.new(temp_artist_hash)
    end
  end

  def self.service
    ChaimzService.new
  end

end
