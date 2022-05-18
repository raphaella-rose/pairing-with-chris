require "diary_entry"

RSpec.describe DiaryEntry do
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

end