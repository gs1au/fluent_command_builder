require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module NunitConsole
    module V25
      class NunitConsole
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'nunit-console'
          self
        end
        
        def assembly assembly
          @builder.append "#{assembly}"
          self
        end
        
        def run test
          @builder.append "/run:#{test}"
          self
        end
        
        def fixture fixture
          @builder.append "/fixture:#{fixture}"
          self
        end
        
        def framework framework
          @builder.append "/framework:#{framework}"
          self
        end
        
        def include category
          @builder.append "/include:#{category}"
          self
        end
        
        def exclude category
          @builder.append "/exclude:#{category}"
          self
        end
        
        def out file
          @builder.append "/out:#{file}"
          self
        end
        
        def err file
          @builder.append "/err:#{file}"
          self
        end
        
        def labels 
          @builder.append "/labels"
          self
        end
        
        def xml file
          @builder.append "/xml:#{file}"
          self
        end
        
        def config config
          @builder.append "/config:#{config}"
          self
        end
        
        def process process
          @builder.append "/process:#{process}"
          self
        end
        
        def domain domain
          @builder.append "/domain:#{domain}"
          self
        end
        
        def timeout timeout
          @builder.append "/timeout:#{timeout}"
          self
        end
        
        def trace level
          @builder.append "/trace:#{level}"
          self
        end
        
        def no_shadow 
          @builder.append "/noShadow"
          self
        end
        
        def no_thread 
          @builder.append "/noThread"
          self
        end
        
        def wait 
          @builder.append "/wait"
          self
        end
        
        def xml_console 
          @builder.append "/xmlConsole"
          self
        end
        
        def no_logo 
          @builder.append "/noLogo"
          self
        end
        
        def help 
          @builder.append "/help"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def nunit_console
        NunitConsole.new
      end
      
    end
    
  end
  
  def nunit_console25
    NunitConsole::V25::NunitConsole.new
  end
  
end

