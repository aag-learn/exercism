class LogLineParser
  @@pattern = /\[([^\]]+)\]:\s+(.*)/
  def initialize(line)
    @line = line
  end

  def message
    $2.strip if @line =~ @@pattern
  end

  def log_level
    $1.downcase if @line =~ @@pattern
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
