module FluentCommandBuilder
  class SystemExecutor

    def execute(underlying_builder)
      system underlying_builder.to_s
    end

  end
end