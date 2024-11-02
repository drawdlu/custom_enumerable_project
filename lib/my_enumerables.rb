module Enumerable
  # Your code goes here

  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element, index)
      index += 1
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    last_index = self.length - 1
    for index in 0..last_index do
      yield(self[index])
    end
    return self
  end
end
