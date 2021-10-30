class LogLineParser
  @@pattern = /\[([^\]]+)\]:\s+(.*)/
  attr_reader :message, :log_level
  def initialize(line)
    @line = line
    if @line =~ @@pattern
      @log_level = $1.downcase
      @message = $2.strip
    end
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
