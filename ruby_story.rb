class Person
    def initialize (name,location)
        @name = name
        # should connect to room class/name
        @location = location
        @backpack = []
    end

    def get_name
        @name
    end

    def get_location
        @location
    end

    def get_backpack
        @backpack
    end

    def can_go_to
        @location.get_description
    end

    def go_to (num)
        if num == 1
            location = all_locations[0]
        elsif num ==2
            location = all_locations[1]
        end
    end

end

class Location

def initialize
        @description = 'a room'
    end
    def inspect (room)
        if room == 'main-room'
            p 'the room has a lamp a key and a watch laying around ...'
        elsif room = 'room_2'
            p 'the room has... '
        end
    end
end

class Main_room < Location
    def initialize ()
        super()
        @name = 'main room'
        @windows = [windows1,window2]
        @doors = 1
        @description = 'the main room with.. '
    end

    def printsomething
        p'it works!@#!@#!@'
    end

    def get_name
        @name
    end

    def get_windows_info (num)

    end
end

p ' Hello stranger, you find yourself inside a locked room with 2 windows and 1 doors'

p ' You have a hard time remmebering your name, maybe saying it out loud will freshen up your memory...'

name = gets.chomp
    until name.size > 0
        p ' im sorry i didnt quite get that... '
        name = gets.chomp
    end

# p player.get_name

main_room = Main_room.new
all_locations = [main_room]

player = Person.new(name,main_room)
p ' where do you want to go> '

destination = gets.chomp

player.go_to(destination)

player.get_location.printsomething

p ' something happend in the story  where od you want to go? '

answer = gets.chomp

#  class person
#  will have a name a location a backpack
# class location
# will have all the methods you can do in an area
#
# class main room extends location each room will be a location class and also its own class for its own unique featurees of the room
# a player class to keep track of all of the players information :
#  items, location
#
# 'silver' 
