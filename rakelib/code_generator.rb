require_relative 'code_writer'
require_relative 'command_code_generator'
require_relative 'command_definition'

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
      command_code_generator = CommandCodeGenerator.new command_definition.command, version
      dest_file_name = "#{command_code_generator.version_method_name}.rb"
      dest_file = File.join @dest_dir, dest_file_name
      File.open dest_file, 'w' do |f|
        writer = CodeWriter.new f
        command_code_generator.render writer
      end
    end
  end

end
