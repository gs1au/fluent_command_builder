require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Netsh
    module V2008
      class Netsh
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'netsh'
          self
        end
        
        def advfirewall 
          Advfirewall.new self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Advfirewall
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'advfirewall'
          self
        end
        
        def add_rule 
          AddRule.new self
        end
        
        def delete_rule 
          DeleteRule.new self
        end
        
        def set_rule 
          SetRule.new self
        end
        
        def show_rule 
          ShowRule.new self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class AddRule
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'add rule'
          self
        end
        
        def name rule_name
          @b.append "name=#{@b.format rule_name}"
          self
        end
        
        def dir direction
          @b.append "dir=#{@b.format direction}"
          self
        end
        
        def action action
          @b.append "action=#{@b.format action}"
          self
        end
        
        def program path
          @b.append "program=#{@b.format path}"
          self
        end
        
        def service service_short_name
          @b.append "service=#{@b.format service_short_name}"
          self
        end
        
        def description rule_description
          @b.append "description=#{@b.format rule_description}"
          self
        end
        
        def enable enable
          @b.append "enable=#{@b.format enable}"
          self
        end
        
        def profile profile
          @b.append "profile=#{@b.format profile}"
          self
        end
        
        def localip addresses
          @b.append "localip=#{@b.format addresses}"
          self
        end
        
        def remoteip addresses
          @b.append "remoteip=#{@b.format addresses}"
          self
        end
        
        def localport port
          @b.append "localport=#{@b.format port}"
          self
        end
        
        def remoteport port
          @b.append "remoteport=#{@b.format port}"
          self
        end
        
        def protocol protocol
          @b.append "protocol=#{@b.format protocol}"
          self
        end
        
        def interface_type type
          @b.append "interfaceType=#{@b.format type}"
          self
        end
        
        def rmtcomputergrp sddl_string
          @b.append "rmtcomputergrp=#{@b.format sddl_string}"
          self
        end
        
        def rmtusgrp sddl_string
          @b.append "rmtusgrp=#{@b.format sddl_string}"
          self
        end
        
        def edge edge
          @b.append "edge=#{@b.format edge}"
          self
        end
        
        def security security
          @b.append "security=#{@b.format security}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class DeleteRule
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'delete rule'
          self
        end
        
        def name rule_name
          @b.append "name=#{@b.format rule_name}"
          self
        end
        
        def dir direction
          @b.append "dir=#{@b.format direction}"
          self
        end
        
        def profile profile
          @b.append "profile=#{@b.format profile}"
          self
        end
        
        def program path
          @b.append "program=#{@b.format path}"
          self
        end
        
        def service service_short_name
          @b.append "service=#{@b.format service_short_name}"
          self
        end
        
        def localip addresses
          @b.append "localip=#{@b.format addresses}"
          self
        end
        
        def remoteip addresses
          @b.append "remoteip=#{@b.format addresses}"
          self
        end
        
        def localport port
          @b.append "localport=#{@b.format port}"
          self
        end
        
        def remoteport port
          @b.append "remoteport=#{@b.format port}"
          self
        end
        
        def protocol protocol
          @b.append "protocol=#{@b.format protocol}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class SetRule
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'set rule'
          self
        end
        
        def group group_name
          @b.append "group=#{@b.format group_name}"
          self
        end
        
        def dir direction
          @b.append "dir=#{@b.format direction}"
          self
        end
        
        def profile profile
          @b.append "profile=#{@b.format profile}"
          self
        end
        
        def program path
          @b.append "program=#{@b.format path}"
          self
        end
        
        def service service_short_name
          @b.append "service=#{@b.format service_short_name}"
          self
        end
        
        def localip addresses
          @b.append "localip=#{@b.format addresses}"
          self
        end
        
        def remoteip addresses
          @b.append "remoteip=#{@b.format addresses}"
          self
        end
        
        def localport port
          @b.append "localport=#{@b.format port}"
          self
        end
        
        def remoteport port
          @b.append "remoteport=#{@b.format port}"
          self
        end
        
        def protocol protocol
          @b.append "protocol=#{@b.format protocol}"
          self
        end
        
        def new 
          New.new self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class New
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'new'
          self
        end
        
        def name rule_name
          @b.append "name=#{@b.format rule_name}"
          self
        end
        
        def dir direction
          @b.append "dir=#{@b.format direction}"
          self
        end
        
        def program path
          @b.append "program=#{@b.format path}"
          self
        end
        
        def service service_short_name
          @b.append "service=#{@b.format service_short_name}"
          self
        end
        
        def action action
          @b.append "action=#{@b.format action}"
          self
        end
        
        def description rule_description
          @b.append "description=#{@b.format rule_description}"
          self
        end
        
        def enable enable
          @b.append "enable=#{@b.format enable}"
          self
        end
        
        def profile profile
          @b.append "profile=#{@b.format profile}"
          self
        end
        
        def localip addresses
          @b.append "localip=#{@b.format addresses}"
          self
        end
        
        def remoteip addresses
          @b.append "remoteip=#{@b.format addresses}"
          self
        end
        
        def localport port
          @b.append "localport=#{@b.format port}"
          self
        end
        
        def remoteport port
          @b.append "remoteport=#{@b.format port}"
          self
        end
        
        def protocol protocol
          @b.append "protocol=#{@b.format protocol}"
          self
        end
        
        def interface_type type
          @b.append "interfaceType=#{@b.format type}"
          self
        end
        
        def rmtcomputergrp sddl_string
          @b.append "rmtcomputergrp=#{@b.format sddl_string}"
          self
        end
        
        def rmtusgrp sddl_string
          @b.append "rmtusgrp=#{@b.format sddl_string}"
          self
        end
        
        def edge edge
          @b.append "edge=#{@b.format edge}"
          self
        end
        
        def security security
          @b.append "security=#{@b.format security}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class ShowRule
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'show rule'
          self
        end
        
        def name rule_name
          @b.append "name=#{@b.format rule_name}"
          self
        end
        
        def profile profile
          @b.append "profile=#{@b.format profile}"
          self
        end
        
        def type type
          @b.append "type=#{@b.format type}"
          self
        end
        
        def verbose 
          @b.append 'verbose'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def netsh
        Netsh.new
      end
      
    end
    
  end
  
  def netsh_2008
    Netsh::V2008::Netsh.new
  end
  
end

