#!/usr/bin/env ruby
print %q^
***********
One important Metaprogramming technique is to to the use of methods that create method.
These private instance methods of Module are used like keywords within class definitions.
They accept attributes names as their arguments, and dynamically create methods with those names.

***********
^
puts ; gets
print %q^
*************** Defining Methods with class_eval
class Point
  readonly :x , :y 
  readwrite :xx , :yy 
end

class Module
  private     # The methods that follow are both private

  # This method works like attr_reader, but has a shorter name
  def readonly(*syms)
    return if syms.size == 0  # If no arguments, do nothing
    code = ""                 # Start with an empty string of code
    # Generate a string of Ruby code to define attribute reader methods.
    # Notice how the symbol is interpolated into the string of code.
    syms.each do |s|                     # For each symbol
      code << "def #{s}; @#{s}; end\n"   # The method definition
    end
    # Finally, class_eval the generated code to create instance methods.
    class_eval code
  end

  # This method works like attr_accessor, but has a shorter name.
  def readwrite(*syms)
    return if syms.size == 0
    code = ""
    syms.each do |s|
      code << "def #{s}; @#{s} end\n"
      code << "def #{s}=(value); @#{s} = value; end\n"
    end
    class_eval code
  end
end
**************
^
puts ; gets
print %q^
***************
class Point
  readonly :x , :y 
  readwrite :xx , :yy 
end

ap = Point.new
ap.xx = 5
ap.yy = 5
puts "ap.xx = #{ap.xx}"

**************
^
puts ; gets
print %q^
*************** Defining Methods with define_method
---------------------------
class Point
  attributes :x => 0, :y => 0
end
---------------------------
class Point
  attributes x:0, y:0
end
---------------------------
class Module
  # This method defines attribute reader and writer methods for named
  # attributes, but expects a hash argument mapping attribute names to
  # default values. The generated attribute reader methods return the
  # default value if the instance variable has not yet been defined.
  def attributes(hash)
    hash.each_pair do |symbol, default|   # For each attribute/default pair
      getter = symbol                     # Name of the getter method
      setter = :"#{symbol}="              # Name of the setter method
      variable = :"@#{symbol}"            # Name of the instance variable
      define_method getter do             # Define the getter method
        if instance_variable_defined? variable
          instance_variable_get variable  # Return variable, if defined
        else
          default                         # Otherwise return default
        end
      end

      define_method setter do |value|     # Define setter method
        instance_variable_set variable,   # Set the instance variable
                              value       # To the argument value
      end
    end
  end

  # This method works like attributes, but defines class methods instead
  # by invoking attributes on the eigenclass instead of on self.
  # Note that the defined methods use class instance variables
  # instead of regular class variables.  
  def class_attrs(hash)
    eigenclass = class << self; self; end
    eigenclass.class_eval { attributes(hash) }
  end

  # Both methods are private
  private :attributes, :class_attrs
end
---------------------------
**************
^
puts ; gets
print %q^
***************
class Point
  attributes :x => 0, :y => 0
end
ap = Point.new
ap.x = 7
ap.y = 6
puts "ap.x = #{ap.x}"
#---------------------------
class Point
  attributes x:0, y:0
end
ap = Point.new
ap.x = 8
ap.y = 9
puts "ap.x = #{ap.x}"
**************
^
class Module
  private     # The methods that follow are both private

  # This method works like attr_reader, but has a shorter name
  def readonly(*syms)
    return if syms.size == 0  # If no arguments, do nothing
    code = ""                 # Start with an empty string of code
    # Generate a string of Ruby code to define attribute reader methods.
    # Notice how the symbol is interpolated into the string of code.
    syms.each do |s|                     # For each symbol
      code << "def #{s}; @#{s}; end\n"   # The method definition
    end
    # Finally, class_eval the generated code to create instance methods.
    class_eval code
  end

  # This method works like attr_accessor, but has a shorter name.
  def readwrite(*syms)
    return if syms.size == 0
    code = ""
    syms.each do |s|
      code << "def #{s}; @#{s} end\n"
      code << "def #{s}=(value); @#{s} = value; end\n"
    end
    class_eval code
  end
end

class Point
  readonly :x , :y 
  readwrite :xx , :yy 
end

ap = Point.new
ap.xx = 5
ap.yy = 5
puts "ap.xx = #{ap.xx}"




#---------------------------
class Module
  # This method defines attribute reader and writer methods for named
  # attributes, but expects a hash argument mapping attribute names to
  # default values. The generated attribute reader methods return the
  # default value if the instance variable has not yet been defined.
  def attributes(hash)
    hash.each_pair do |symbol, default|   # For each attribute/default pair
      getter = symbol                     # Name of the getter method
      setter = :"#{symbol}="              # Name of the setter method
      variable = :"@#{symbol}"            # Name of the instance variable
      define_method getter do             # Define the getter method
        if instance_variable_defined? variable
          instance_variable_get variable  # Return variable, if defined
        else
          default                         # Otherwise return default
        end
      end

      define_method setter do |value|     # Define setter method
        instance_variable_set variable,   # Set the instance variable
                              value       # To the argument value
      end
    end
  end

  # This method works like attributes, but defines class methods instead
  # by invoking attributes on the eigenclass instead of on self.
  # Note that the defined methods use class instance variables
  # instead of regular class variables.  
  def class_attrs(hash)
    eigenclass = class << self; self; end
    eigenclass.class_eval { attributes(hash) }
  end

  # Both methods are private
  private :attributes, :class_attrs
end
#---------------------------
#---------------------------
class Point
  attributes :x => 0, :y => 0
end
ap = Point.new
ap.x = 7
ap.y = 6
puts "ap.x = #{ap.x}"
#---------------------------
class Point
  attributes x:0, y:0
end
ap = Point.new
ap.x = 8
ap.y = 9
puts "ap.x = #{ap.x}"
