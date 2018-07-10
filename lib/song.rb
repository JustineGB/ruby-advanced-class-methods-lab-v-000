require 'pry'
#@@all stores all of the instances of this Song class that you create. @@all is a class variable.
#set this class variable to an empty array to store all of those instances

class Song
  attr_accessor :name, :artist_name #making these variables avail to my methods below
  @@all = []

  def self.all
    #this method stores all instances of this class inside of the class variable, the @@all array
    @@all
  end

  def save
    #instnace method.
    #save each instance and push this into the class.all
    self.class.all << self
  end

  def self.create
    #class method (not just calling on particular instance, method for entire class)???
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
  #just using the logic from the two previous methods. just utilze those other two methods you already set up!!!
    if find_by_name(name) #if self (the class array) find_by_name = the name you pass into it exits  then return that name!
      return find_by_name(name)
      #if that name does not exist (i.e. you do NOT find it) then you need to create it!
    else create_by_name(name)
      return Song
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
