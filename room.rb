require 'rpi_gpio'
require './switch'

class Room
  attr_accessor :name, :switches
  # Attributes
    # name - String, name of room
    # switches - List of switches
  # Behaviour
    # check_room - returns summary of switches and their states
    # check_switch - takes either name, or pin number, return switch associated with that? private method maybe
    # add(switch) - add switch to the list
    # remove(switch) - remove a switch
    # all_on - turn all switches on
    # all_off - turn all switches off

  def initialize(name, switch = nil)
    @name = name
    @switches = []
    self << switch
  end

  def test
    for i in 0..(@switches.length-1) do
      @switches[i].test
    end
  end

  def <<(switch)
    if switch
      @switches << switch
    end
  end

  def remove_switch(name)
    @switches.select { |switch| switch.name == name}.map {|switch| switch.delete}
    @switches.reject! {|switch| switch.name == name}
  end

  def to_s # Need help with this
    @name + "\n" + @switches.map(&:to_s).join("\n") + "\n"
  end

  def all_on
    @switches.map do |switch|
      switch.on
    end
  end

  def all_off
    @switches.map do |switch|
      switch.off
    end
  end

  def num_switches
    @switches.length
  end

  def get_info
    # if self.num_switches > 0
    # return switch.info for all switches
    # else
    # return "no switches in room"
  end
end
