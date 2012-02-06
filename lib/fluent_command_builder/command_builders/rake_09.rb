require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Rake
    module V09
      class Rake
        def initialize builder, task=nil
          @builder = builder
          @builder.append 'rake'
          @builder.append " #{@builder.format task}" unless task.nil?
        end
        def classic_namespace 
          @builder.append ' --classic-namespace'
          self
        end
        def describe pattern
          @builder.append " --describe #{@builder.format pattern}"
          self
        end
        def dry_run 
          @builder.append ' --dry-run'
          self
        end
        def execute_code code
          @builder.append " --execute #{@builder.format code}"
          self
        end
        def execute_print code
          @builder.append " --execute-print #{@builder.format code}"
          self
        end
        def execute_continue code
          @builder.append " --execute-continue #{@builder.format code}"
          self
        end
        def libdir lib_dir
          @builder.append " --libdir #{@builder.format lib_dir}"
          self
        end
        def no_search 
          @builder.append ' --no-search'
          self
        end
        def prereqs 
          @builder.append ' --prereqs'
          self
        end
        def quiet 
          @builder.append ' --quiet'
          self
        end
        def rakefile file
          @builder.append " --rakefile #{@builder.format file}"
          self
        end
        def rakelibdir rake_lib_dir
          @builder.append " --rakelibdir #{@builder.format rake_lib_dir}"
          self
        end
        def require file
          @builder.append " --require #{@builder.format file}"
          self
        end
        def rules 
          @builder.append ' --rules'
          self
        end
        def silent 
          @builder.append ' --silent'
          self
        end
        def no_system 
          @builder.append ' --no-system'
          self
        end
        def tasks pattern
          @builder.append " --tasks #{@builder.format pattern}"
          self
        end
        def trace 
          @builder.append ' --trace'
          self
        end
        def verbose 
          @builder.append ' --verbose'
          self
        end
        def version 
          @builder.append ' --version'
          self
        end
        def where pattern
          @builder.append " --where #{@builder.format pattern}"
          self
        end
        def no_deprecation_warnings 
          @builder.append ' --no-deprecation-warnings'
          self
        end
        def help 
          @builder.append ' --help'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      def rake task=nil
        Rake.new CommandBuilder.new, task
      end
    end
  end
  def rake_09 task=nil
    Rake::V09::Rake.new CommandBuilder.new, task
  end
end
