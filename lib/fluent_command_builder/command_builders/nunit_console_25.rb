require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module NunitConsole
    module V25
      class NunitConsole
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'nunit-console'
          self
        end
        
        def assembly assembly
          @b.append "#{@b.format assembly}"
          self
        end
        
        def run test
          @b.append "/run:#{@b.format test}"
          self
        end
        
        def fixture fixture
          @b.append "/fixture:#{@b.format fixture}"
          self
        end
        
        def framework framework
          @b.append "/framework:#{@b.format framework}"
          self
        end
        
        def include category
          @b.append "/include:#{@b.format category}"
          self
        end
        
        def exclude category
          @b.append "/exclude:#{@b.format category}"
          self
        end
        
        def out file
          @b.append "/out:#{@b.format file}"
          self
        end
        
        def err file
          @b.append "/err:#{@b.format file}"
          self
        end
        
        def labels 
          @b.append '/labels'
          self
        end
        
        def xml file
          @b.append "/xml:#{@b.format file}"
          self
        end
        
        def config config
          @b.append "/config:#{@b.format config}"
          self
        end
        
        def process process
          @b.append "/process:#{@b.format process}"
          self
        end
        
        def domain domain
          @b.append "/domain:#{@b.format domain}"
          self
        end
        
        def timeout timeout
          @b.append "/timeout:#{@b.format timeout}"
          self
        end
        
        def trace level
          @b.append "/trace:#{@b.format level}"
          self
        end
        
        def no_shadow 
          @b.append '/noShadow'
          self
        end
        
        def no_thread 
          @b.append '/noThread'
          self
        end
        
        def wait 
          @b.append '/wait'
          self
        end
        
        def xml_console 
          @b.append '/xmlConsole'
          self
        end
        
        def no_logo 
          @b.append '/noLogo'
          self
        end
        
        def help 
          @b.append '/help'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def nunit_console
        NunitConsole.new
      end
      
    end
    
  end
  
  def nunit_console_25
    NunitConsole::V25::NunitConsole.new
  end
  
end

