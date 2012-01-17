require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module InstallUtil
    module V40
      class InstallUtil
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'installUtil'
          self
        end
        
        def log_file file_name
          @builder.append "/LogFile=#{file_name}"
          self
        end
        
        def assembly_name assembly_name
          @builder.append "/AssemblyName=#{assembly_name}"
          self
        end
        
        def log_to_console bool
          @builder.append "/LogToConsole=#{bool}"
          self
        end
        
        def show_call_stack 
          @builder.append "/ShowCallStack"
          self
        end
        
        def uninstall 
          @builder.append "/Uninstall"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
    end
    
  end
  
  def installutil40
    InstallUtil::V40::InstallUtil.new
  end
  
end

