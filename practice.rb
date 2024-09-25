# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password
    
    def initialize(name, email, password)
      @name = name
      @mail = email
      @password = password
    end
  
    def to_s
      "User(name=#{@name}, email=#{@mail})"
    end
  end
  
  user = User.new("Phone", "Phone@example.com", "passw0rd")
  puts user
  
 

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_accessor :name, :description, :users
    
    def initialize(name, description)
      @name = name
      @description = description
      @users = []  
    end
  
    def add_user(user)
      @users << user
    end
  
    def remove_user(user)
      @users.delete(user)
    end
  
    def list_users
      @users.map(&:to_s).join(", ")
    end
  
    def to_s
      "Room(name=#{@name}, description=#{@description}, users=#{list_users})"
    end
  end
  
  # Example usage
  room = Room.new("Lounge", "A place to relax and chat")
  user1 = User.new("Phone", "Phone@example.com", "passw0rd")
  user2 = User.new("PhonePy", "PhonePy@example.com", "passw0rd2")
  
  room.add_user(user1)
  room.add_user(user2)
  
  puts room
  

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_accessor :user, :room, :content
    
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end




    def tos
      "Message from #{user.name} in #{room.name}: #{content}"
    end
  end
  
  
  message = Message.new(user1, room, "Hello everyone!")
  puts message
  

# add a method to user so, user can enter to a room
# user.enter_room(room)

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)

class User
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  

    def enter_room(room)
      room.add_user(self)
      puts "#{@name} entered the room: #{room.name}"
    end
  

    def send_message(room, content)
      message = Message.new(self, content)
      room.broadcast(message)
    end
  

    def acknowledge_message(message)
      puts "#{@name} received message: '#{message.content}' from #{message.user.name}"
    end
  end
  
  class Room
    attr_accessor :name, :users
  
    def initialize(name)
      @name = name
      @users = []
    end
  

    def add_user(user)
      @users << user unless @users.include?(user)
    end
  

    def broadcast(message)
      @users.each do |user|
        user.acknowledge_message(message) unless user == message.user
      end
    end
  end
  
  class Message
    attr_accessor :user, :content
  
    def initialize(user, content)
      @user = user
      @content = content
    end
  end
  
  user1 = User.new("Phone")
  user2 = User.new("Phonpy")
  room = Room.new("Chat Room")
  
  user1.enter_room(room)
  user2.enter_room(room)
  
  user1.send_message(room, "Hello everyone!")
  