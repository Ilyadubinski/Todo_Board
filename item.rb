class Item 

    def self.valid_date?(date_string)
        date = date_string.split("-")
        return false if date.length != 3
        year = date[0]
        month = date[1]
        day = date[2]

        return false if year.length != 4 
        return false if month.to_i > 12 
        return false if day.to_i > 31 || day.to_i < 1 

        true 
    end

    attr_accessor :title, :deadline, :description, :done 

    def initialize(title, deadline, description)
        @title = title 
            if Item.valid_date?(deadline)
             @deadline = deadline
            else
             raise error 
            end
        @description = description
        @done = false 
    end

    def toggle 
        if @done 
            @done = false 
        else
            @done = true 
        end
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
             @deadline = new_deadline
        else 
            raise error 
        end
    end

    def description=(new_description)
        @description = new_description
    end


end