class Switch
  attr_accessor :name, :pin
  # Attributes / State / Data
      # pin - physical GPIO pin number
      # name: Switch name - what is it for?
      # initial_state is used to set the switch to either off or on
  # Behaviour / code
      # check_state - returns boolean true or false
      # toggle - toggles on or off
      # on - turn on
      # off - turn off
      # get_name - returns the name of the switch, string
      # get_pin - returns the pin number of the switch - integer

  def initialize(pin, name, initial_state)#, state)
    # Instance variables
    @pin = pin
    @name = name
    if initial_state
      RPi::GPIO.setup @pin, as: :output, initialize: :high
    else
      RPi::GPIO.setup @pin, as: :output, initialize: :low
    end
  end

  def to_s
    @name
  end

  def state
    # Returns boolean true if it is on
    RPi::GPIO.high? @pin
  end

  def toggle
    if RPi::GPIO.high? @pin
      RPi::GPIO.set_low @pin
    else
      RPi::GPIO.set_high @pin
    end
  end

  def on
    RPi::GPIO.set_high @pin
  end

  def off
    RPi::GPIO.set_low @pin
  end

  def cleanup
    RPi::GPIO.clean_up @pin
  end
end
