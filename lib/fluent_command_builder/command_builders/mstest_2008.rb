require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSTest
    module V2008
      COMMAND_NAME = 'MSTest'
      class MSTest < CommandBase
        def initialize builder
          super builder
        end
        def test_container file_name
          @builder.append " /testContainer:#{@builder.format file_name}"
          yield @builder if block_given?
          self
        end
        def test_metadata file_name
          @builder.append " /testMetadata:#{@builder.format file_name}"
          yield @builder if block_given?
          self
        end
        def test_list list_list_path
          @builder.append " /testList:#{@builder.format list_list_path}"
          yield @builder if block_given?
          self
        end
        def test test_name
          @builder.append " /test:#{@builder.format test_name}"
          yield @builder if block_given?
          self
        end
        def no_isolation
          @builder.append ' /noIsolation'
          yield @builder if block_given?
          self
        end
        def run_config file_name
          @builder.append " /runConfig:#{@builder.format file_name}"
          yield @builder if block_given?
          self
        end
        def results_file file_name
          @builder.append " /resultsFile:#{@builder.format file_name}"
          yield @builder if block_given?
          self
        end
        def unique
          @builder.append ' /unique'
          yield @builder if block_given?
          self
        end
        def detail property_id
          @builder.append " /detail:#{@builder.format property_id}"
          yield @builder if block_given?
          self
        end
        def help
          @builder.append ' /help'
          yield @builder if block_given?
          self
        end
        def no_logo
          @builder.append ' /noLogo'
          yield @builder if block_given?
          self
        end
        def publish server_name
          @builder.append " /publish:#{@builder.format server_name}"
          yield @builder if block_given?
          self
        end
        def publish_results_file file_name
          @builder.append " /publishResultsFile:#{@builder.format file_name}"
          yield @builder if block_given?
          self
        end
        def publish_build build_id
          @builder.append " /publishBuild:#{@builder.format build_id}"
          yield @builder if block_given?
          self
        end
        def team_project team_project_name
          @builder.append " /teamProject:#{@builder.format team_project_name}"
          yield @builder if block_given?
          self
        end
        def platform platform
          @builder.append " /platform:#{@builder.format platform}"
          yield @builder if block_given?
          self
        end
        def flavor flavor
          @builder.append " /flavor:#{@builder.format flavor}"
          yield @builder if block_given?
          self
        end
      end
      def mstest
        builder = CommandBuilder.new COMMAND_NAME
        command = MSTest.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def mstest_2008
    builder = CommandBuilder.new MSTest::V2008::COMMAND_NAME
    command = MSTest::V2008::MSTest.new builder
    yield builder if block_given?
    command
  end
end
