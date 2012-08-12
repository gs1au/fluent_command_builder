module FluentCommandBuilder

  def version_module(command_module)
    version = command_module.respond_to? :version ? command_module.version : nil
    raise "Unable to determine version for #{command_module::COMMAND_NAME}." unless version
    module_name = "#{command_module.name}::V#{compact_version version}"
    begin
      eval module_name
    rescue
      raise "Unable to load #{module_name}. Please consider contributing."
    end
  end

  def compact_version(version)
    version.match(/^\d+\.\d+/)[0].sub('.', '')
  end

end