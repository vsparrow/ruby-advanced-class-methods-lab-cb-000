class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #SONG.CREATE
  #Build a class constructor Song.create that initializes a song and saves it to the @@all class variable
  #either literally or through the class method Song.all.
  #This method should return the song instance that was initialized and saved.
  def self.create
    x = self.new
    @@all << x
    x
  end # create

  # SONG.NEW_BY_NAME
  # Build a class constructor Song.new_by_name that takes in the string name of a song and
  #  returns a song instance with that name set as its name property.
  #  Song.new_by_name should return an instance of Song and not a simple string or anything else.
  def self.new_by_name(song_name)
    # song = Song.create
    song = Song.new
    song.name = song_name
    song
  end # new_by_name

  # SONG.CREATE_BY_NAME
  # Build a class constructor Song.create_by_name that takes in the string name of a song
  # and returns a song instance with that name set as its name property and the song being saved into the
  #  @@all class variable.
  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  # Build a class finder Song.find_by_name that accepts the string name of a song and
  # returns the matching instance of the song with that name.
  def self.find_by_name(song_name)
   song_found =  self.all.detect{ |song| song.name == song_name}
   song_found
  end #find_by_name

  # SONG.FIND_OR_CREATE_BY_NAME
  # In order to prevent duplicate songs being created that actually represent the same song (based on the song name),
  #  we're going to build a Song.find_or_create_by_name class method.
  #  This method will accept a string name for a song and either
  #  return a matching song instance with that name or create a new song with the name and return the song instance.
  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song == nil
      song = self.create_by_name(song_name) # ********** could also be new_by_name ?
    end # if
    song
  end #find_or_create_by_name

  # Build a class method Song.alphabetical that returns all the songs in ascending (a-z) alphabetical order.
  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end #alphabetical

#
#   SONG.NEW_FROM_FILENAME
# Build a class constructor that accepts a filename in the format of " - .mp3",
# Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), the constructor should return
# a new Song instance with the song name set to Blank Space and the artist_name set to Taylor Swift.
#  Separate the artist name from the rest of the data based on the - delimiter.
  def self.new_from_filename(filename)
    splitname = filename.split(" - ")
    # puts "*************************#{splitname}"
    artist = splitname[0]
    splitname[1].slice!(0,-4)
    song_name = splitname[1].chomp(".mp3")
    # song_name = splitname[1]
    # puts "********************#{artist}***********#{song_name}!"
    song = self.new_by_name(song_name)
    song.artist_name = artist
    song
  end # new_from_filename

  def self.create_from_filename(filename)
    splitname = filename.split(" - ")
    # puts "*************************#{splitname}"
    artist = splitname[0]
    splitname[1].slice!(0,-4)
    song_name = splitname[1].chomp(".mp3")
    # song_name = splitname[1]
    # puts "********************#{artist}***********#{song_name}!"
    song = self.create_by_name(song_name)
    song.artist_name = artist
    song
  end #create_from_filename

  def self.destroy_all
    self.all.clear
  end

end #class
