require_relative "music_module.rb"


class Genre
    
    extend MusicModule::ClassMethods
    include MusicModule::InstanceMethods
    extend Concerns::Findable

        
    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end
    
    def initialize(name = "Unknown Genre")
        @name = name
        @songs = []
    end

    def songs
        @songs
    end

    def artists
        artists = self.songs.map{|song| song.artist}
        @artists = artists.uniq
    end

end


