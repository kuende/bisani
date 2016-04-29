class Bisani::Values
  property int32_prime : Int32
  property int32_coprime : Int32
  property int64_prime : Int64
  property int64_coprime : Int64
  property uint32_prime : UInt32
  property uint32_coprime : UInt32
  property uint64_prime : UInt64
  property uint64_coprime : UInt64

  def initialize
    @int32_prime = 1500450271_i32
    @int32_coprime = 739620797_i32
    @int64_prime = 8230452606740808761_i64
    @int64_coprime = 6406032982250635724_i64
    @uint32_prime = 3877529093_u32
    @uint32_coprime = 3918314357_u32
    @uint64_prime = 12764787846358441471_u64
    @uint64_coprime = 6144424082878602346_u64
  end
end
