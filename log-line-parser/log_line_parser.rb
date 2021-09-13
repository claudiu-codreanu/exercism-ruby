class LogLineParser
  def initialize(line)
    @line = line
    split
  end

  def message
    @msg
  end

  def log_level
    @level.downcase
  end

  def reformat
    "#{@msg} (#{log_level})"
  end

private

  def split
    i = @line.index(":")

    @level = @line.slice(1, i - 2)
    @msg = @line.slice(i + 1, @line.size - i).strip
  end

end
