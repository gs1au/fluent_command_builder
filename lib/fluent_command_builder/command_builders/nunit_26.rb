require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module NUnit
    COMMAND_NAME = 'nunit-console' unless const_defined? :COMMAND_NAME
    module V26
      class NUnit < CommandBase
        def initialize(builder, input_files)
          super builder
          @builder.append " #{@builder.format input_files}"
        end
        def fixture(fixture)
          @builder.append " /fixture:#{@builder.format fixture}"
          yield @builder if block_given?
          self
        end
        def load(fixture)
          @builder.append " /load:#{@builder.format fixture}"
          yield @builder if block_given?
          self
        end
        def run(test)
          @builder.append " /run:#{@builder.format test}"
          yield @builder if block_given?
          self
        end
        def run_list(file)
          @builder.append " /runList:#{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def config(config)
          @builder.append " /config:#{@builder.format config}"
          yield @builder if block_given?
          self
        end
        def result(file)
          @builder.append " /result:#{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def xml(file)
          @builder.append " /xml:#{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def xml_console
          @builder.append ' /xmlConsole'
          yield @builder if block_given?
          self
        end
        def no_result
          @builder.append ' /noResult'
          yield @builder if block_given?
          self
        end
        def no_xml
          @builder.append ' /noXml'
          yield @builder if block_given?
          self
        end
        def output(file)
          @builder.append " /output:#{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def out(file)
          @builder.append " /out:#{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def err(file)
          @builder.append " /err:#{@builder.format file}"
          yield @builder if block_given?
          self
        end
        def work(directory)
          @builder.append " /work:#{@builder.format directory}"
          yield @builder if block_given?
          self
        end
        def labels
          @builder.append ' /labels'
          yield @builder if block_given?
          self
        end
        def trace(level)
          @builder.append " /trace:#{@builder.format level}"
          yield @builder if block_given?
          self
        end
        def include(category)
          @builder.append " /include:#{@builder.format category}"
          yield @builder if block_given?
          self
        end
        def exclude(category)
          @builder.append " /exclude:#{@builder.format category}"
          yield @builder if block_given?
          self
        end
        def framework(framework)
          @builder.append " /framework:#{@builder.format framework}"
          yield @builder if block_given?
          self
        end
        def process(process)
          @builder.append " /process:#{@builder.format process}"
          yield @builder if block_given?
          self
        end
        def domain(domain)
          @builder.append " /domain:#{@builder.format domain}"
          yield @builder if block_given?
          self
        end
        def apartment(apartment)
          @builder.append " /apartment:#{@builder.format apartment}"
          yield @builder if block_given?
          self
        end
        def no_shadow
          @builder.append ' /noShadow'
          yield @builder if block_given?
          self
        end
        def no_thread
          @builder.append ' /noThread'
          yield @builder if block_given?
          self
        end
        def timeout(timeout)
          @builder.append " /timeout:#{@builder.format timeout}"
          yield @builder if block_given?
          self
        end
        def wait
          @builder.append ' /wait'
          yield @builder if block_given?
          self
        end
        def no_logo
          @builder.append ' /noLogo'
          yield @builder if block_given?
          self
        end
        def no_dots
          @builder.append ' /noDots'
          yield @builder if block_given?
          self
        end
        def stop_on_error
          @builder.append ' /stopOnError'
          yield @builder if block_given?
          self
        end
        def cleanup
          @builder.append ' /cleanup'
          yield @builder if block_given?
          self
        end
        def help
          @builder.append ' /help'
          yield @builder if block_given?
          self
        end
      end
      def nunit(input_files)
        builder = CommandBuilder.new FluentCommandBuilder::NUnit::COMMAND_NAME
        command = NUnit.new builder, input_files
        yield builder if block_given?
        command
      end
    end
  end
  def nunit_26(input_files)
    builder = CommandBuilder.new FluentCommandBuilder::NUnit::COMMAND_NAME
    command = NUnit::V26::NUnit.new builder, input_files
    yield builder if block_given?
    command
  end
end
