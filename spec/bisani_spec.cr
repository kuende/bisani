require "./spec_helper"

describe Bisani do
  # TODO: Write tests

  it "obfuscate correctly i32" do
    seed = Random.new_seed
    rnd = Random.new
    i = 1
    while i <= 100_000
      v = rnd.next_int.to_i32
      while v <= 0
        v = rnd.next_int.to_i32
      end
      r = Bisani.to_i32(v.to_bis)
      v.should eq(r)
      i += 1
    end
  end

  it "obfuscate correctly i64" do
    seed = Random.new_seed
    rnd = Random.new(seed)
    i = 1
    while i <= 100_000
      v = rnd.next_int.to_i64
      while v <= 0
        v = rnd.next_int.to_i64
      end
      r = Bisani.to_i64(v.to_bis)
      v.should eq(r)
      i += 1
    end
  end

  it "obfuscate correctly ui32" do
    seed = Random.new_seed
    rnd = Random.new(seed)
    i = 1
    while i <= 100_000
      v = rnd.next_u32
      r = Bisani.to_u32(v.to_bis)
      v.should eq(r)
      i += 1
    end
  end

  it "obfuscate correctly ui64" do
    seed = Random.new_seed
    rnd = Random.new(seed)
    i = 1
    while i <= 100_000
      v = rnd.next_u32.to_u64
      r = Bisani.to_u64(v.to_bis)
      v.should eq(r)
      i += 1
    end
  end
end
