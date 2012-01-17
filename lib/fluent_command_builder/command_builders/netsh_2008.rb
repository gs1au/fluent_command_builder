require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Netsh
    module V2008
      class Netsh
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'netsh'
          self
        end
        
        def advfirewall
          Advfirewall.new self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Advfirewall
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'advfirewall'
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
          @builder.to_s
        end
        
      end
      
      class AddRule
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'add rule'
          self
        end
        
        def name rule_name
          @builder.append "name=#{rule_name}"
          self
        end
        
        def dir direction
          @builder.append "dir=#{direction}"
          self
        end
        
        def action action
          @builder.append "action=#{action}"
          self
        end
        
        def program path
          @builder.append "program=#{path}"
          self
        end
        
        def service service_short_name
          @builder.append "service=#{service_short_name}"
          self
        end
        
        def description rule_description
          @builder.append "description=#{rule_description}"
          self
        end
        
        def enable enable
          @builder.append "enable=#{enable}"
          self
        end
        
        def profile profile
          @builder.append "profile=#{profile}"
          self
        end
        
        def localip addresses
          @builder.append "localip=#{addresses}"
          self
        end
        
        def remoteip addresses
          @builder.append "remoteip=#{addresses}"
          self
        end
        
        def localport port
          @builder.append "localport=#{port}"
          self
        end
        
        def remoteport port
          @builder.append "remoteport=#{port}"
          self
        end
        
        def protocol protocol
          @builder.append "protocol=#{protocol}"
          self
        end
        
        def interface_type type
          @builder.append "interfaceType=#{type}"
          self
        end
        
        def rmtcomputergrp sddl_string
          @builder.append "rmtcomputergrp=#{sddl_string}"
          self
        end
        
        def rmtusgrp sddl_string
          @builder.append "rmtusgrp=#{sddl_string}"
          self
        end
        
        def edge edge
          @builder.append "edge=#{edge}"
          self
        end
        
        def security security
          @builder.append "security=#{security}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class DeleteRule
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'delete rule'
          self
        end
        
        def name rule_name
          @builder.append "name=#{rule_name}"
          self
        end
        
        def dir direction
          @builder.append "dir=#{direction}"
          self
        end
        
        def profile profile
          @builder.append "profile=#{profile}"
          self
        end
        
        def program path
          @builder.append "program=#{path}"
          self
        end
        
        def service service_short_name
          @builder.append "service=#{service_short_name}"
          self
        end
        
        def localip addresses
          @builder.append "localip=#{addresses}"
          self
        end
        
        def remoteip addresses
          @builder.append "remoteip=#{addresses}"
          self
        end
        
        def localport port
          @builder.append "localport=#{port}"
          self
        end
        
        def remoteport port
          @builder.append "remoteport=#{port}"
          self
        end
        
        def protocol protocol
          @builder.append "protocol=#{protocol}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class SetRule
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'set rule'
          self
        end
        
        def new
          New.new self
        end
        
        def group group_name
          @builder.append "group=#{group_name}"
          self
        end
        
        def dir direction
          @builder.append "dir=#{direction}"
          self
        end
        
        def profile profile
          @builder.append "profile=#{profile}"
          self
        end
        
        def program path
          @builder.append "program=#{path}"
          self
        end
        
        def service service_short_name
          @builder.append "service=#{service_short_name}"
          self
        end
        
        def localip addresses
          @builder.append "localip=#{addresses}"
          self
        end
        
        def remoteip addresses
          @builder.append "remoteip=#{addresses}"
          self
        end
        
        def localport port
          @builder.append "localport=#{port}"
          self
        end
        
        def remoteport port
          @builder.append "remoteport=#{port}"
          self
        end
        
        def protocol protocol
          @builder.append "protocol=#{protocol}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class New
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'new'
          self
        end
        
        def name rule_name
          @builder.append "name=#{rule_name}"
          self
        end
        
        def dir direction
          @builder.append "dir=#{direction}"
          self
        end
        
        def program path
          @builder.append "program=#{path}"
          self
        end
        
        def service service_short_name
          @builder.append "service=#{service_short_name}"
          self
        end
        
        def action action
          @builder.append "action=#{action}"
          self
        end
        
        def description rule_description
          @builder.append "description=#{rule_description}"
          self
        end
        
        def enable enable
          @builder.append "enable=#{enable}"
          self
        end
        
        def profile profile
          @builder.append "profile=#{profile}"
          self
        end
        
        def localip addresses
          @builder.append "localip=#{addresses}"
          self
        end
        
        def remoteip addresses
          @builder.append "remoteip=#{addresses}"
          self
        end
        
        def localport port
          @builder.append "localport=#{port}"
          self
        end
        
        def remoteport port
          @builder.append "remoteport=#{port}"
          self
        end
        
        def protocol protocol
          @builder.append "protocol=#{protocol}"
          self
        end
        
        def interface_type type
          @builder.append "interfaceType=#{type}"
          self
        end
        
        def rmtcomputergrp sddl_string
          @builder.append "rmtcomputergrp=#{sddl_string}"
          self
        end
        
        def rmtusgrp sddl_string
          @builder.append "rmtusgrp=#{sddl_string}"
          self
        end
        
        def edge edge
          @builder.append "edge=#{edge}"
          self
        end
        
        def security security
          @builder.append "security=#{security}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class ShowRule
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'show rule'
          self
        end
        
        def verbose
          Verbose.new self
        end
        
        def name rule_name
          @builder.append "name=#{rule_name}"
          self
        end
        
        def profile profile
          @builder.append "profile=#{profile}"
          self
        end
        
        def type type
          @builder.append "type=#{type}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Verbose
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'verbose'
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      def netsh
        Netsh.new
      end
      
    end
    
  end
  
  def netsh2008
    Netsh::V2008::Netsh.new
  end
  
end

