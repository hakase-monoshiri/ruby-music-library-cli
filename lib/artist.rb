require_relative "music_module.rb"


class Artist
    
    extend MusicModule::ClassMethods
    include MusicModule::InstanceMethods
    extend Concerns::Findable

        
    attr_accessor :name

    @@all = []

    def initialize(name = "Unknown Artist")
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

 
    def songs
        @songs
    end

    def add_song(song)
        if songs.include?(song) == false
            self.songs << song
        end
        if song.artist == nil
        song.assign_artist(self)
        end

    end

    def genres
        genres = self.songs.map{|song| song.genre}
        @genres = genres.uniq
    end

end


