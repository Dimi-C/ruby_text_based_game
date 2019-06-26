class Player
    def initialize name
        @name = name
        @location = "Room 1"
        @backpack = []
    end

    def get_name
        @name
    end

    def set_name name
        @name = name
    end

    def get_location
        @locaiton
    end

    def set_location location
        @location = location
    end

    def get_backpack
        @backpack
    end

    def push_backpack item
        @backpack << item
    end

end
#
def print_string (string)
    sentence = string.split('')
    for letter in sentence do
        sleep (0.008)
        print "#{letter}"
    end
    puts " \n"
end

print_string ' You find yourself in a small locked room with a door, you seem to have trouble remebering your name...'
print_string ' maybe try saying it out loud...?'

name = gets.chomp
player = Player.new(name)
puts player.get_name.upcase

def room_1 (player)
    puts "\n \n"
    option = 0
    print_string ' The room contains a door, a safe and table with an assortment of items on top of it.'
    print_string 'What would you like to do? '
    print_string '1. Go to door'
    print_string '2. Go to the table'
    print_string '3. Go to the safe'
    option = gets.chomp.to_i
    until option.between?(1,3) do
        puts "\n "
        print_string 'Please enter 1,2 or 3'
        option = gets.chomp.to_i
    end

    if option == 1
        room_1_door (player)
    elsif option == 2
        room_1_table (player)
    elsif option == 3
        room_1_safe (player)
    end

end

def room_1_door(player)
    puts "\n "
    key = player.get_backpack
    print_string 'You look at an old door that seems to lead to an exit'

    if key.include?('Silver Key')
        print_string 'It seems the door is locked'
        print_string 'you seems to have a key that fits in your backpack'
        print_string ' would you like to open the door'
        print_string '1. open the door'
        print_string '2. go back to the room  '
        option = gets.chomp.to_i
        until option.between?(1,2) do
            print_string 'Please enter 1 or 2'
            option = gets.chomp.to_i
        end
        if option == 1
            player.set_location("Room 2")
            room_2 (player)
        elsif option == 2
            room_1(player)
        end
    else
        print_string 'It seems the door is locked'
        print_string 'The doorknob has a bright silver sheen'
        print_string ' you think you saw a key by the table...'
        room_1(player)
    end
end

def room_1_table(player)
    puts "\n "
    print_string 'You see 3 objects on the table'
    print_string 'They seem to be keys'
    print_string 'Which key would you like to grab'
    print_string '1. The silver key'
    print_string '2. The wooden key'
    print_string '3. The bronze key'
    option = gets.chomp.to_i
    until option.between?(1,3) do
        print_string 'Please enter 1,2 or 3'
        option = gets.chomp.to_i
    end
    if option == 1
        print_string 'You picked up the silver key'
        player.push_backpack('Silver Key')
        room_1(player)
    else
        print_string 'you picked up the key'
        room_1(player)
    end
end

def room_1_safe (player)
    puts "\n "
    print_string 'The safe for some odd reason has clues on it... '
    print_string '(10*5 - 40)*10 = password.reverse'
    print_string 'You should try puting the combination now '
    print_string 'Press 999 to exit'
    password = gets.chomp.to_i
    until password == 001  or password == 999 do
        print_string 'That does not seems to be the correct combination...'
        password = gets.chomp.to_i
    end

    if password == 001
        print_string 'You opened the safe, there seems to be a piece of paper with some numbers on it'
        print_string 'The numbers read 4,2,8'
        room_1(player)
    elsif password == 999
        room_1(player)
    end
end

def room_2 (player)
    puts "\n \n"
    print_string 'You stand in the middle of the second room'
    print_string 'The room seems to be empty except for a computer and a door'
    print_string 'what would you like to do'
    print_string '1. Go to the door'
    print_string '2. Go to the computer'
    print_string '3. Go back to the first room'
    option = gets.chomp.to_i
    until option.between?(1,3) do
        print_string 'Please enter 1,2 or 3'
        option = gets.chomp.to_i
    end
    if option == 1
        room_2_door(player)
    elsif option == 2
        room_2_computer(player)
    elsif option == 3
        room_1(player)
    end

end

def room_2_door (player)
    puts "\n "
    key = player.get_backpack
    if key.include?('Computer Key')
        print_string 'The door seems to be unlocked'
        print_string 'It also has a note on it reading'
        print_string 'Humans grow old every day...'
        print_string ' would you like to go trough the door'
        print_string '1. Go trough the door'
        print_string '2. go back to the room  '
        option = gets.chomp.to_i
        until option.between?(1,2) do
            print_string 'Please enter 1 or 2'
            option = gets.chomp.to_i
        end
        if option == 1
            player.set_location("Room 3")
            room_3 (player)
        elsif option == 2
            room_2(player)
        end
    else
        print_string 'It seems the door is locked with no doorknob'
        print_string 'It also has a note on it reading'
        print_string 'Humans grow old every day...'
        print_string 'Maybe the computer can open it '
        room_2(player)
    end
end

def room_2_computer (player)
    puts "\n "
    print_string ' You see a computer and the screen propmts you with a password '
    print_string ' maybe the safe in the privious room has the password? '
    print_string 'Press 999 to exit'
    password = gets.chomp.to_i

    until password == 428 or password == 999 do
        print_string 'The computer flashes red telling you that you have provided an incorrect password'
        password = gets.chomp.to_i
    end

    if password == 428
        print_string 'the computer flashes green and tells you the door is now unlocked'
        player.push_backpack('Computer Key')
        room_2(player)
    elsif password == 999
        room_2(player)
    end
end


def room_3 (player)
    puts "\n \n"
    print_string 'You stand in the middle of the third room'
    print_string 'The room has a table with microphone and a piece of paper'
    print_string 'The piece of paper reads:'
    print_string 'In the morning it walks on 4 '
    print_string 'During mid day it walks upright on 2'
    print_string 'And during the night it walks on 3 '
    print_string 'Please speak into the microphone'
    print_string 'If you dont know the answer just say'
    print_string 'i dont know'
    print_string 'it will take you back to the room 2 '
    guess = gets.chomp.to_s.downcase
    until guess == 'human' or guess == 'i dont know' do
        print_string 'A speaker burst out of the ground and yells you have answered incorrectly!'
        guess = gets.chomp.to_s.downcase
    end
    if guess == 'i dont know'
        room_2(player)
    elsif guess == 'human'
        puts "\n \n"
        print_string 'The last door opens and you see the outside...'
        print_string "You have escaped #{player.get_name}!"
    end
end

room_1(player)
