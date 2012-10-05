#!/usr/bin/env ruby
#
print %q^
************************ Chainning methods for tracing *****
Metaprogramming often involves dynamic modification of methods beyond dynamic definition of methods. 
Methods are modified with a technique called alias chaining.

This defines singleton methods on the object and uses super within singleton 
to chain to original instance method definition.

Remember, in method lookup, the singeleton methods are checked first. So, if you have the same method name in singleton methods also, it will be called and by calling super it chains to the original instance method.
*********************
^
gets
print %q^
#---------------------------
# Define trace! and untrace! instance methods for all objects.
# trace! "chains" the named methods by defining singleton methods
# that add tracing functionality and then use super to call the original.
# untrace! deletes the singleton methods to remove tracing.
class Object
  # Trace the specified methods, sending output to STDERR.
  def trace!(*methods)
    @_traced = @_traced || []    # Remember the set of traced methods

    # If no methods were specified, use all public methods defined 
    # directly (not inherited) by the class of this object 
    methods = public_methods(false) if methods.size == 0

    methods.map! {|m| m.to_sym } # Convert any strings to symbols
    methods -= @_traced          # Remove methods that are already traced
    return if methods.empty?     # Return early if there is nothing to do
    @_traced |= methods          # Add methods to set of traced methods

    # Trace the fact that we're starting to trace these methods
    STDERR << "Tracing #{methods.join(', ')} on #{object_id}\n"

    # Singleton methods are defined in the eigenclass
    eigenclass = class << self; self; end
^
gets
print %q^
    methods.each do |m|         # For each method m
      # Define a traced singleton version of the method m.
      # Output tracing information and use super to invoke the
      # instance method that it is tracing.
      # We want the defined  methods to be able to accept blocks, so we
      # can't use define_method, and must instead evaluate a string.
      # Note that everything between %Q{ and the matching } is a 
      # double-quoted string, not a block. Also note that there are 
      # two levels of string interpolations here. #{} is interpolated
      # when the singleton method is defined. And \#{} is interpolated 
      # when the singleton method is invoked.
      eigenclass.class_eval %Q{
        def #{m}(*args, &block)
          begin
            STDERR << "Entering: #{m}(\#{args.join(', ')})\n"
            result = super
            STDERR << "Exiting: #{m} with \#{result}\n"
            result
          rescue
            STDERR << "Aborting: #{m}: \#{$!.class}: \#{$!.message}"
            raise
          end
        end
      }
    end
  end
^
gets
print %q^

  # Untrace the specified methods or all traced methods
  def untrace!(*methods)
    if methods.size == 0    # If no methods specified untrace
      methods = @_traced    # all currently traced methods
      STDERR << "Untracing all methods on #{object_id}\n"
    else                    # Otherwise, untrace
      methods.map! {|m| m.to_sym }  # Convert string to symbols
      methods &= @_traced   # all specified methods that are traced
      STDERR << "Untracing #{methods.join(', ')} on #{object_id}\n"
    end

    @_traced -= methods     # Remove them from our set of traced methods

    # Remove the traced singleton methods from the eigenclass
    # Note that we class_eval a block here, not a string
    (class << self; self; end).class_eval do
      methods.each do |m|
        remove_method m     # undef_method would not work correctly
      end
    end

    # If no methods are traced anymore, remove our instance var 
    if @_traced.empty?
      remove_instance_variable :@_traced
    end
  end
end

^
#---------------------------
# Define trace! and untrace! instance methods for all objects.
# trace! "chains" the named methods by defining singleton methods
# that add tracing functionality and then use super to call the original.
# untrace! deletes the singleton methods to remove tracing.
class Object
  # Trace the specified methods, sending output to STDERR.
  def trace!(*methods)
    @_traced = @_traced || []    # Remember the set of traced methods

    # If no methods were specified, use all public methods defined 
    # directly (not inherited) by the class of this object 
    methods = public_methods(false) if methods.size == 0

    methods.map! {|m| m.to_sym } # Convert any strings to symbols
    methods -= @_traced          # Remove methods that are already traced
    return if methods.empty?     # Return early if there is nothing to do
    @_traced |= methods          # Add methods to set of traced methods

    # Trace the fact that we're starting to trace these methods
    STDERR << "Tracing #{methods.join(', ')} on #{object_id}\n"

    # Singleton methods are defined in the eigenclass
    eigenclass = class << self; self; end

    methods.each do |m|         # For each method m
      # Define a traced singleton version of the method m.
      # Output tracing information and use super to invoke the
      # instance method that it is tracing.
      # We want the defined  methods to be able to accept blocks, so we
      # can't use define_method, and must instead evaluate a string.
      # Note that everything between %Q{ and the matching } is a 
      # double-quoted string, not a block. Also note that there are 
      # two levels of string interpolations here. #{} is interpolated
      # when the singleton method is defined. And \#{} is interpolated 
      # when the singleton method is invoked.
      eigenclass.class_eval %Q{
        def #{m}(*args, &block)
          begin
            STDERR << "Entering: #{m}(\#{args.join(', ')})\n"
            result = super
            STDERR << "Exiting: #{m} with \#{result}\n"
            result
          rescue
            STDERR << "Aborting: #{m}: \#{$!.class}: \#{$!.message}"
            raise
          end
        end
      }
    end
  end

  # Untrace the specified methods or all traced methods
  def untrace!(*methods)
    if methods.size == 0    # If no methods specified untrace
      methods = @_traced    # all currently traced methods
      STDERR << "Untracing all methods on #{object_id}\n"
    else                    # Otherwise, untrace
      methods.map! {|m| m.to_sym }  # Convert string to symbols
      methods &= @_traced   # all specified methods that are traced
      STDERR << "Untracing #{methods.join(', ')} on #{object_id}\n"
    end

    @_traced -= methods     # Remove them from our set of traced methods

    # Remove the traced singleton methods from the eigenclass
    # Note that we class_eval a block here, not a string
    (class << self; self; end).class_eval do
      methods.each do |m|
        remove_method m     # undef_method would not work correctly
      end
    end

    # If no methods are traced anymore, remove our instance var 
    if @_traced.empty?
      remove_instance_variable :@_traced
    end
  end
end

__END__
---------------------------
pagetitle = "Test Page for XML.generate"
XML.generate(STDOUT) do 
  html do
    head do
      title { pagetitle }
      comment "This is a test"
    end
    body do
      h1(:style => "font-family:sans-serif") { pagetitle }
      ul :type=>"square" do
        li { Time.now }
        li { RUBY_VERSION }
      end
    end
  end
end
---------------------------
<html><head>
<title>Test Page for XML.generate</title>
<!-- This is a test -->
</head><body>
<h1 style='font-family:sans-serif'>Test Page for XML.generate</h1>
<ul type='square'>
<li>2007-08-19 16:19:58 -0700</li>
<li>1.9.0</li>
</ul></body></html>
---------------------------
class XML
  # Create an instance of this class, specifying a stream or object to
  # hold the output. This can be any object that responds to <<(String).
  def initialize(out)
    @out = out  # Remember where to send our output
  end

  # Output the specified object as CDATA, return nil.
  def content(text)
    @out << text.to_s
    nil
  end

  # Output the specified object as a comment, return nil.
  def comment(text)
    @out << "<!-- #{text} -->"
    nil
  end

  # Output a tag with the specified name and attributes.
  # If there is a block invoke it to output or return content.
  # Return nil.
  def tag(tagname, attributes={})
    # Output the tag name
    @out << "<#{tagname}"

    # Output the attributes
    attributes.each {|attr,value| @out << " #{attr}='#{value}'" }
    
    if block_given?
      # This block has content
      @out << '>'             # End the opening tag
      content = yield         # Invoke the block to output or return content
      if content              # If any content returned
        @out << content.to_s  # Output it as a string
      end
      @out << "</#{tagname}>" # Close the tag
    else 
      # Otherwise, this is an empty tag, so just close it.
      @out << '/>'
    end
    nil # Tags output themselves, so they don't return any content
  end

  # The code below is what changes this from an ordinary class into a DSL.
  # First: any unknown method is treated as the name of a tag.
  alias method_missing tag

  # Second: run a block in a new instance of the class.
  def self.generate(out, &block)
    XML.new(out).instance_eval(&block)
  end
end
---------------------------
class HTMLForm < XMLGrammar
  element :form, :action => REQ,
                 :method => "GET",
                 :enctype => "application/x-www-form-urlencoded",
                 :name => OPT
  element :input, :type => "text", :name => OPT, :value => OPT,
                  :maxlength => OPT, :size => OPT, :src => OPT,
                  :checked => BOOL, :disabled => BOOL, :readonly => BOOL
  element :textarea, :rows => REQ, :cols => REQ, :name => OPT,
                     :disabled => BOOL, :readonly => BOOL
  element :button, :name => OPT, :value => OPT,
                   :type => "submit", :disabled => OPT
end
---------------------------
HTMLForm.generate(STDOUT) do
  comment "This is a simple HTML form"
  form :name => "registration",
       :action => "http://www.example.com/register.cgi" do
    content "Name:"
    input :name => "name"
    content "Address:"
    textarea :name => "address", :rows=>6, :cols=>40 do
      "Please enter your mailing address here"
    end
    button { "Submit" }
  end
end
---------------------------
class XMLGrammar
  # Create an instance of this class, specifying a stream or object to
  # hold the output. This can be any object that responds to <<(String).
  def initialize(out)
    @out = out  # Remember where to send our output
  end

  # Invoke the block in an instance that outputs to the specified stream.
  def self.generate(out, &block)
    new(out).instance_eval(&block)
  end

  # Define an allowed element (or tag) in the grammar.
  # This class method is the grammar-specification DSL
  # and defines the methods that constitute the XML-output DSL.
  def self.element(tagname, attributes={})
    @allowed_attributes ||= {}
    @allowed_attributes[tagname] = attributes

    class_eval %Q{
      def #{tagname}(attributes={}, &block)
        tag(:#{tagname},attributes,&block)
      end
    }
  end

  # These are constants used when defining attribute values.
  OPT = :opt     # for optional attributes
  REQ = :req     # for required attributes
  BOOL = :bool   # for attributes whose value is their own name

  def self.allowed_attributes
    @allowed_attributes
  end

  # Output the specified object as CDATA, return nil.
  def content(text)
    @out << text.to_s
    nil
  end

  # Output the specified object as a comment, return nil.
  def comment(text)
    @out << "<!-- #{text} -->"
    nil
  end

  # Output a tag with the specified name and attribute.
  # If there is a block, invoke it to output or return content.
  # Return nil.
  def tag(tagname, attributes={})
    # Output the tag name
    @out << "<#{tagname}"

    # Get the allowed attributes for this tag.
    allowed = self.class.allowed_attributes[tagname]

    # First, make sure that each of the attributes is allowed.
    # Assuming they are allowed, output all of the specified ones.
    attributes.each_pair do |key,value|
      raise "unknown attribute: #{key}" unless allowed.include?(key)
      @out << " #{key}='#{value}'"
    end

    # Now look through the allowed attributes, checking for 
    # required attributes that were omitted and for attributes with
    # default values that we can output.
    allowed.each_pair do |key,value|
      # If this attribute was already output, do nothing.
      next if attributes.has_key? key
      if (value == REQ)
        raise "required attribute '#{key}' missing in <#{tagname}>"
      elsif value.is_a? String
        @out << " #{key}='#{value}'"
      end
    end

    if block_given?
      # This block has content
      @out << '>'             # End the opening tag
      content = yield         # Invoke the block to output or return content
      if content              # If any content returned
        @out << content.to_s  # Output it as a string
      end
      @out << "</#{tagname}>" # Close the tag
    else 
      # Otherwise, this is an empty tag, so just close it.
      @out << '/>'
    end
    nil # Tags output themselves, so they don't return any content.
  end
end
---------------------------
