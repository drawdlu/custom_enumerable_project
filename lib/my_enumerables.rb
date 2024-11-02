module Enumerable
  # Your code goes here

  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    new_arr = []
    self.my_each do |element|
      new_arr << element if yield(element)
    end
    new_arr
  end

  def my_all?
    self.my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    return self.length unless block_given?
    count = 0
    self.my_each do |element|
      count += 1 if yield(element)
    end
    count
  end

  def my_map
    new_arr = []
    self.my_each do |element|
      new_arr << yield(element)
    end
    new_arr
  end

  def my_inject(initial)
    val = initial
    self.my_each do |element|
      val = yield(val, element)
    end
    val
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
