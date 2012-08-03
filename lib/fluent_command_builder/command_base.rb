require 'rake'
include Rake::DSL

class CommandBase

  def initialize(builder)
    @builder = builder
  end

  def execute!
    sh to_s
  end

  def to_s
    return yield @builder if block_given?
    @builder.to_s
  end

end