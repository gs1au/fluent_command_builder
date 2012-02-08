class CommandBase

  def initialize builder
    @builder = builder
  end

  def execute!
    begin
      require 'rake'
      sh to_s
    rescue LoadError
      Kernel.system to_s
    end
  end

  def to_s
    @builder.to_s
  end

end