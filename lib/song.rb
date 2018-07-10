require 'pry'
#@@all stores all of the instances of this Song class that you create. @@all is a class variable.
#set this class variable to an empty array to store all of those instances

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name}
    end

  def self.find_or_create_by_name(name)
    #pass in an argument of the song name
    #look into the array @@all to see if it is already included or not - call self.
    if @@all.detect {|song| song.name == name}
      return song
    elsif
      song = self.new
      song.name = name
      song.save
      song
    end
end

  def self.alphabetical
    @@all.sort
  end

  def self.new_from_filename(name, artist_name)
    song = self.new
    song.name = name
    artist_name.name = name
    name.save
    name
  end

  def self.destroy_all
    self.all.clear
  end


end
