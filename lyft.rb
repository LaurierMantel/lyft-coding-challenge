require 'logger'
logger = Logger.new(STDOUT)

# Assumptions: 
# - We can use the euclidean distance - as the crow flies - between points

#expects to be passed in two 2D arrays in the format [2][2]
def shortest_path(driver_one_coordinates, driver_two_coordinates)
  # driver_one_coordinates = A, B driver_two_coordinates = C,D

  #these distances are always necessary
  a_c = distance_between_points(driver_one_coordinates.first, driver_two_coordinates.first)
  b_d = distance_between_points(driver_one_coordinates.last, driver_two_coordinates.last)

  #whichever one of these is shorter will be used.  If they are equal, it does not matter
  a_b = distance_between_points(driver_one_coordinates.first, driver_one_coordinates.last)
  c_d = distance_between_points(driver_two_coordinates.first, driver_two_coordinates.last)

  #determining which path is shorter and returning appropriate distance
  if c_d <= a_b
    c_d + a_c + b_d
  else
    a_b + a_c + b_d
  end
end

def distance_between_points(point_a, point_b) #requires two arrays with two numbers each to be passed
  x_distance = (point_a.first - point_b.first).abs
  y_distance = (point_a.last - point_b.last).abs
  return Math.sqrt(x_distance**2 + y_distance**2)
end

#sample, expects output 12.0 (uses 3-4-5 triangle and 6-8-10 triangle )
driver1 = [[0,4], [3,0]]
driver2 = [[0,6], [8,0]]
logger.info(shortest_path(driver1, driver2))

# CHALLENGE
# Calculate the detour distance between two different rides. 
# Given four latitude / longitude pairs, where driver one is traveling from point A to point B 
# and driver two is traveling from point C to point D, write a function (in your language of choice) 
# to calculate the shorter of the detour distances the drivers would need to take to pick-up and 
# drop-off the other driver.
