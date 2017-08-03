## Database
require 'sequel'

module DB
  db = Sequel.connect('sqlite://data.db') # connects to database via URL, requires sqlite3

  if !db.table_exists?(:room)
    db.create_table :room do
      primary_key :id
      String :name
    end
  end
  if !db.table_exists?(:switch)
    db.create_table :switch do
      primary_key :id
      String :name
      int :pin
      String :room_id
    end
  end

  class Data
    @@room = DB[:room]
    @@switch = DB[:switch]

    def self.add_room(name)
      @@room.insert(:name: name)
    end
    def self.add_room_switch(rname, sname, pin)
      if @@room.where(:name: rname) do
        print "Already a room"
      else
        @@room.insert(:name: rname)
      end
      add_switch(sname, pin, @@room.where(:name: rname).:id)
    end
    def add_switch(sname, pin, room_id)
      if @@switch.where(:room_id: room_id) do
        print "Already a switch"
      else
        @@switch.insert(:name: sname, :pin: pin, :room_id: room_id)
      end
    end
  end
end
# create table when
# NA

# Tables for
# Room
# Switch

# New room
# Add to Room table, room name
# new switch add to table name, pin, room id
#
