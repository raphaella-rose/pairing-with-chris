class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @counter = 1
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
      @word_count = @contents.split(" ").count
      return @word_count
  end
  def reading_time(wpm)
   return @word_count.div(wpm) 
  end

  def reading_chunk(wpm, minutes)
    total_words = (reading_time(wpm) * minutes)
    para = @contents.split(" ")
    chunk = ""
    if @counter < 2
      para[0..(total_words - 1)].each do |word|
        chunk += "#{word} "
      end
      @counter += 1
      return chunk
    else
      para[total_words..((total_words * @counter) - 1)].each do |word|
        chunk += "#{word} "
      end
      p chunk
      return chunk
    end
   
  end

end