# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../default_path_validator')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def mstest_100
    FluentCommandBuilder::MSTest::V100.create { |b| yield b if block_given? }
  end
  module MSTest
    module V100
      VERSION = '10.0'
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
        validator = DefaultPathValidator.new value, FluentCommandBuilder::MSTest::COMMAND_NAME, exact_version
        validator.validate
        @default_path = value
      end
      def self.version_validation_options
        @version_validation_options ||= {}
        yield @version_validation_options if block_given?
        @version_validation_options
      end
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::MSTest::COMMAND_NAME, self.exact_version
        b.path = self.default_path
        b.version_validation_options = self.version_validation_options
        b.version_detector = FluentCommandBuilder::MSTest.version_detector
        c = MSTest.new(b)
        yield b if block_given?
        c
      end
      def mstest
        FluentCommandBuilder::MSTest::V100.create { |b| yield b if block_given? }
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
        def test_list(test_list_path)
          @b.append " /testList:#{@b.format test_list_path}"
          yield @b if block_given?
          self
        end
        def category(test_category_filter)
          @b.append " /category:#{@b.format test_category_filter}"
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
        def test_settings(file_name)
          @b.append " /testSettings:#{@b.format file_name}"
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
        def use_std_err
          @b.append ' /useStdErr'
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