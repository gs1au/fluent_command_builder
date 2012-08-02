require 'rake'
include Rake::DSL

class CommandBase

  def initialize(builder)
    @builder = builder
  end

  def execute!(options={})
    sh to_s(options)
  end

  def to_s(options={})
    @builder.to_s options
  end

end