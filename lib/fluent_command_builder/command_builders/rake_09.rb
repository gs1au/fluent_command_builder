require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Rake
    module V09
      class Rake
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'rake'
          self
        end
        
        def classic_namespace 
          @b.append '--classic-namespace'
          self
        end
        
        def describe pattern
          @b.append "--describe #{@b.format pattern}"
          self
        end
        
        def dry_run 
          @b.append '--dry-run'
          self
        end
        
        def execute code
          @b.append "--execute #{@b.format code}"
          self
        end
        
        def execute_print code
          @b.append "--execute-print #{@b.format code}"
          self
        end
        
        def execute_continue code
          @b.append "--execute-continue #{@b.format code}"
          self
        end
        
        def libdir lib_dir
          @b.append "--libdir #{@b.format lib_dir}"
          self
        end
        
        def no_search 
          @b.append '--no-search'
          self
        end
        
        def prereqs 
          @b.append '--prereqs'
          self
        end
        
        def quiet 
          @b.append '--quiet'
          self
        end
        
        def rakefile file
          @b.append "--rakefile #{@b.format file}"
          self
        end
        
        def rakelibdir rake_lib_dir
          @b.append "--rakelibdir #{@b.format rake_lib_dir}"
          self
        end
        
        def require file
          @b.append "--require #{@b.format file}"
          self
        end
        
        def rules 
          @b.append '--rules'
          self
        end
        
        def silent 
          @b.append '--silent'
          self
        end
        
        def no_system 
          @b.append '--no-system'
          self
        end
        
        def tasks pattern
          @b.append "--tasks #{@b.format pattern}"
          self
        end
        
        def trace 
          @b.append '--trace'
          self
        end
        
        def verbose 
          @b.append '--verbose'
          self
        end
        
        def version 
          @b.append '--version'
          self
        end
        
        def where pattern
          @b.append "--where #{@b.format pattern}"
          self
        end
        
        def no_deprecation_warnings 
          @b.append '--no-deprecation-warnings'
          self
        end
        
        def help 
          @b.append '--help'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def rake
        Rake.new
      end
      
    end
    
  end
  
  def rake_09
    Rake::V09::Rake.new
  end
  
end

