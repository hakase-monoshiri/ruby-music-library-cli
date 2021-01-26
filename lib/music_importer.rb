class MusicImporter

    attr_reader :path


    def initialize(file_path)
        @path = file_path
    end

    def files
        files = [] 
        Dir.each_child(self.path) do |filename|
            if filename.end_with?(".mp3")
                filename.gsub(".mp3", "")
                files << filename
            end
        end
        files
    end

    def import
        files.each{|filename| Song.create_from_filename(filename)}
    end



end
