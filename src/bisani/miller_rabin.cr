require "big_int"

module MillerRabin
  def self.probably_prime(n : BigInt, k : Int32 = 100)
    if n < 6
      return [false, false, true, true, false, true][n]
    end
    s = BigInt.new(0)
    d = n - 1
    while d % 2 == 0
      s += 1
      d /= 2
    end
    rnd = Random.new
    x = BigInt.new
    (1..k).to_a.each do |i|
      a = BigInt.new(rnd.rand(n - 4).to_f) + 2
      x = a ** d % n
      if x == 1 || x == n - 1
        next
      end
      flag = 1
      (1...s).to_a.each do |r|
        x = (x * x) % n
        if x == 1
          return false
        end
        if x == n - 1
          flag = 0
          break
        end
      end
      if flag == 1
        return false
      end
    end
    return true
  end
end
