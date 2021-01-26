module MusicModule

    module InstanceMethods 

        def save
            self.class.all << self
        end

        # def list_x_by_self(main_arg, details)
        #     list = self.send(main_arg).sort_by{|instance| instance.name}
        #     list.each do |instance|
        #         puts "#{list.index(instance) + 1}. #{instance.name} - #{instance.send(details).name}"
        #     end
        # end

        

    end


    module ClassMethods


        def destroy_all
            self.all.clear
        end

        def create(name)
            instance = self.new(name)
            instance.save
            instance
        end

        def list
            list = self.all.sort_by{|instance| instance.name}
            list.each do |instance|
                puts "#{list.index(instance) + 1}. #{instance.name}"
            end
        end

    end

end