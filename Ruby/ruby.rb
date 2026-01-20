# puts prints text to the terminal, followed by a new line
puts "\n===1) Symbols vs Strings (identity / immutability idea) ==="

# puts with no arguments prints a blank line
puts

# sym1 and sym2 are variables holding a SYMBOL named :duck
# immutable identifiers, labels
sym1 = :duck
sym2 = :duck

# str1 and str2 hold a STRING "duck"
# mutable, can be changed
str1 = "duck"
str2 = "duck"

# #{...} is a string interpolation
puts "sym1 = #{sym1}, sym2 = #{sym2}"

# print the two strings
puts "str1 = #{str1}, str2 = #{str2}"

# object_id is a unique identifier for an object in memory
puts "Symbol object_id same? #{sym1.object_id == sym2.object_id}"

# print the memory identity of sym1 and sym2
puts "sym1.object_id = #{sym1.object_id}"
puts "sym2.object_id = #{sym2.object_id}"

# Ruby creates different objects even if the text is the same 
puts "String object_id same? #{str1.object_id == str2.object_id}"

# print the memory identity of sym1 and sym2
puts "str1.object_id = #{str1.object_id}"
puts "str2.object_id = #{str2.object_id}"

# << append to a string in-place, mutates it
str1 << "!"
puts "After mutating str1 with << '!':"
puts "str1 is now: #{str1}"
puts "str2 is still: #{str2}"
puts

puts "SECTION 2) Symbol Table (Symbol.all_symbols)"
puts

# Symbol.all_symbols returns an array of all symbols Ruby currently knows
before_count = Symbol.all_symbols.length
puts "Symbol count before creating new symbols: #{before_count}"

# references the symbol named :mallard
:mallard

after_count = Symbol.all_symbols.length
puts "Symbol count after creating new symbols: #{after_count}"

puts "Small sample of symbols (first 25 sorted):"
sample = Symbol.all_symbols.sort.first(25)

# map(&:to_s) converts each symbol to a string
# join(" | ") combines them into one line seperated by " | "
puts sample.map(&:to_s).join(" | ")
puts

puts "SECTION 3) Defining methods/classes introduces symbols"
puts

def quack
  puts "quack"
end

class Duck
  def walk
    puts "waddle"
  end
end

duck = Duck.new
duck.walk
quack
puts

puts "SECTION 4) Symbols as Hash keys"
puts

# Hash (dictionary / map) where the KEYS are strings
hash_string_keys = {"duck" => "quack", "cow" => "moo"}

# hash where the KEYS are symbols
hash_symbol_keys = {:duck => "quack", :cow => "moo"}

# Ruby shorthand syntax for symbol keys, duck: is the same as :duck =>
hash_shorthand = {duck: "quack", cow: "moo"}

puts "String key lookup: hash_string_keys[\"duck\"] = #{hash_string_keys["duck"]}"
puts "Symbol key lookup: hash_string_keys[:duck] = #{hash_symbol_keys[:duck]}"
puts "Shorthand lookup: hash_shorthand[:duck] = #{hash_shorthand[:duck]}"
puts

puts "SECTION 5) Ruby variable types"

class Student
  # @@ means class variable: shared across the class and all instances of the class
  @@no_of_students = 0

  SCHOOL_ID = 2561

  # define a class method, call it like Student.count (not on an instance)
  def self.count
    # the last expression in a Ruby method is returned automatically
    @@no_of_students
  end

  def self.school_id
    SCHOOL_ID
  end

  # initialize runs automatically when you do Student.new(...)
  # constructor
  def initialize(id, name, age)
    # @ means instance variable: stored on each individual object
    @student_id = id
    @student_name = name
    @student_age = age
    # increment the shared class variable each time we create a Student
    @@no_of_students += 1
  end

  # method name ending with ? is a Ruby convention
  def over_age_limit?
    age_limit = 18
    @student_age > age_limit
  end
end

s1 = Student.new(1, "Bob", 19)
s2 = Student.new(2, "John", 17)

puts "Student.count (class variable) = #{Student.count}"
puts "Student.school_id = #{Student.school_id}"
puts "s1.over_age_limit? = #{s1.over_age_limit?}"
puts "s2.over_age_limit? = #{s2.over_age_limit?}"
puts