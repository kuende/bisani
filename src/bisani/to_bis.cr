struct Int32
  def to_bis
    Bisani.i32_obfuscate(self)
  end
end

struct Int64
  def to_bis
    Bisani.i64_obfuscate(self)
  end
end

struct UInt32
  def to_bis
    Bisani.ui32_obfuscate(self)
  end
end

struct UInt64
  def to_bis
    Bisani.ui64_obfuscate(self)
  end
end
