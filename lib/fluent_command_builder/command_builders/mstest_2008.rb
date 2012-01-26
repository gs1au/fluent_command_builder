require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSTest
    module V2008
      class MSTest
        def initialize builder
          @builder = builder
          @builder.append 'MSTest'
        end
        def test_container file_name
          @builder.append "/testContainer:#{@builder.format file_name}"
          self
        end
        def test_metadata file_name
          @builder.append "/testMetadata:#{@builder.format file_name}"
          self
        end
        def test_list list_list_path
          @builder.append "/testList:#{@builder.format list_list_path}"
          self
        end
        def test test_name
          @builder.append "/test:#{@builder.format test_name}"
          self
        end
        def no_isolation 
          @builder.append '/noIsolation'
          self
        end
        def run_config file_name
          @builder.append "/runConfig:#{@builder.format file_name}"
          self
        end
        def results_file file_name
          @builder.append "/resultsFile:#{@builder.format file_name}"
          self
        end
        def unique 
          @builder.append '/unique'
          self
        end
        def detail property_id
          @builder.append "/detail:#{@builder.format property_id}"
          self
        end
        def help 
          @builder.append '/help'
          self
        end
        def no_logo 
          @builder.append '/noLogo'
          self
        end
        def publish server_name
          @builder.append "/publish:#{@builder.format server_name}"
          self
        end
        def publish_results_file file_name
          @builder.append "/publishResultsFile:#{@builder.format file_name}"
          self
        end
        def publish_build build_id
          @builder.append "/publishBuild:#{@builder.format build_id}"
          self
        end
        def team_project team_project_name
          @builder.append "/teamProject:#{@builder.format team_project_name}"
          self
        end
        def platform platform
          @builder.append "/platform:#{@builder.format platform}"
          self
        end
        def flavor flavor
          @builder.append "/flavor:#{@builder.format flavor}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def mstest 
        MSTest.new CommandBuilder.new
      end
    end
  end
  def mstest_2008 
    MSTest::V2008::mstest
  end
end
