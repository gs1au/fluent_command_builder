require_relative 'command_definition'
require_relative 'command_module'
require_relative 'code_writer'

class CodeGenerator

  def initialize source_dir, dest_dir
    @source_dir = source_dir
    @dest_dir = dest_dir
  end

  def generate_code
    glob = File.join @source_dir, '*.txt'
    Dir[glob].each { |f| process_file f }
  end

  private

  def process_file source_file
    command_definition = CommandDefinition.new source_file
    command_definition.versions.each do |version|
      command_module = CommandModule.new command_definition.command, version
      dest_file_name = "#{command_module.version_method_name}.rb"
      dest_file = File.join @dest_dir, dest_file_name
      File.open dest_file, 'w' do |f|
        writer = CodeWriter.new f
        command_module.write_command_module writer
      end
    end
  end

end
