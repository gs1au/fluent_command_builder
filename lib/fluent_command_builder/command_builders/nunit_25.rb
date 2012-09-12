# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../default_path_validator')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def nunit_25(input_files=nil)
    FluentCommandBuilder::NUnit::V25.create(input_files) { |b| yield b if block_given? }
  end
  module NUnit
    module V25
      VERSION = '2.5'
      def self.exact_version
        @exact_version ||= VERSION
      end
      def self.exact_version=(value)
        @exact_version = value
      end
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        validator = DefaultPathValidator.new value, FluentCommandBuilder::NUnit::COMMAND_NAME, exact_version
        validator.validate
        @default_path = value
      end
      def self.version_validation_options
        @version_validation_options ||= {}
        yield @version_validation_options if block_given?
        @version_validation_options
      end
      def self.create(input_files=nil)
        b = UnderlyingBuilder.new FluentCommandBuilder::NUnit::COMMAND_NAME, self.exact_version
        b.path = self.default_path
        b.version_validation_options = self.version_validation_options
        b.version_detector = FluentCommandBuilder::NUnit.version_detector
        c = NUnit.new(b, input_files)
        yield b if block_given?
        c
      end
      def nunit(input_files=nil)
        FluentCommandBuilder::NUnit::V25.create(input_files) { |b| yield b if block_given? }
      end
      class NUnit < CommandBase
        def initialize(underlying_builder, input_files=nil)
          super underlying_builder
          @b.append " #{@b.format input_files}" unless input_files.nil?
        end
        def input_files(input_files)
          @b.append " #{@b.format input_files}"
          yield @b if block_given?
          self
        end
        def fixture(fixture)
          @b.append " -fixture:#{@b.format fixture}"
          yield @b if block_given?
          self
        end
        def load(fixture)
          @b.append " -load:#{@b.format fixture}"
          yield @b if block_given?
          self
        end
        def run(test)
          @b.append " -run:#{@b.format test}"
          yield @b if block_given?
          self
        end
        def config(config)
          @b.append " -config:#{@b.format config}"
          yield @b if block_given?
          self
        end
        def xml(file)
          @b.append " -xml:#{@b.format file}"
          yield @b if block_given?
          self
        end
        def xml_console
          @b.append ' -xmlConsole'
          yield @b if block_given?
          self
        end
        def output(file)
          @b.append " -output:#{@b.format file}"
          yield @b if block_given?
          self
        end
        def out(file)
          @b.append " -out:#{@b.format file}"
          yield @b if block_given?
          self
        end
        def err(file)
          @b.append " -err:#{@b.format file}"
          yield @b if block_given?
          self
        end
        def labels
          @b.append ' -labels'
          yield @b if block_given?
          self
        end
        def trace(level)
          @b.append " -trace:#{@b.format level}"
          yield @b if block_given?
          self
        end
        def include(category)
          @b.append " -include:#{@b.format category}"
          yield @b if block_given?
          self
        end
        def exclude(category)
          @b.append " -exclude:#{@b.format category}"
          yield @b if block_given?
          self
        end
        def process(process)
          @b.append " -process:#{@b.format process}"
          yield @b if block_given?
          self
        end
        def domain(domain)
          @b.append " -domain:#{@b.format domain}"
          yield @b if block_given?
          self
        end
        def framework(framework)
          @b.append " -framework:#{@b.format framework}"
          yield @b if block_given?
          self
        end
        def no_shadow
          @b.append ' -noShadow'
          yield @b if block_given?
          self
        end
        def no_thread
          @b.append ' -noThread'
          yield @b if block_given?
          self
        end
        def timeout(timeout)
          @b.append " -timeout:#{@b.format timeout}"
          yield @b if block_given?
          self
        end
        def wait
          @b.append ' -wait'
          yield @b if block_given?
          self
        end
        def no_logo
          @b.append ' -noLogo'
          yield @b if block_given?
          self
        end
        def no_dots
          @b.append ' -noDots'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -help'
          yield @b if block_given?
          self
        end
      end

    end
  end
end