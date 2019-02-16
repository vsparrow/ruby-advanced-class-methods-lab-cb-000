require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.alphabetical
    @@all.sort_by {|s| s.name}
  end

  def self.create
    s = Song.new
    s.save
    s
  end

  def self.create_by_name name
    s = self.new_by_name name
    s.save
    s
  end

  def self.create_from_filename filename
    song = self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = []
  end

  def self.find_by_name name
    song = self.all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name name
    song = self.find_by_name name
    song.nil? ? self.create_by_name(name) : song
  end

  def self.new_by_name name
    s = Song.new
    s.name = name
    s
  end

  def self.new_from_filename filename
    singer_and_name = filename.slice!(0...-4).split("-") #remove .mp3
    artist_name = singer_and_name[0].strip
    name = singer_and_name[1].strip
    song = self.create_by_name name
    song.artist_name = artist_name
    song
  end


  def save
    self.class.all << self
  end

end
