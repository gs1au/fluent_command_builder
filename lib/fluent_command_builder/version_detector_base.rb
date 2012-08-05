class VersionDetectorBase

  protected

  def executable_name
    raise 'Not implemented.'
  end

  def executable(path=nil)
    p = path ? [path] : paths
    find_executable p
  end

  def execute(path, args=nil)
    `"#{executable path}" #{args.to_s}`
  end

  private

  def find_executable(paths)
    is_unix? ? find_executable_on_unix(paths) : find_executable_on_windows(paths)
  end

  def find_executable_on_unix(paths)
    executables = paths.map { |path| File.join path, executable_name }
    executables.select { |exe| File.exist? exe }.first
  end

  def find_executable_on_windows(paths)
    extensions = ENV['PATHEXT'].split ';'
    executables = paths.map { |path| extensions.map { |ext| File.join path, "#{executable_name}.#{ext}" } }
    executables.select { |exe| File.exist? exe }.first
  end

  def paths
    delimiter = is_unix? ? ':' : ';'
    path_var.split delimiter
  end

  def is_unix?
    path_var.include? ':'
  end

  def path_var
    ENV['PATH']
  end

  def match_version(text)
    text.match(/(?:\d+\.)(?:\d+\.?)+/) { |m| m[0] }
  end

end