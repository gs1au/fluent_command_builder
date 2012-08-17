module FluentCommandBuilder
  class BackticksExecutor
    def execute(command)
      `#{command}`
    end
  end
end