class Person

  attr_accessor :name

  # def initialize(name)   #Why this instead of ACCESSOR
  #   @name = name
  # end

  def greeting
    puts "Hi, my name is #{@name}"
  end

end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object"
  end
end

chris = Instructor.new  #Don't get this syntax
chris.name = "Chris"
chris.greeting

# cristina = Student.new("Cristina")
# cristina.greeting

chris.teach

# cristina.teach #This is because the teach method does not exist within the Student class