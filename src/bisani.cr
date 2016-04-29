require "./bisani/*"
require "big_int"
require "miller_rabin"

module Bisani
  ValueBank = Bisani::Values.new

  class NotAPrime < Exception
  end

  def self.to_i32(num : Int32)
    Bisani.i32_deobfuscate(num)
  end

  def self.to_i64(num : Int64)
    Bisani.i64_deobfuscate(num)
  end

  def self.to_u32(num : UInt32)
    Bisani.ui32_deobfuscate(num)
  end

  def self.to_u64(num : UInt64)
    Bisani.ui64_deobfuscate(num)
  end

  def self.i32_obfuscate(num : Int32)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, BigInt.new(ValueBank.int32_prime), BigInt.new(Int32::MAX))
    return big_int.to_i32
  end

  def self.i64_obfuscate(num : Int64)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, BigInt.new(ValueBank.int64_prime), BigInt.new(Int64::MAX))
    return big_int.to_i64
  end

  def self.ui32_obfuscate(num : UInt32)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, BigInt.new(ValueBank.uint32_prime), BigInt.new(UInt32::MAX))
    return big_int.to_u32
  end

  def self.ui64_obfuscate(num : UInt64)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, BigInt.new(ValueBank.uint64_prime), BigInt.new(UInt64::MAX))
    return big_int.to_u64
  end

  def self.i32_deobfuscate(num : Int32)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, BigInt.new(ValueBank.int32_coprime), BigInt.new(Int32::MAX))
    return big_int.to_i32
  end

  def self.i64_deobfuscate(num : Int64)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, BigInt.new(ValueBank.int64_coprime), BigInt.new(Int64::MAX))
    return big_int.to_i64
  end

  def self.ui32_deobfuscate(num : UInt32)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, BigInt.new(ValueBank.uint32_coprime), BigInt.new(UInt32::MAX))
    return big_int.to_u32
  end

  def self.ui64_deobfuscate(num : UInt64)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, BigInt.new(ValueBank.uint64_coprime), BigInt.new(UInt64::MAX))
    return big_int.to_u64
  end

  def self.set_i32_prime(prime : Int32)
    unless MillerRabin.probably_prime(prime.to_u64, 100)
      raise NotAPrime.new("#{prime} is not a prime number")
    end

    ValueBank.int32_prime = prime
    ValueBank.int32_coprime = mod_inverse(BigInt.new(prime), BigInt.new(Int32::MAX)).to_i32
  end

  def self.set_i64_prime(prime : Int64)
    unless MillerRabin.probably_prime(prime.to_u64, 100)
      raise NotAPrime.new("#{prime} is not a prime number")
    end

    ValueBank.int64_prime = prime
    ValueBank.int64_coprime = mod_inverse(BigInt.new(prime), BigInt.new(Int64::MAX)).to_i64
  end

  def self.set_u32_prime(prime : UInt32)
    unless MillerRabin.probably_prime(prime.to_u64, 100)
      raise NotAPrime.new("#{prime} is not a prime number")
    end

    ValueBank.uint32_prime = prime
    ValueBank.uint32_coprime = mod_inverse(BigInt.new(prime), BigInt.new(UInt32::MAX)).to_u32
  end

  def self.set_u64_prime(prime : UInt64)
    unless MillerRabin.probably_prime(prime.to_u64, 100)
      raise NotAPrime.new("#{prime} is not a prime number")
    end

    ValueBank.uint64_prime = prime
    ValueBank.uint64_coprime = mod_inverse(BigInt.new(prime), BigInt.new(UInt64::MAX)).to_u64
  end

  ##
  # Modular Multiplicative Inverse
  # More on: https://en.wikipedia.org/wiki/Modular_multiplicative_inverse
  ##
  def self.mmi(val : BigInt, prime : BigInt, max : BigInt)
    val *= prime
    val % max
  end

  def self.mod_inverse(g : BigInt, n : BigInt)
    z = gcd(g, n)

    if z < 0
      z += n
    end

    return z
  end

  def self.gcd(a : BigInt, b : BigInt) : BigInt
    x = BigInt.new(0)
    y = BigInt.new(1)

    lastX = BigInt.new(1)
    lastY = BigInt.new(0)

    while b > 0
      q = a / b
      r = a % b

      a, b = b, r

      temp = x
      x = lastX - (x * q)
      lastX = temp

      temp = y
      y = lastY - (y * q)
      lastY = temp
    end

    return lastX
  end
end
