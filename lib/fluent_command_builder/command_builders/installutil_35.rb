require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module InstallUtil
    module V35
      class InstallUtil
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'installUtil'
          self
        end
        
        def assembly_file_name assembly_file_name
          @b.append "#{@b.format assembly_file_name}"
          self
        end
        
        def help 
          @b.append '/help'
          self
        end
        
        def log_file file_name
          @b.append "/logFile=#{@b.format file_name}"
          self
        end
        
        def assembly_name assembly_strong_name
          @b.append "/assemblyName=#{@b.format assembly_strong_name}"
          self
        end
        
        def log_to_console bool
          @b.append "/logToConsole=#{@b.format bool}"
          self
        end
        
        def show_call_stack 
          @b.append '/showCallStack'
          self
        end
        
        def uninstall 
          @b.append '/uninstall'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def installutil
        InstallUtil.new
      end
      
    end
    
  end
  
  def installutil_35
    InstallUtil::V35::InstallUtil.new
  end
  
end

