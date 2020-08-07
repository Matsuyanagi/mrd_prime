require "mrd_prime/version"

require 'openssl'

class Integer
  # Returns true if +self+ is a prime number, else returns false.
  # 
  # https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
  # https://oeis.org/A014233/list
  #
  # "if n < 3,317,044,064,679,887,385,961,981,
  # it is enough to test a = 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, and 41.
  # and the result will be deterministic."
  #
  def mrd_prime?

    return false if self < 2
    return true  if self < 4
    return false if self.even?

    prime_and_max = {
      2  =>  8321,      # 2047.  Strong pseudoprimes to base 2, [ 2047(=23x89), 3277(=29x113), 4033(=37x109), 4681(=31x151), 8321(=53x157) ] ~ 4681 is divided by a small prime number. 
      3  =>  1373653,
      5  =>  25326001,
      7  =>  3215031751,
      11  =>  2152302898747,
      13  =>  3474749660383,
      17  =>  341550071728321,
      19  =>  341550071728321,
      23  =>  3825123056546413051,
      29  =>  3825123056546413051,
      31  =>  3825123056546413051,
      37  =>  318665857834031151167461,
      41  =>  3317044064679887385961981,
    }
    
    last_p = 1
    prime_and_max.each do |p,m|
      return true if self == p
      return false if self % p == 0
      last_p = p
    end
    return true if self < last_p * last_p

    p_1 = self - 1

    d = p_1
    while d.even?
      d >>= 1
    end

    prime_and_max.each do |a,m|
      x = a.pow( d, self )

      if x == 1
        return true if self < m
        next
      end

      td = d
      while td != p_1 && x != p_1
        x = x.pow( 2, self )
        td <<= 1
      end

      if td == p_1
        return false
      else
        return true if x == p_1 && self < m
      end

    end

    # OpenSSL fallback
    # return true
    return OpenSSL::BN.new( self ).prime?
  end
end

