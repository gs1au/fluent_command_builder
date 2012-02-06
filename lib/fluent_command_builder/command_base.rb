class CommandBase
  def execute
    begin
      require 'rake'
      sh to_s
    rescue LoadError
      Kernel.system to_s
    end
  end
end