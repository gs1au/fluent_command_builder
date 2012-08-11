module FluentCommandBuilder

  def version_module(command_module)
    version = command_module.version.match(/^(\d+\.\d+)/)[1].sub '.', ''
    eval "#{command_module.name}::V#{version}"
  end

end