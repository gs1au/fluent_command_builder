module FluentCommandBuilder
  class WindowsPathFinder

    def find_path(executable_name)
      paths =  ENV['PATH'].split ';'
      extensions = ENV['PATHEXT'].split ';'
      possibilities = paths.map { |path| extensions.map { |ext| File.join(path, executable_name + ext.downcase).gsub('/', '\\') } }.flatten
      executable = possibilities.select { |exe| File.exist? exe }.first
      return unless executable
      File.dirname executable
    end

  end
end