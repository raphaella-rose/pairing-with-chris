require "diary_entry"

RSpec.describe DiaryEntry do
  para = "New generations of graphics cards usually only offer improved clock speeds, allowing gamers to crank up the resolution and see a smoother performance with higher frame rates. The Nvidia RTX 2080 Ti and the rest of the new Turing graphics cards, however, have greater ambitions. They feature all-new technology that could revolutionise video game visuals.

  Ray tracing and Deep Learning Super-Sampling (DLSS) take the headlines here, with the former offering more realistic lighting effects and the latter using artificial intelligence to render high-quality images more efficiently. While all four of Nvidia's new 20 Series graphics cards are capable of delivering both of theses – and older cards will support ray tracing to varying degrees later in the year – the RTX 2080 Ti boasts the best specs of them all.
  
  If you want the ultimate performance for ray tracing and DLSS, the RTX 2080 Ti is undoubtedly the best consumer card to buy. "
  

  it "returns the title and contents of the entry" do
    diary_entry = DiaryEntry.new("day one", "i'm tired")
    result_title = diary_entry.title
    result_contents = diary_entry.contents
    expect(result_title).to eq "day one"
    expect(result_contents).to eq "i'm tired"
  end
  
  it "returns the number of words in the contents" do
    diary_entry = DiaryEntry.new("day one", "i'm tired today")
    result = diary_entry.count_words
    expect(result).to eq 3
  end

  it "returns the number of words a user read per minute" do
  diary_entry = DiaryEntry.new("day one",para)
  diary_entry.count_words
  result = diary_entry.reading_time(10)
  expect(result).to eq 15
  end

  it "return a string containing the text the reader has time to read in the given number of minutes" do
    diary_entry = DiaryEntry.new("day one",para)
    diary_entry.count_words
    result = diary_entry.reading_chunk(10,5)
    expect(result).to eq "New generations of graphics cards usually only offer improved clock speeds, allowing gamers to crank up the resolution and see a smoother performance with higher frame rates. The Nvidia RTX 2080 Ti and the rest of the new Turing graphics cards, however, have greater ambitions. They feature all-new technology that could revolutionise video game visuals. Ray tracing and Deep Learning Super-Sampling (DLSS) take the headlines here, with the former offering more realistic lighting effects and "
  end

  it "returns a string containing the text the user has time to read excluding what has already been read" do
    diary_entry = DiaryEntry.new("day one", para)
    diary_entry.count_words
    diary_entry.reading_chunk(10,5)
    result = diary_entry.reading_chunk(10,5)
    expect(result).to eq "the latter using artificial intelligence to render high-quality images more efficiently. While all four of Nvidia's new 20 Series graphics cards are capable of delivering both of theses – and older cards will support ray tracing to varying degrees later in the year – the RTX 2080 Ti boasts the best specs of them all. If you want the ultimate performance for ray tracing and DLSS, the RTX 2080 Ti is undoubtedly the best consumer "
  end
end