require_relative 'string_extensions'

class CommandCodeNames

  def initialize(command, version=nil)
    @command = command
    @compact_version = version.to_s.gsub('.', '')
  end

  def command_module_name
    @command.node_name.camelcase
  end

  def version_module_name
    result = @compact_version =~ /^\d/ ? "V#{@compact_version}" : @compact_version
    result.camelcase
  end

  def command_factory_method_name
    @command.node_name.downcase.snakecase
  end

  def command_factory_method_signature
    format_method command_factory_method_name, factory_method_args
  end

  def version_factory_method_name
    "#{command_factory_method_name}_#{@compact_version.downcase.snakecase}"
  end

  def version_factory_method_signature
    format_method version_factory_method_name, factory_method_args
  end

  def create_method_signature
    format_method 'self.create', factory_method_args
  end

  def create_method_call
    format_method "FluentCommandBuilder::#{command_module_name}::#{version_module_name}.create", initializer_values
  end

  def command_initializer_call
    format_method "#{class_name}.new", %w(b) + initializer_values
  end

  private

  def format_method(method_name, method_args)
    method_args = method_args.join ', '
    result = method_name
    result << "(#{method_args})" unless method_args.empty?
    result
  end

  def factory_method_args
    @command.args.map do |arg|
      arg_name = arg.arg_name.snakecase
      arg_name << '=nil' if arg.optional?
      arg_name
    end
  end

  def initializer_values
    @command.args.map { |arg| arg.arg_name.snakecase }
  end

  def class_name
    @command.node_name.camelcase
  end

end