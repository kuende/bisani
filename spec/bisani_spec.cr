require "./spec_helper"

describe Bisani do
  describe "with default primes" do
    it "obfuscate correctly i32" do
      seed = Random.new_seed
      rnd = Random.new

      100_000.times do
        v = rnd.next_int.to_i32
        while v <= 0
          v = rnd.next_int.to_i32
        end
        r = Bisani.to_i32(v.to_bis)
        (r > 0).should eq(true)
        v.should eq(r)
      end
    end

    it "obfuscate correctly i64" do
      seed = Random.new_seed
      rnd = Random.new(seed)

      100_000.times do
        v = rnd.next_int.to_i64
        while v <= 0
          v = rnd.next_int.to_i64
        end
        r = Bisani.to_i64(v.to_bis)
        (r > 0).should eq(true)
        v.should eq(r)
      end
    end

    it "obfuscate correctly ui32" do
      seed = Random.new_seed
      rnd = Random.new(seed)

      100_000.times do
        v = rnd.next_u32
        r = Bisani.to_u32(v.to_bis)
        (r > 0).should eq(true)
        v.should eq(r)
      end
    end

    it "obfuscate correctly ui64" do
      seed = Random.new_seed
      rnd = Random.new(seed)

      100_000.times do
        v = rnd.next_u32.to_u64
        r = Bisani.to_u64(v.to_bis)
        (r > 0).should eq(true)
        v.should eq(r)
      end
    end
  end

  describe "with custom primes" do
    it "sets i32 prime" do
      Bisani.set_i32_prime(1154853319)

      seed = Random.new_seed
      rnd = Random.new

      100_000.times do
        v = rnd.next_int.to_i32
        while v <= 0
          v = rnd.next_int.to_i32
        end
        r = Bisani.to_i32(v.to_bis)
        (r > 0).should eq(true)
        v.should eq(r)
      end
    end

    it "sets i64 prime" do
      Bisani.set_i64_prime(546732574616317_i64)

      seed = Random.new_seed
      rnd = Random.new

      100_000.times do
        v = rnd.next_int.to_i64
        while v <= 0
          v = rnd.next_int.to_i64
        end
        r = Bisani.to_i64(v.to_bis)
        (r > 0).should eq(true)
        v.should eq(r)
      end
    end

    it "sets u32 prime" do
      Bisani.set_u32_prime(3154853329_u32)

      seed = Random.new_seed
      rnd = Random.new(seed)

      100_000.times do
        v = rnd.next_u32
        r = Bisani.to_u32(v.to_bis)
        (r > 0).should eq(true)
        v.should eq(r)
      end
    end

    it "sets u64 prime" do
      Bisani.set_u64_prime(18446744073709501639_u64)

      seed = Random.new_seed
      rnd = Random.new(seed)

      100_000.times do
        v = rnd.next_u32.to_u64
        r = Bisani.to_u64(v.to_bis)
        (r > 0).should eq(true)
        v.should eq(r)
      end
    end
  end
end
