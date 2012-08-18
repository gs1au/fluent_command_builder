module FluentCommandBuilder
  class UnixPathFinder

    def find_path(executable_name)
      executable = `which #{executable_name}`
      real_executable = `readlink #{executable}`.strip
      result = real_executable == '' ? executable : real_executable
      return unless result
      File.dirname result
    end

  end
end