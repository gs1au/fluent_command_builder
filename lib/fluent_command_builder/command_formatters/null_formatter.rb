module FluentCommandBuilder
  class NullFormatter

    def format(underlying_builder)
      underlying_builder.to_s
    end

  end
end