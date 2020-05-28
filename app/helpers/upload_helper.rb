module UploadHelper
  def second_step(s = 0.0, a = 0.0, b = 0.0)
    if s <= a
      return 0
    end
    if a < s && s <= (a + b) / 2
      one = (s - a).to_f
      two = (b - a).to_f
      final = (one / two).to_f
      final **= 2
      return (2 * final).floor(4)
    end

    if (a + b) / 2 < s && s < b
      one = (b - s).to_f
      two = (b - a).to_f
      final = (one / two).to_f
      final **= 2
      return (1 - 2 * final).floor(4)
    end

    1 if s >= b
  end

  def third_step(t = 0.0, a = 0.0, b = 0.0)
 if t <= a
   return 0
 end

    if a < t && t <= (a + b) / 2
      one = (t - a).to_f
      two = (b - a).to_f
      final = (one / two).to_f
      final **= 2
      return (2 * final).floor(4)
    end

    if (a + b) / 2 < t && t < b
      one = (b - t).to_f
      two = (b - a).to_f
      final = (one / two).to_f
      final **= 2
      return (1 - 2 * final).floor(4)
    end

    1 if t >= b
  end

  def largest_hash_key(hash)
    pp "has", hash
    hash.max_by { |_k, v| v }
  end

  def least_hash_key(hash)
    pp "has", hash
    hash.min_by { |_k, v| v }
  end

end
