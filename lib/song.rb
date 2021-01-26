require_relative "music_module.rb"


class Song
    
    extend MusicModule::ClassMethods
    include MusicModule::InstanceMethods
    extend Concerns::Findable

        
    attr_accessor :name
    attr_reader  :genre, :artist

    @@all = []

    def self.all
        @@all
    end

    # def self.find_by_name(name)
    #     self.all.select{ |instance| instance.name == name}
    # end

    # def self.find_or_create_by_name(name)
    #     instance = self.find_by_name(name)
    #     if instance == nil
    #         self.create(name)
    #     end
    # end

    # def artist=(artist)
    #     @artist = artist
    #     artist.add_song(self)
    # end

    def artist=(artist)
        assign_artist(artist)
        artist.add_song(self)
    end

    def assign_artist(artist)
        @artist = artist
    end


    def initialize(name = "Untitled", artist = nil, genre = nil )
        @name = name
        if artist
            self.artist = artist
        end
        if genre
            self.genre = genre
        end
    end



    def genre=(genre)
        @genre = genre
        if genre.songs.include?(self) == false
            genre.songs << self
        end
    end

    def self.new_from_filename(filename)
        attributes = filename.split(" - ")
        artist = Artist.find_or_create_by_name(attributes[0])
        genre = Genre.find_or_create_by_name(attributes[2].gsub(".mp3", ""))
        new_song = Song.new(attributes[1], artist, genre)
        new_song
    end

    def self.create_from_filename(filename)
        new_song = new_from_filename(filename)
        new_song.save
    end

    






    
    
        
end


