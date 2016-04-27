require "./bisani/*"
require "big_int"

module Bisani
  ValueBank = Bisani::Values.new

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
    big_int = mmi(big_int, ValueBank.int32_prime, BigInt.new(Int32::MAX))
    return big_int.to_i32
  end

  def self.i64_obfuscate(num : Int64)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, ValueBank.int64_prime, BigInt.new(Int64::MAX))
    return big_int.to_i64
  end

  def self.ui32_obfuscate(num : UInt32)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, ValueBank.uint32_prime, BigInt.new(UInt32::MAX))
    return big_int.to_u32
  end

  def self.ui64_obfuscate(num : UInt64)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, ValueBank.uint64_prime, BigInt.new(UInt64::MAX))
    return big_int.to_u64
  end

  def self.i32_deobfuscate(num : Int32)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, ValueBank.int32_coprime, BigInt.new(Int32::MAX))
    return big_int.to_i32
  end

  def self.i64_deobfuscate(num : Int64)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, ValueBank.int64_coprime, BigInt.new(Int64::MAX))
    return big_int.to_i64
  end

  def self.ui32_deobfuscate(num : UInt32)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, ValueBank.uint32_coprime, BigInt.new(UInt32::MAX))
    return big_int.to_u32
  end

    def self.ui64_deobfuscate(num : UInt64)
    big_int = BigInt.new(num)
    big_int = mmi(big_int, ValueBank.uint64_coprime, BigInt.new(UInt64::MAX))
    return big_int.to_u64
  end

  ##
  # Modular Multiplicative Inverse
  # More on: https://en.wikipedia.org/wiki/Modular_multiplicative_inverse
  ##
  def self.mmi(val : BigInt, prime : BigInt, max : BigInt)
    val *= prime
    val &= max
  end
end
