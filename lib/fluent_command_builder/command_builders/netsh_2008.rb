require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Netsh
    module V2008
      class Netsh
        def initialize builder
          @builder = builder
          @builder.append 'netsh'
        end
        def advfirewall 
          Advfirewall.new @builder
        end
        def to_s 
          @builder.to_s
        end
      end
      class Advfirewall
        def initialize builder
          @builder = builder
          @builder.append 'advfirewall'
        end
        def add_rule 
          AddRule.new @builder
        end
        def delete_rule 
          DeleteRule.new @builder
        end
        def set_rule 
          SetRule.new @builder
        end
        def show_rule 
          ShowRule.new @builder
        end
        def to_s 
          @builder.to_s
        end
      end
      class AddRule
        def initialize builder
          @builder = builder
          @builder.append 'add rule'
        end
        def name rule_name=nil
          @builder.append "name=#{@builder.format rule_name}"
          self
        end
        def dir direction=nil
          @builder.append "dir=#{@builder.format direction}"
          self
        end
        def action action=nil
          @builder.append "action=#{@builder.format action}"
          self
        end
        def program path=nil
          @builder.append "program=#{@builder.format path}"
          self
        end
        def service service_short_name=nil
          @builder.append "service=#{@builder.format service_short_name}"
          self
        end
        def description rule_description=nil
          @builder.append "description=#{@builder.format rule_description}"
          self
        end
        def enable enable=nil
          @builder.append "enable=#{@builder.format enable}"
          self
        end
        def profile profile=nil
          @builder.append "profile=#{@builder.format profile}"
          self
        end
        def localip addresses=nil
          @builder.append "localip=#{@builder.format addresses}"
          self
        end
        def remoteip addresses=nil
          @builder.append "remoteip=#{@builder.format addresses}"
          self
        end
        def localport port=nil
          @builder.append "localport=#{@builder.format port}"
          self
        end
        def remoteport port=nil
          @builder.append "remoteport=#{@builder.format port}"
          self
        end
        def protocol protocol=nil
          @builder.append "protocol=#{@builder.format protocol}"
          self
        end
        def interface_type type=nil
          @builder.append "interfaceType=#{@builder.format type}"
          self
        end
        def rmtcomputergrp sddl_string=nil
          @builder.append "rmtcomputergrp=#{@builder.format sddl_string}"
          self
        end
        def rmtusgrp sddl_string=nil
          @builder.append "rmtusgrp=#{@builder.format sddl_string}"
          self
        end
        def edge edge=nil
          @builder.append "edge=#{@builder.format edge}"
          self
        end
        def security security=nil
          @builder.append "security=#{@builder.format security}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class DeleteRule
        def initialize builder
          @builder = builder
          @builder.append 'delete rule'
        end
        def name rule_name=nil
          @builder.append "name=#{@builder.format rule_name}"
          self
        end
        def dir direction=nil
          @builder.append "dir=#{@builder.format direction}"
          self
        end
        def profile profile=nil
          @builder.append "profile=#{@builder.format profile}"
          self
        end
        def program path=nil
          @builder.append "program=#{@builder.format path}"
          self
        end
        def service service_short_name=nil
          @builder.append "service=#{@builder.format service_short_name}"
          self
        end
        def localip addresses=nil
          @builder.append "localip=#{@builder.format addresses}"
          self
        end
        def remoteip addresses=nil
          @builder.append "remoteip=#{@builder.format addresses}"
          self
        end
        def localport port=nil
          @builder.append "localport=#{@builder.format port}"
          self
        end
        def remoteport port=nil
          @builder.append "remoteport=#{@builder.format port}"
          self
        end
        def protocol protocol=nil
          @builder.append "protocol=#{@builder.format protocol}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class SetRule
        def initialize builder
          @builder = builder
          @builder.append 'set rule'
        end
        def group group_name=nil
          @builder.append "group=#{@builder.format group_name}"
          self
        end
        def dir direction=nil
          @builder.append "dir=#{@builder.format direction}"
          self
        end
        def profile profile=nil
          @builder.append "profile=#{@builder.format profile}"
          self
        end
        def program path=nil
          @builder.append "program=#{@builder.format path}"
          self
        end
        def service service_short_name=nil
          @builder.append "service=#{@builder.format service_short_name}"
          self
        end
        def localip addresses=nil
          @builder.append "localip=#{@builder.format addresses}"
          self
        end
        def remoteip addresses=nil
          @builder.append "remoteip=#{@builder.format addresses}"
          self
        end
        def localport port=nil
          @builder.append "localport=#{@builder.format port}"
          self
        end
        def remoteport port=nil
          @builder.append "remoteport=#{@builder.format port}"
          self
        end
        def protocol protocol=nil
          @builder.append "protocol=#{@builder.format protocol}"
          self
        end
        def new 
          New.new @builder
        end
        def to_s 
          @builder.to_s
        end
      end
      class New
        def initialize builder
          @builder = builder
          @builder.append 'new'
        end
        def name rule_name=nil
          @builder.append "name=#{@builder.format rule_name}"
          self
        end
        def dir direction=nil
          @builder.append "dir=#{@builder.format direction}"
          self
        end
        def program path=nil
          @builder.append "program=#{@builder.format path}"
          self
        end
        def service service_short_name=nil
          @builder.append "service=#{@builder.format service_short_name}"
          self
        end
        def action action=nil
          @builder.append "action=#{@builder.format action}"
          self
        end
        def description rule_description=nil
          @builder.append "description=#{@builder.format rule_description}"
          self
        end
        def enable enable=nil
          @builder.append "enable=#{@builder.format enable}"
          self
        end
        def profile profile=nil
          @builder.append "profile=#{@builder.format profile}"
          self
        end
        def localip addresses=nil
          @builder.append "localip=#{@builder.format addresses}"
          self
        end
        def remoteip addresses=nil
          @builder.append "remoteip=#{@builder.format addresses}"
          self
        end
        def localport port=nil
          @builder.append "localport=#{@builder.format port}"
          self
        end
        def remoteport port=nil
          @builder.append "remoteport=#{@builder.format port}"
          self
        end
        def protocol protocol=nil
          @builder.append "protocol=#{@builder.format protocol}"
          self
        end
        def interface_type type=nil
          @builder.append "interfaceType=#{@builder.format type}"
          self
        end
        def rmtcomputergrp sddl_string=nil
          @builder.append "rmtcomputergrp=#{@builder.format sddl_string}"
          self
        end
        def rmtusgrp sddl_string=nil
          @builder.append "rmtusgrp=#{@builder.format sddl_string}"
          self
        end
        def edge edge=nil
          @builder.append "edge=#{@builder.format edge}"
          self
        end
        def security security=nil
          @builder.append "security=#{@builder.format security}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class ShowRule
        def initialize builder
          @builder = builder
          @builder.append 'show rule'
        end
        def name rule_name=nil
          @builder.append "name=#{@builder.format rule_name}"
          self
        end
        def profile profile=nil
          @builder.append "profile=#{@builder.format profile}"
          self
        end
        def type type=nil
          @builder.append "type=#{@builder.format type}"
          self
        end
        def verbose 
          @builder.append 'verbose'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def netsh 
        Netsh.new CommandBuilder.new
      end
    end
  end
  def netsh_2008 
    Netsh::V2008::Netsh.new CommandBuilder.new
  end
end
