require 'test/unit'
require './main'


class SwitchTest < Test::Unit::TestCase

  def test_initialized
    switch = Switch.new(17, "Red", false)
    assert switch.pin == 17
    assert switch.name == "Red"
    assert switch.state == false

    switch = Switch.new(17, "Red", true)
    assert switch.state
  end

  def test_on_method
    switch = Switch.new(17, "Red", false)
    switch.on
    assert switch.state
  end

  def test_off_method
    switch = Switch.new(17, "Red", true)
    switch.off
    refute switch.state
  end

  def test_toggle_method
    switch = Switch.new(17, "Red", false)
    switch.toggle
    assert switch.state
    switch.toggle
    refute switch.state
  end

  def teardown
    RPi::GPIO.clean_up
  end
end


class RoomTest < Test::Unit::TestCase
  def  test_initialized
    s1 = Switch.new(17, "Red", false)
    room = Room.new("ABC", s1)
    assert room.name == "ABC"
    assert room.switches == [s1]
  end

  def test_initialized_no_switch
    room = Room.new("DEF")
    assert room.name == "DEF"
    assert room.switches == []
  end

  def test_push_method
    s1 = Switch.new(17, "Red", false)
    room = Room.new("DEF")
    assert room.switches.empty?
    room << nil
    assert room.switches.empty?    
    room << s1
    assert room.switches == [s1]
  end

  def teardown
    RPi::GPIO.clean_up
  end
end
