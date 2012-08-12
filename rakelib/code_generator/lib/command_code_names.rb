require_relative 'string_extensions'

class CommandCodeNames

  def initialize(command, version=nil)
    @command = command
    @version = version.to_s
  end

  def command_module_name
    @command.node_name.camelcase
  end

  def version_module_name
    result = version =~ /^\d/ ? "V#{version}" : version
    result.camelcase
  end

  def command_factory_method_name
    @command.node_name.downcase.snakecase
  end

  def command_factory_method_signature
    factory_method_signature command_factory_method_name
  end

  def version_factory_method_name
    "#{command_factory_method_name}_#{version.downcase.snakecase}"
  end

  def version_factory_method_signature
    factory_method_signature version_factory_method_name
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

  def create_method_signature
    method_name = 'self.create'
    method_args = factory_method_args.join(', ')
    result = method_name
    result << "(#{method_args})" unless method_args.empty?
    result
  end

  def create_method_call
    method_name = "FluentCommandBuilder::#{command_module_name}::#{version_module_name}.create"
    method_args = initializer_values.join(', ')
    result = method_name
    result << "(#{method_args})" unless method_args.empty?
    result
  end

  def command_initializer_call
    method_name = "#{class_name}.new"
    method_args = (%w(b) + initializer_values).join(', ')
    result = method_name
    result << "(#{method_args})" unless method_args.empty?
    result
  end

  private

  def version
    @version.gsub '.', ''
  end

  def factory_method_signature(method_name)
    method_args = factory_method_args.join(', ')
    result = method_name
    result << "(#{method_args})" unless method_args.empty?
    result
  end

end