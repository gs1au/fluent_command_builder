require_relative 'command'

class CommandDefinition

  attr_reader :versions, :command

  def initialize(stream)
    s = stream.read
    @versions = s.first_line.split_and_strip ','
    @command = Command.new s.strip_first_line
  end

end