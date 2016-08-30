class LineAnalyzer
  attr_reader :highest_wf_count
  attr_reader :highest_wf_words
  attr_reader :content
  attr_reader :line_number

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency()
  end

  def calculate_word_frequency()
    words = @content.downcase.split(" ")
    frequencies = Hash.new(0)
    words.each { |word| frequencies[word] += 1 }
    frequencies = frequencies.sort_by {|a, b| b }
    @highest_wf_count = frequencies.to_a[-1][1]
    
    @highest_wf_words = []
    frequencies.each do |word| 
      if word[1] == @highest_wf_count
        @highest_wf_words << word[0]
      end
    end
  end
end

class Solution
  attr_reader :analyzers
  attr_reader :highest_count_across_lines
  attr_reader :highest_count_words_across_lines
  
  def initialize
    @analyzers = []
  end

  def analyze_file()
    File.foreach("test.txt").with_index do |line, line_num|
      line_analyzer = LineAnalyzer.new(line, line_num)
      @analyzers << line_analyzer
    end
  end
  
  def calculate_line_with_highest_frequency()
    wf_counts = []
    @analyzers.each do |analyzer|
      wf_counts << analyzer.highest_wf_count
    end
    @highest_count_across_lines = wf_counts.max

    highest_count_words = []
    @analyzers.each do |analyzer| 
      if analyzer.highest_wf_count == @highest_count_across_lines
        highest_count_words << analyzer
      end
    end
    @highest_count_words_across_lines = highest_count_words
  end

  def print_highest_word_frequency_across_lines()
    @highest_count_words_across_lines.each do |analyzer|
      puts analyzer.highest_wf_words
    end
  end
end
