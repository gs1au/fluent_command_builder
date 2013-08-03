module FluentCommandBuilder
  class Path

    attr_accessor :path

    def initialize(*path)
      path.select! { |p| p unless p == '' }
      @path = File.join path
    end

    def evaluated_path
      return unless @path
      # evaluates variables in path e.g. %WINDIR%
      `echo #{normalised_path}`.strip
    end

    def normalised_path
      return unless @path
      windows? ? @path.gsub('/', '\\') : @path.gsub('\\', '/')
    end

    def to_s
      evaluated_path
    end

    private

    def windows?
      !ENV['WINDIR'].nil?
    end

  end
end