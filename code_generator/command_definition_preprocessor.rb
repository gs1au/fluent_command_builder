require 'yaml'

module CodeGenerator
  class CommandDefinitionPreprocessor

    def initialize stream
      @raw_text = stream.read
    end

    def expand_options
      # todo: refactor this
      options_index = @raw_text =~ /^options:$/
      return @raw_text unless options_index

      options = @raw_text[options_index, @raw_text.length - 1].lines.to_a
      options.delete_at 0
      options.map! { |o| o.strip }

      @raw_text = @raw_text[0, options_index]
      @raw_text = @raw_text.lines.map { |line|
        option_matches = options.select { |o| o if o.start_with? line.strip }
        option_matches.empty? ? line : (line[/^ +/].to_s + option_matches[0])
      }.join "\n"
    end

    def yaml
      yaml = @raw_text.lines.map { |l| l.rstrip.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join "\n"
      YAML.dump YAML.load(yaml)
    end

  end
end