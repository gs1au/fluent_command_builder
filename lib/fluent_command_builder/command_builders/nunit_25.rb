require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module NUnit
    module V25
      class NUnit
        def initialize builder, assembly
          @builder = builder
          @builder.append "nunit-console #{@builder.format assembly}"
        end
        def run test
          @builder.append " /run:#{@builder.format test}"
          self
        end
        def fixture fixture
          @builder.append " /fixture:#{@builder.format fixture}"
          self
        end
        def framework framework
          @builder.append " /framework:#{@builder.format framework}"
          self
        end
        def include category
          @builder.append " /include:#{@builder.format category}"
          self
        end
        def exclude category
          @builder.append " /exclude:#{@builder.format category}"
          self
        end
        def out file
          @builder.append " /out:#{@builder.format file}"
          self
        end
        def err file
          @builder.append " /err:#{@builder.format file}"
          self
        end
        def labels 
          @builder.append ' /labels'
          self
        end
        def xml file
          @builder.append " /xml:#{@builder.format file}"
          self
        end
        def config config
          @builder.append " /config:#{@builder.format config}"
          self
        end
        def process process
          @builder.append " /process:#{@builder.format process}"
          self
        end
        def domain domain
          @builder.append " /domain:#{@builder.format domain}"
          self
        end
        def timeout timeout
          @builder.append " /timeout:#{@builder.format timeout}"
          self
        end
        def trace level
          @builder.append " /trace:#{@builder.format level}"
          self
        end
        def no_shadow 
          @builder.append ' /noShadow'
          self
        end
        def no_thread 
          @builder.append ' /noThread'
          self
        end
        def wait 
          @builder.append ' /wait'
          self
        end
        def xml_console 
          @builder.append ' /xmlConsole'
          self
        end
        def no_logo 
          @builder.append ' /noLogo'
          self
        end
        def help 
          @builder.append ' /help'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def nunit assembly
        NUnit.new CommandBuilder.new, assembly
      end
    end
  end
  def nunit_25 assembly
    NUnit::V25::NUnit.new CommandBuilder.new, assembly
  end
end
