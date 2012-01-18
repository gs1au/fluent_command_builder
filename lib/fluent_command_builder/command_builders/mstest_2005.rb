require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSTest
    module V2005
      class MSTest
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'MSTest'
          self
        end
        
        def test_container file_name
          @builder.append "/testContainer:#{file_name}"
          self
        end
        
        def test_metadata file_name
          @builder.append "/testMetadata:#{file_name}"
          self
        end
        
        def test_list list_list_path
          @builder.append "/testList:#{list_list_path}"
          self
        end
        
        def test test_name
          @builder.append "/test:#{test_name}"
          self
        end
        
        def run_config file_name
          @builder.append "/runConfig:#{file_name}"
          self
        end
        
        def results_file file_name
          @builder.append "/resultsFile:#{file_name}"
          self
        end
        
        def unique 
          @builder.append "/unique"
          self
        end
        
        def detail property_id
          @builder.append "/detail:#{property_id}"
          self
        end
        
        def help 
          @builder.append "/help"
          self
        end
        
        def no_logo 
          @builder.append "/noLogo"
          self
        end
        
        def publish server_name
          @builder.append "/publish:#{server_name}"
          self
        end
        
        def publish_results_file file_name
          @builder.append "/publishResultsFile:#{file_name}"
          self
        end
        
        def publish_build build_id
          @builder.append "/publishBuild:#{build_id}"
          self
        end
        
        def team_project team_project_name
          @builder.append "/teamProject:#{team_project_name}"
          self
        end
        
        def platform platform
          @builder.append "/platform:#{platform}"
          self
        end
        
        def flavor flavor
          @builder.append "/flavor:#{flavor}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def mstest
        MSTest.new
      end
      
    end
    
  end
  
  def mstest2005
    MSTest::V2005::MSTest.new
  end
  
end

