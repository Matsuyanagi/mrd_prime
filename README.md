# MrdPrime

Miller-Rabin Prime Number Determination.

A small number(~2^81) makes a definitive decision.
A large number will fallback to `OpenSSL::BN::prime?`.

### About the amount of calculation

In order to reduce the amount of calculation, a decision is made using the minimum amount of calculation.
For example, just testing on 2 will determine up to 2047.
Testing on 2 and 3, gives a decision up to 1373653.

	https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test#Testing_against_small_sets_of_bases
	"if n < 3,317,044,064,679,887,385,961,981,
	it is enough to test a = 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, and 41.
	and the result will be deterministic."

## Installation

Add this line to your application's Gemfile:

```
gem 'mrd_prime'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install mrd_prime
```

## Usage

```
require 'mrd_prime'

small_number = (2**79 + 23)

puts( small_number.mrd_prime? )  #=> true
```

If you want to use the name `prime?`, you can alias it.

```rb
class Integer
	alias_method :prime?, :mrd_prime?
end

puts( (2**79 + 23).prime? )  #=> true
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Matsuyanagi/mrd_prime .

