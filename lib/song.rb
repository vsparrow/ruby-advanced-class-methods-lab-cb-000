class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def inititalize(name=nil,artist_name=nil)
  #   @name=name
  #   @artist_name=artist_name
  #
  # end

  def save
    self.class.all << self
  end


  def self.all
    @@all
  end

  def self.alphabetical
    alphabetical = Song.all.sort { |a,b| a.name <=> b.name}
    alphabetical
  end

  # def self.create(name=nil,artist_name=nil)
  def self.create #(name=nil,artist_name=nil)
    # song = Song.new(name,artist_name)
    song = Song.new #(name,artist_name)
    song.save
    song
  end

  def self.create_from_filename(name)
    song = Song.new_from_filename(name)
    song.save
    song
  end

  def self.create_by_name(name)
    s=Song.new
    s.name=name
    s.save
    s
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    s=nil
    s= self.all.find {|song| song.name == name}
    s
  end

  def self.find_or_create_by_name(name)
    s = Song.find_by_name(name)
    s = Song.create_by_name(name) if s.nil?
    s
  end

  def self.new_by_name(name)
    song=Song.new #.new(name,nil)
    song.name = name
    song
  end #new_by_name

  def self.new_from_filename(name)
    # puts "******#{name.split(".mp3")}"
    # puts "******#{name.split(".mp3")[0].split(" - ")}"
    names=name.split(".mp3")[0].split(" - ")
    artist_name = names[0]
    song_name= names[1]
    # puts "********#{artist_name}::#{song_name}"
    song = Song.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

end
