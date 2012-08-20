require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../printer')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def mstest_90
    FluentCommandBuilder::MSTest::V90.create { |b| yield b if block_given? }
  end
  module MSTest
    module V90
      VERSION = '9.0'
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        printer = FluentCommandBuilder::Printer.new
        begin
          printer.print_warning %Q[Default Path for command "#{FluentCommandBuilder::MSTest::COMMAND_NAME}" does not exist. Path: #{value}] unless File.exist? value
        rescue
          printer.print_warning %Q[Failed to determine whether Default Path for command "#{FluentCommandBuilder::MSTest::COMMAND_NAME}" exists. An internal error occurred.]
        end
        @default_path = value
      end
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::MSTest::COMMAND_NAME
        b.path = self.default_path
        c = MSTest.new(b)
        yield b if block_given?
        c
      end
      def mstest
        FluentCommandBuilder::MSTest::V90.create { |b| yield b if block_given? }
      end
      class MSTest < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def test_container(file_name)
          @b.append " /testContainer:#{@b.format file_name}"
          yield @b if block_given?
          self
        end
        def test_metadata(file_name)
          @b.append " /testMetadata:#{@b.format file_name}"
          yield @b if block_given?
          self
        end
        def test_list(list_list_path)
          @b.append " /testList:#{@b.format list_list_path}"
          yield @b if block_given?
          self
        end
        def test(test_name)
          @b.append " /test:#{@b.format test_name}"
          yield @b if block_given?
          self
        end
        def no_isolation
          @b.append ' /noIsolation'
          yield @b if block_given?
          self
        end
        def run_config(file_name)
          @b.append " /runConfig:#{@b.format file_name}"
          yield @b if block_given?
          self
        end
        def results_file(file_name)
          @b.append " /resultsFile:#{@b.format file_name}"
          yield @b if block_given?
          self
        end
        def unique
          @b.append ' /unique'
          yield @b if block_given?
          self
        end
        def detail(property_id)
          @b.append " /detail:#{@b.format property_id}"
          yield @b if block_given?
          self
        end
        def help
          @b.append ' /help'
          yield @b if block_given?
          self
        end
        def no_logo
          @b.append ' /noLogo'
          yield @b if block_given?
          self
        end
        def publish(server_name)
          @b.append " /publish:#{@b.format server_name}"
          yield @b if block_given?
          self
        end
        def publish_results_file(file_name)
          @b.append " /publishResultsFile:#{@b.format file_name}"
          yield @b if block_given?
          self
        end
        def publish_build(build_id)
          @b.append " /publishBuild:#{@b.format build_id}"
          yield @b if block_given?
          self
        end
        def team_project(team_project_name)
          @b.append " /teamProject:#{@b.format team_project_name}"
          yield @b if block_given?
          self
        end
        def platform(platform)
          @b.append " /platform:#{@b.format platform}"
          yield @b if block_given?
          self
        end
        def flavor(flavor)
          @b.append " /flavor:#{@b.format flavor}"
          yield @b if block_given?
          self
        end
      end

    end
  end
end