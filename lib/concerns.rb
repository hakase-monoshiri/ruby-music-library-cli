module Concerns

    module Findable

        def find_by_name(name)
            self.all.find{ |instance| instance.name == name}
        end

        def find_or_create_by_name(name)
            instance = self.find_by_name(name)
            if instance == nil
               instance = self.create(name)
            end
            instance
        end

    end

end
