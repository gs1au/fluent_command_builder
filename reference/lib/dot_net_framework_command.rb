class DotNetFrameworkCommand

  def initialize(dot_net_framework, command_relative_path)
    @dot_net_framework = dot_net_framework
    @command_relative_path = command_relative_path
  end

  def command
    File.join @dot_net_framework.path, @command_relative_path
  end

  def command_name
    File.basename command
  end

  def command_name_without_extension
    File.basename command_name, '.*'
  end

  def exists?
    File.exist? command
  end

  def execute(args)
    system %Q["#{command}" #{args}]
  end

end