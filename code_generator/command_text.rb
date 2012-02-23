require_relative 'code_generator'

module CodeGenerator
  class CommandText

    def initialize text
      @text = text
    end

    def expand_options options
      @text = lines(@text).map { |line|
        option_matches = options.select { |o| o if o.start_with? line.strip }
        option_matches.empty? ? line : (line[/^ +/].to_s + option_matches[0])
      }.join NEW_LINE
    end

    def yaml
      lines(@text).map { |l| l.gsub(/^( *)(\S.+)$/, '\1- "\2":') }.join NEW_LINE
    end

    def to_s
      @text
    end

    private

    def lines text
      text.split NEW_LINE
    end

  end
end