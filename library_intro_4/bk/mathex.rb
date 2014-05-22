#!/usr/bin/env ruby
#
#   

__END__

---------------------------
# General Predicates
0.zero?        # => true (is this number zero?)
1.0.zero?      # => false
0.0.nonzero?   # => nil (works like false)
1.nonzero?     # => 1 (works like true)
1.integer?     # => true
1.0.integer?   # => false
1.scalar?      # => false: not a complex number. Ruby 1.9.
1.0.scalar?    # => false: not a complex number. Ruby 1.9.
Complex(1,2).scalar? # => true: a complex number. requires 'complex'.

# Integer predicates
0.even?        # => true (Ruby 1.9)
0.odd?         # => false

# Float predicates
ZERO, INF, NAN = 0.0, 1.0/0.0, 0.0/0.0  # Constants for testing

ZERO.finite?   # => true: is this number finite?
INF.finite?    # => false
NAN.finite?    # => false

ZERO.infinite? # => nil: is this number infinite? Positive or negative?
INF.infinite?  # => 1
-INF.infinite? # => -1
NAN.infinite?  # => nil

ZERO.nan?      # => false: is this number not-a-number?
INF.nan?       # => false
NAN.nan?       # => true
---------------------------
# Rounding methods
1.1.ceil     # =>  2: ceiling: smallest integer >= its argument
-1.1.ceil    # => -1: ceiling: smallest integer >= its argument
1.9.floor    # =>  1: floor: largest integer <= its argument
-1.9.floor   # => -2: floor: largest integer <= its argument
1.1.round    # =>  1: round to nearest integer
0.5.round    # =>  1: round toward infinity when halfway between integers 
-0.5.round   # => -1: or round toward negative infinity
1.1.truncate # =>  1: chop off fractional part: round toward zero
-1.1.to_i    # => -1: synonym for truncate
---------------------------
# Absolute value and sign
-2.0.abs     # => 2.0: absolute value
-2.0<=>0.0   # => -1: use <=> operator to compute sign of a number

# Constants
Float::MAX     # => 1.79769313486232e+308: may be platform dependent
Float::MIN     # => 2.2250738585072e-308
Float::EPSILON # => 2.22044604925031e-16: difference between adjacent floats
---------------------------
# Constants
Math::PI               # => 3.14159265358979
Math::E                # => 2.71828182845905

# Roots
Math.sqrt(25.0)        # => 5.0: square root
27.0**(1.0/3.0)        # => 3.0: cube root computed with ** operator

# Logarithms
Math.log10(100.0)      # => 2.0: base-10 logarithm
Math.log(Math::E**3)   # => 3.0: natural (base-e) logarithm
Math.log2(8)           # => 3.0: base-2 logarithm. Ruby 1.9 and later.
Math.log(16, 4)        # => 2.0: 2nd arg to log() is the base. Ruby 1.9.
Math.exp(2)            # => 7.38905609893065": same as Math::E**2

# Trigonometry
include Math           # Save typing: we can now omit Math prefix.
sin(PI/2)              # => 1.0: sine. Argument is in radians, not degrees.
cos(0)                 # => 1.0: cosine.
tan(PI/4)              # => 1.0: tangent.
asin(1.0)/PI           # => 0.5: arcsine. See also acos and atan.
sinh(0)                # => 0.0: hyperbolic sine. Also cosh, tanh.
asinh(1.0)             # => 0.0: inverse sinh. Also acosh, atanh.

# Convert cartesian point (x,y) to polar coordinates (theta, r)
theta = atan2(y,x)     # Angle between X axis and line (0,0)-(x,y)
r = hypot(x,y)         # Hypotenuse: sqrt(x**2 + y**2)

# Decompose float x into fraction f and exponent e, such that x = f*2**e
f,e = frexp(1024.0)    # => [0.5, 11]
x = ldexp(f, e)        # => 1024: compute x = f*2**e

# Error function
erf(0.0)               # => 0.0: error function
erfc(0.0)              # => 1.0: 1-erf(x): complementary error function
---------------------------
require "bigdecimal"      # Load standard library
dime = BigDecimal("0.1")  # Pass a string to constructor, not a Float
4*dime-3*dime == dime     # true with BigDecimal, but false if we use Float

# Compute monthly interest payments on a mortgage with BigDecimal.
# Use "Banker's Rounding" mode, and limit computations to 20 digits
BigDecimal.mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_HALF_EVEN)
BigDecimal.limit(20)
principal = BigDecimal("200000")  # Always pass strings to constructor
apr = BigDecimal("6.5")           # Annual percentage rate interest
years = 30                        # Term of mortgage in years
payments = years*12               # 12 monthly payments in a year
interest = apr/100/12             # Convert APR to monthly fraction
x = (interest+1)**payments        # Note exponentiation with BigDecimal
monthly = (principal * interest * x)/(x-1)  # Compute monthly payment
monthly = monthly.round(2)        # Round to two decimal places
monthly = monthly.to_s("f")       # Convert to human-readable string
---------------------------
require "complex"           # Complex is part of the standard library
c = Complex(0.5,-0.2)       # .5-.2i.  
z = Complex.new(0.0, 0.0)   # Complex.new also works, but is not required
10.times { z = z*z + c }    # Iteration for computing Julia set fractals
magnitude = z.abs           # Magnitude of a complex number
x = Math.sin(z)             # Trig functions work with Complex numbers
Math.sqrt(-1.0).to_s        # => "1.0i": square root of -1
Math.sqrt(-1.0)==Complex::I # => true
---------------------------
require "rational"           # Load the library
penny = Rational(1, 100)     # A penny is 1/100th
require "mathn"              # Makes integer division produce Rational values
nickel = 5/100
dime = 10/100
quarter = 1/4
change = 2*quarter + 3*penny # Rational result: 53/100
(1/2 * 1/3).to_s             # "1/6": mathn prints Rationals as fractions
---------------------------
require "matrix"

# Represent the point (1,1) as the vector [1,1]
unit = Vector[1,1]

# The identity transformation matrix
identity = Matrix.identity(2)  # 2x2 matrix
identity*unit == unit          # true: no transformation

# This matrix scales a point by sx,sy
sx,sy = 2.0, 3.0;
scale = Matrix[[sx,0], [0, sy]]
scale*unit             # => [2.0, 3.0]: scaled point

# This matrix rotates counterclockwise around the origin
theta = Math::PI/2     # 90 degrees
rotate = Matrix[[Math.cos(theta), -Math.sin(theta)],
                [Math.sin(theta),  Math.cos(theta)]]
rotate*unit            # [-1.0, 1.0]: 90 degree rotation

# Two transformations in one
scale * (rotate*unit)  # [-2.0, 3.0]
---------------------------
rand       # => 0.964395196505186
rand       # => 0.390523655919935
rand(100)  # => 81
rand(100)  # => 32
---------------------------
srand(0)                # Known seed
[rand(100),rand(100)]   # => [44,47]: pseudorandom sequence
srand(0)                # Reset the seed to repeat the sequence
[rand(100),rand(100)]   # => [44,47]
---------------------------
