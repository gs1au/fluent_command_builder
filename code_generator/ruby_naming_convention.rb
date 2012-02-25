module CodeGenerator
  class RubyNamingConvention

    def module_name(text)
      camel_case text
    end

    def class_name(text)
      camel_case text
    end

    def method_name(text)
      snake_case text
    end

    def arg_name(text)
      snake_case text
    end

    private

    def camel_case(text)
      words(text).join
    end

    def snake_case(text)
      words(text).join('_').downcase
    end

    def words(text)
      text.to_s.gsub(/[\W_]/, ' ').gsub(/[A-Z*]/, ' \0').split(' ').map { |s| s.capitalize }
    end

  end
end