module DotNet
  class Framework

    def initialize(path)
      @path = path
    end

    def path
      @path
    end

    def version
      File.basename(@path).delete 'v'
    end

    def major_version
      version.match(/^\d+/)[0]
    end

    def minor_version
      version.match(/^\d+\.(\d+)/)[1]
    end

    def self.installations
      win_dir = `echo %WINDIR%`.strip.gsub('\\', '/')
      pattern = "#{win_dir}/Microsoft.Net/Framework/v*"
      Dir[pattern].map { |dir| Framework.new dir }
    end

  end
end