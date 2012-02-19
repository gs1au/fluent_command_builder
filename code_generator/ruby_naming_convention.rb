module CodeGenerator
  class RubyNamingConvention

    def module_name text
      words(text).join
    end

    def class_name text
      module_name text
    end

    def method_name text
      words(text).join('_').downcase
    end

    def arg_name text
      method_name text
    end

    private

    def words text
      text.to_s.gsub(/[\W_]/, ' ').gsub(/[A-Z*]/, ' \0').split(' ').map { |s| s.capitalize }
    end

  end
end