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
        def http 
          Http.new @builder
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Advfirewall
        def initialize builder
          @builder = builder
          @builder.append ' advfirewall'
        end
        def firewall 
          Firewall.new @builder
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Firewall
        def initialize builder
          @builder = builder
          @builder.append ' firewall'
        end
        def add_rule rule_name, direction, action
          AddRule.new @builder, rule_name, direction, action
        end
        def delete_rule rule_name
          DeleteRule.new @builder, rule_name
        end
        def set_rule 
          SetRule.new @builder
        end
        def show_rule rule_name
          ShowRule.new @builder, rule_name
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class AddRule
        def initialize builder, rule_name, direction, action
          @builder = builder
          @builder.append " add rule name=#{@builder.format rule_name} dir=#{@builder.format direction} action=#{@builder.format action}"
        end
        def program path
          @builder.append " program=#{@builder.format path}"
          self
        end
        def service service_short_name
          @builder.append " service=#{@builder.format service_short_name}"
          self
        end
        def description rule_description
          @builder.append " description=#{@builder.format rule_description}"
          self
        end
        def enable enable
          @builder.append " enable=#{@builder.format enable}"
          self
        end
        def profile profile
          @builder.append " profile=#{@builder.format profile}"
          self
        end
        def local_ip address
          @builder.append " localIp=#{@builder.format address, ','}"
          self
        end
        def remote_ip address
          @builder.append " remoteIp=#{@builder.format address, ','}"
          self
        end
        def local_port port
          @builder.append " localPort=#{@builder.format port, ','}"
          self
        end
        def remote_port port
          @builder.append " remotePort=#{@builder.format port, ','}"
          self
        end
        def protocol protocol
          @builder.append " protocol=#{@builder.format protocol}"
          self
        end
        def interface_type type
          @builder.append " interfaceType=#{@builder.format type}"
          self
        end
        def rmtcomputergrp sddl_string
          @builder.append " rmtcomputergrp=#{@builder.format sddl_string}"
          self
        end
        def rmtusgrp sddl_string
          @builder.append " rmtusgrp=#{@builder.format sddl_string}"
          self
        end
        def edge edge
          @builder.append " edge=#{@builder.format edge}"
          self
        end
        def security security
          @builder.append " security=#{@builder.format security}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class DeleteRule
        def initialize builder, rule_name
          @builder = builder
          @builder.append " delete rule name=#{@builder.format rule_name}"
        end
        def dir direction
          @builder.append " dir=#{@builder.format direction}"
          self
        end
        def profile profile
          @builder.append " profile=#{@builder.format profile}"
          self
        end
        def program path
          @builder.append " program=#{@builder.format path}"
          self
        end
        def service service_short_name
          @builder.append " service=#{@builder.format service_short_name}"
          self
        end
        def local_ip address
          @builder.append " localIp=#{@builder.format address, ','}"
          self
        end
        def remote_ip address
          @builder.append " remoteIp=#{@builder.format address, ','}"
          self
        end
        def local_port port
          @builder.append " localPort=#{@builder.format port, ','}"
          self
        end
        def remote_port port
          @builder.append " remotePort=#{@builder.format port, ','}"
          self
        end
        def protocol protocol
          @builder.append " protocol=#{@builder.format protocol}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class SetRule
        def initialize builder
          @builder = builder
          @builder.append ' set rule'
        end
        def group group_name
          @builder.append " group=#{@builder.format group_name}"
          self
        end
        def dir direction
          @builder.append " dir=#{@builder.format direction}"
          self
        end
        def profile profile
          @builder.append " profile=#{@builder.format profile}"
          self
        end
        def program path
          @builder.append " program=#{@builder.format path}"
          self
        end
        def service service_short_name
          @builder.append " service=#{@builder.format service_short_name}"
          self
        end
        def local_ip address
          @builder.append " localIp=#{@builder.format address, ','}"
          self
        end
        def remote_ip address
          @builder.append " remoteIp=#{@builder.format address, ','}"
          self
        end
        def local_port port
          @builder.append " localPort=#{@builder.format port, ','}"
          self
        end
        def remote_port port
          @builder.append " remotePort=#{@builder.format port, ','}"
          self
        end
        def protocol protocol
          @builder.append " protocol=#{@builder.format protocol}"
          self
        end
        def new 
          New.new @builder
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class New
        def initialize builder
          @builder = builder
          @builder.append ' new'
        end
        def name rule_name
          @builder.append " name=#{@builder.format rule_name}"
          self
        end
        def dir direction
          @builder.append " dir=#{@builder.format direction}"
          self
        end
        def program path
          @builder.append " program=#{@builder.format path}"
          self
        end
        def service service_short_name
          @builder.append " service=#{@builder.format service_short_name}"
          self
        end
        def action action
          @builder.append " action=#{@builder.format action}"
          self
        end
        def description rule_description
          @builder.append " description=#{@builder.format rule_description}"
          self
        end
        def enable enable
          @builder.append " enable=#{@builder.format enable}"
          self
        end
        def profile profile
          @builder.append " profile=#{@builder.format profile}"
          self
        end
        def local_ip address
          @builder.append " localIp=#{@builder.format address, ','}"
          self
        end
        def remote_ip address
          @builder.append " remoteIp=#{@builder.format address, ','}"
          self
        end
        def local_port port
          @builder.append " localPort=#{@builder.format port, ','}"
          self
        end
        def remote_port port
          @builder.append " remotePort=#{@builder.format port, ','}"
          self
        end
        def protocol protocol
          @builder.append " protocol=#{@builder.format protocol}"
          self
        end
        def interface_type type
          @builder.append " interfaceType=#{@builder.format type}"
          self
        end
        def rmtcomputergrp sddl_string
          @builder.append " rmtcomputergrp=#{@builder.format sddl_string}"
          self
        end
        def rmtusgrp sddl_string
          @builder.append " rmtusgrp=#{@builder.format sddl_string}"
          self
        end
        def edge edge
          @builder.append " edge=#{@builder.format edge}"
          self
        end
        def security security
          @builder.append " security=#{@builder.format security}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ShowRule
        def initialize builder, rule_name
          @builder = builder
          @builder.append " show rule name=#{@builder.format rule_name}"
        end
        def profile profile
          @builder.append " profile=#{@builder.format profile}"
          self
        end
        def type type
          @builder.append " type=#{@builder.format type}"
          self
        end
        def verbose 
          @builder.append ' verbose'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Http
        def initialize builder
          @builder = builder
          @builder.append ' http'
        end
        def add_url_acl url
          AddUrlAcl.new @builder, url
        end
        def delete_url_acl url
          @builder.append " delete urlacl url=#{@builder.format url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class AddUrlAcl
        def initialize builder, url
          @builder = builder
          @builder.append " add urlacl url=#{@builder.format url}"
        end
        def user user
          @builder.append " user=#{@builder.format user}"
          self
        end
        def listen listen
          @builder.append " listen=#{@builder.format listen}"
          self
        end
        def delegate delegate
          @builder.append " delegate=#{@builder.format delegate}"
          self
        end
        def sddl sddl
          @builder.append " sddl=#{@builder.format sddl}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
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
