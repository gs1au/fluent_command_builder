class CommandDefinitionFile

  def initialize file
    @file = file
  end

  def load
    yaml = IO.readlines(@file).map { |l| l.rstrip.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join "\n"
    YAML.load yaml
  end

  #def load
  #  yaml = IO.readlines(@file).map { |l| l.rstrip.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join "\n"
  #  array = YAML.load yaml
  #  version = array[0]
  #  puts version
  #  array[1]
  #end

  def file_name_without_extension
    File.basename(@file, '.*')
  end

end