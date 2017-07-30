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
    room = Room.new("Room", s1)
    assert room.name == "Room"
    assert room.switches == [s1]
  end

  def test_initialized_case_no_switch
    room = Room.new("Room")
    assert room.name == "Room"
    assert room.switches == []
  end

  def test_push_method_case_nil
    room = Room.new("Room")
    room << nil
    assert room.switches.empty?
  end

  def test_push_method_case_switch
    s1 = Switch.new(17, "Red", false)
      room = Room.new("Room")
      room << s1
      assert room.switches == [s1]
    end

  def test_push_method_case_array_of_switch
    s1 = Switch.new(17, "Red", false)
    s2 = Switch.new(27, "Green", false)
    room = Room.new("Room")
    room << [s1, s2]
    assert room.switches == [s1, s2]
  end

  def test_push_method_case_array_of_switch_and_nil
    s1 = Switch.new(17, "Red", false)
    s2 = Switch.new(27, "Green", false)
    room = Room.new("Room")
    room << [s1, [s2, nil, [[]]], [1, 2, 3], 1, 3, 5, "hello"]
    assert room.switches == [s1, s2]
  end

  def test_remove_method
    s1 = Switch.new(17, "Red", false)
    room = Room.new("Room", s1)
    room.remove_switch "Red"
    assert room.switches.empty?
  end

  def test_all_on_method
    s1 = Switch.new(17, "Red", false)
    s2 = Switch.new(27, "Green", false)
    s3 = Switch.new(22, "Blue", false)
    room = Room.new("Room", [s1, s2, s3])
    room.all_on
    assert s1.state
    assert s2.state
    assert s3.state
  end

  def test_all_off_method
    s1 = Switch.new(17, "Red", true)
    s2 = Switch.new(27, "Green", true)
    s3 = Switch.new(22, "Blue", true)
    room = Room.new("Room", [s1, s2, s3])
    room.all_off
    refute s1.state
    refute s2.state
    refute s3.state
  end

  def teardown
    RPi::GPIO.clean_up
  end
end
