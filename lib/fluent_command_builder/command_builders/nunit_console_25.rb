require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module NunitConsole
    module V25
      class NunitConsole
        def initialize builder
          @builder = builder
          @builder.append 'nunit-console'
        end
        def assembly assembly=nil
          @builder.append "#{@builder.format assembly}"
          self
        end
        def run test=nil
          @builder.append "/run:#{@builder.format test}"
          self
        end
        def fixture fixture=nil
          @builder.append "/fixture:#{@builder.format fixture}"
          self
        end
        def framework framework=nil
          @builder.append "/framework:#{@builder.format framework}"
          self
        end
        def include category=nil
          @builder.append "/include:#{@builder.format category}"
          self
        end
        def exclude category=nil
          @builder.append "/exclude:#{@builder.format category}"
          self
        end
        def out file=nil
          @builder.append "/out:#{@builder.format file}"
          self
        end
        def err file=nil
          @builder.append "/err:#{@builder.format file}"
          self
        end
        def labels 
          @builder.append '/labels'
          self
        end
        def xml file=nil
          @builder.append "/xml:#{@builder.format file}"
          self
        end
        def config config=nil
          @builder.append "/config:#{@builder.format config}"
          self
        end
        def process process=nil
          @builder.append "/process:#{@builder.format process}"
          self
        end
        def domain domain=nil
          @builder.append "/domain:#{@builder.format domain}"
          self
        end
        def timeout timeout=nil
          @builder.append "/timeout:#{@builder.format timeout}"
          self
        end
        def trace level=nil
          @builder.append "/trace:#{@builder.format level}"
          self
        end
        def no_shadow 
          @builder.append '/noShadow'
          self
        end
        def no_thread 
          @builder.append '/noThread'
          self
        end
        def wait 
          @builder.append '/wait'
          self
        end
        def xml_console 
          @builder.append '/xmlConsole'
          self
        end
        def no_logo 
          @builder.append '/noLogo'
          self
        end
        def help 
          @builder.append '/help'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def nunit_console 
        NunitConsole.new CommandBuilder.new
      end
    end
  end
  def nunit_console_25 
    NunitConsole::V25::NunitConsole.new CommandBuilder.new
  end
end
