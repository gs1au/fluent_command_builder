class Command

  attr_accessor :command_text, :sub_commands, :options

  def initialize command_text
    @command_text = command_text.strip
    @sub_commands = []
    @options = []
  end

  def write_command_class code_writer
    w = code_writer
    w.write_block "class #{class_name}" do
      w.write_block 'def initialize command=nil' do
        w.write_line '@b = CommandBuilder.new command'
        w.write_line "@b.append '#{@command_text}'"
        w.write_line 'self'
      end
      @sub_commands.each { |c| write_sub_command_method c, w }
      @options.each { |o| o.write_option_method w }
      w.write_block 'def to_s' do
        w.write_line '@b.to_s'
      end
    end
  end

  def class_name
    @command_text.gsub(/[\W_]/, ' ').gsub(/[A-Z]/, ' \0').strip.split(' ').map { |s| s.capitalize }.join
  end

  def method_name
    @command_text.split(/ |-/).join('_').downcase
  end

  def to_s
    @command_text
  end

  private

  def write_sub_command_method command, writer
    writer.write_block "def #{command.method_name}" do
      writer.write_line "#{command.class_name}.new self"
    end
  end

end