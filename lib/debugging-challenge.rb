def get_most_common_letter(text)
  p text
  counter = Hash.new(0)
  p counter
  text.chars.each do |char|
    counter[char] += 1
  end
  p counter
  counter.to_a.sort_by { |k, v| v }
  p counter.to_a.sort_by { |k, v| v } 
  [0][0]

end

p get_most_common_letter("the roof, the roof, the roof is on fire!")