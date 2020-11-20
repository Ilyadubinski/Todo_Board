require_relative 'item.rb'


class List 

    attr_accessor :label 

    def initialize(label)
        @label = label 
        @items = []
    end

    # def label=(new_label)
    #     @label = new_label
    # end

    def toggle_item(index)
        index = index.to_i 
        if @items[index].done 
            @items[index].done = false 
        else
             @items[index].done = true 
        end
    end

    def remove_item(index)
        index = index.to_i  
        valid_index?(index)
        @items.delete_at(index)
        true 
    end

    def purge 
        i = 0 
        while i < @items.length - 1 
            @items.delete_at(i)
            i += 1 
        end

    end

    def add_item(title, deadline, description='')
        # description = '' if description.nil?

        if Item.valid_date?(deadline)
            new_item = Item.new(title, deadline, description)
            @items << new_item
            return true 
        else
            return false 
        end

    end

    def size
        @items.length 
    end

    def valid_index?(index)
        index = index.to_i 
        return true if (index >= 0) && (index < @items.length)
        false 
    end

    def swap(index_1, index_2)
        index_1 = index_1.to_i 
        index_2 = index_2.to_i 
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true 
    end

    def [](index)
        index.to_i  
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items.first 
    end

    def printt 
        puts "-----------------------------------------------------------------------------"         
        puts @label.upcase
        puts "-----------------------------------------------------------------------------"  
        puts 'Index   ' + "|  " + "Item            " + "|  " + "Deadline    " + "|  " + "Done    "
        puts "---------------------------------------------------"  
        @items.each_with_index do |item, i| 
            if item.done 
                checked = ["\u2713"]
            else
                checked = [ ]
            end

            puts "#{i}    | #{item.title}            " + "| " + "#{item.deadline}" + "| " + "#{checked}"
        end
       puts "-----------------------------------------------------------------------------"   
    end

    def print_full_item(index)
        index = index.to_i 
        puts "-----------------------------------------------------------------------------"  
        puts "#{@items[index].title}          #{@items[index].deadline}       #{@items[index].description}"  + "#{item.done}"  
       puts "-----------------------------------------------------------------------------"  
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        index = index.to_i 
        amount = amount.to_i
        while amount > 0 && index > 0 

            @items[index], @items[index-1]= @items[index-1], @items[index]
            index -= 1
            amount -= 1 
        end
        true 
    end

    def down(index, amount=1)
        index = index.to_i 
        amount = amount.to_i 

        valid_index?(index)
        while amount > 0 && index < (@items.length-1) 

            @items[index], @items[index+1]= @items[index+1], @items[index]
            index += 1
            amount -= 1 
        end
        true
    end


    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end





end
