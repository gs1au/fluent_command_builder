module FluentCommandBuilder
  class StandardFormatter

    def format(underlying_builder)
      underlying_builder.to_s
    end

  end
end