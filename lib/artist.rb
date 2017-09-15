class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end



  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    #find all artist instances and find the artist with the name equal to the name in the argument
    self.all.find{|artist| artist.name == name}
  end

  def self.create(name)
    #create new artist object with name set as the value from argument. return the artist and push into @@all array?
    self.new(name).tap{|artist| artist.save}
  end


  def save
    @@all << self
  end

  def print_songs
    #loop through array of songs and display their names.
    songs.each {|song| puts song.name}
  end

end
