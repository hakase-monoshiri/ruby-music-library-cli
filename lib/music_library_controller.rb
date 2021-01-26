class MusicLibraryController



    def initialize(path = "./db/mp3s")
        new_importer = MusicImporter.new(path)
        new_importer.import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"

        user_input = ""
        
        while user_input != "exit"
            user_input = gets.chomp

            self.send(user_input)

            call
        end



        # until user_input == "exit"
        #     call
        # end
        
    end

    def list_songs
        list = Song.all.sort_by{|song| song.name}
            list.each do |song|
                puts "#{list.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
    end

    def list_artists
        Artist.list
    end

    def list_genres
        Genre.list
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.chomp
        artist = Artist.find_by_name(artist_name)
        if artist
            list = artist.songs.sort_by{|song| song.name}
            list.each do |instance|
                puts "#{list.index(instance) + 1}. #{instance.name} - #{instance.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets.chomp
        genre= Genre.find_by_name(genre_name)
        if genre
            list = genre.songs.sort_by{|song| song.name}
            list.each do |instance|
                puts "#{list.index(instance) + 1}. #{instance.artist.name} - #{instance.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        user_input = gets.chomp.to_i
        list = Song.all.sort_by{|song| song.name}
        song = list[user_input - 1]
        if song && user_input < list.size && user_input > 0
            puts "Playing #{song.name} by #{song.artist.name}"
        end
    end
end
