require_relative 'modules'

class Wagon
  include Manufacturer
end

for i := 1; i < 100; i =i*2 {
	i += 4

	if i%2 == 0 {
	  println("чётное")
	}
  }
