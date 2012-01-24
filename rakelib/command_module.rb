class CommandModule

  def initialize command, version
    @command = command
    @version = version
  end

  def write_command_module writer
    w = writer
    w.write_line %Q[require File.expand_path(File.dirname(__FILE__) + '/../command_builder')]
    w.write_line
    w.write_block 'module FluentCommandBuilder' do
      w.write_block "module #{@command.class_name}" do
        w.write_block "module #{version_module_name}" do
          write_command @command, w
          w.write_block "def #{@command.method_name}" do
            w.write_line "#{@command.class_name}.new"
          end
        end
      end
      w.write_block "def #{version_method_name}" do
        w.write_line "#{@command.class_name}::#{version_module_name}::#{@command.class_name}.new"
      end
    end
  end

  def version_module_name
    (version =~ /^\d/).nil? ? version : "V#{version}"
  end

  def version_method_name
    "#{@command.method_name}_#{version}".downcase
  end

  private

  def version
    @version.gsub(/[\.]/, '').gsub(/ /, '_')
  end

  def write_command command, writer
    command.write writer
    command.child_nodes.each { |c| write_command c, writer }
  end

end
