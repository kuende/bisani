class Bisani::Values
  def initialize
    @int32_prime = BigInt.new(1500450271)
    @int32_coprime = BigInt.new(1482223135)
    @int64_prime = BigInt.new(8230452606740808761)
    @int64_coprime = BigInt.new(5754553063220537865)
    @uint32_prime = BigInt.new(3877529093)
    @uint32_coprime = BigInt.new(3267000013)
    @uint64_prime = BigInt.new(12764787846358441471)
    @uint64_coprime = BigInt.new(1510277086161461759)
  end

  def int32_prime
    @int32_prime
  end

  def int32_coprime
    @int32_coprime
  end

  def int64_prime
    @int64_prime
  end

  def int64_coprime
    @int64_coprime
  end

  def uint32_prime
    @uint32_prime
  end

  def uint32_coprime
    @uint32_coprime
  end

  def uint64_prime
    @uint64_prime
  end

  def uint64_coprime
    @uint64_coprime
  end

  ##TODO: IMPLEMENT THEM
  def set_i32_prime(num : Int32)
  end

  def set_i64_prime(num : Int64)
  end

  def set_ui32_prime(num : UInt32)
  end

  def set_ui64_prime(num : UInt64)
  end
end
