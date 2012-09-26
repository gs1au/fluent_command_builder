module FluentCommandBuilder
  class Path

    attr_accessor :path, :is_windows

    def initialize(path)
      @path = path
      @is_windows = !ENV['WINDIR'].nil?
    end

    def evaluated_path
      return unless @path
      `echo #{normalised_path}`.strip
    end

    def normalised_path
      return unless @path
      @is_windows ? @path.gsub('/', '\\') : @path.gsub('\\', '/')
    end

  end
end