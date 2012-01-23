require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module MSTest
    module V2010
      class MSTest
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'MSTest'
          self
        end
        
        def test_container file_name
          @b.append "/testContainer:#{@b.format file_name}"
          self
        end
        
        def test_metadata file_name
          @b.append "/testMetadata:#{@b.format file_name}"
          self
        end
        
        def test_list list_list_path
          @b.append "/testList:#{@b.format list_list_path}"
          self
        end
        
        def category test_category_filter
          @b.append "/category:#{@b.format test_category_filter}"
          self
        end
        
        def test test_name
          @b.append "/test:#{@b.format test_name}"
          self
        end
        
        def no_isolation 
          @b.append '/noIsolation'
          self
        end
        
        def test_settings file_name
          @b.append "/testSettings:#{@b.format file_name}"
          self
        end
        
        def run_config file_name
          @b.append "/runConfig:#{@b.format file_name}"
          self
        end
        
        def results_file file_name
          @b.append "/resultsFile:#{@b.format file_name}"
          self
        end
        
        def unique 
          @b.append '/unique'
          self
        end
        
        def detail property_id
          @b.append "/detail:#{@b.format property_id}"
          self
        end
        
        def help 
          @b.append '/help'
          self
        end
        
        def no_logo 
          @b.append '/noLogo'
          self
        end
        
        def use_std_err 
          @b.append '/useStdErr'
          self
        end
        
        def publish server_name
          @b.append "/publish:#{@b.format server_name}"
          self
        end
        
        def publish_results_file file_name
          @b.append "/publishResultsFile:#{@b.format file_name}"
          self
        end
        
        def publish_build build_id
          @b.append "/publishBuild:#{@b.format build_id}"
          self
        end
        
        def team_project team_project_name
          @b.append "/teamProject:#{@b.format team_project_name}"
          self
        end
        
        def platform platform
          @b.append "/platform:#{@b.format platform}"
          self
        end
        
        def flavor flavor
          @b.append "/flavor:#{@b.format flavor}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def mstest
        MSTest.new
      end
      
    end
    
  end
  
  def mstest_2010
    MSTest::V2010::MSTest.new
  end
  
end

