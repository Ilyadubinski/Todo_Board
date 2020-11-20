require_relative "list.rb" 

class TodoBoard 


    def initialize(label)
        @list = List.new(label)
    end

     def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
            when 'mktodo'
                @list.add_item(*args)
            when 'up'
                @list.up(*args)
            when 'down'
                @list.down(*args)
            when 'swap'
                @list.swap(*args)
            when 'sort'
                @list.sort_by_date!
                return true 
            when 'priority'
                @list.print_priority
                return true 
            when 'print'
                @list.printt
                return true 
            when 'toggle'
                @list.toggle_item(*args)
                return true 
            when "rm"
                @list.remove_item(*args)
                return true 
            when "purge"
                @list.purge 
                return true 
            when 'quit'
                return false
            else
                print "Sorry, that command is not recognized."
            end

        true
    end

    def run 

        until !get_command
            get_command
        end
        print 'goodbye'
    end
end