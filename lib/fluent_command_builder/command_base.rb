module FluentCommandBuilder
  class CommandBase

    def initialize(underlying_builder)
      @b = underlying_builder
    end

    def execute!
      yield @b if block_given?
      @b.execute
    end

    def to_s
      return yield @b if block_given?
      @b.to_s
    end

  end
end