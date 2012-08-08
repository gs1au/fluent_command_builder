module FluentCommandBuilder
  class PathFinder

    def initialize(executable_name)
      @executable_name = executable_name
    end

    def find_path
      executable = find_executable
      return unless executable
      File.dirname executable
    end

    def self.find_path(executable_name)
      path_finder = PathFinder.new executable_name
      path_finder.find_path
    end

    private

    def find_executable
      is_windows? ? find_executable_on_windows : find_executable_on_unix
    end

    def find_executable_on_unix
      executable = `which #{@executable_name}`
      real_executable = `readlink #{executable}`.strip
      real_executable == '' ? executable : real_executable
    end

    def find_executable_on_windows
      paths = ENV['PATH'].split ';'
      extensions = ENV['PATHEXT'].split ';'
      possibilities = paths.map { |path| extensions.map { |ext| File.join(path, @executable_name + ext.downcase).gsub('/', '\\') } }.flatten
      possibilities.select { |exe| File.exist? exe }.first
    end

    def is_windows?
      !ENV['WINDIR'].nil?
    end

  end
end