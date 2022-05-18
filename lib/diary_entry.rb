class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
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

end