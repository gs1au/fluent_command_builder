require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def netsh_2008
    b = UnderlyingBuilder.new
    c = FluentCommandBuilder::Netsh::V2008.create b
    yield b if block_given?
    c
  end
  module Netsh
    module V2008
      def self.create(underlying_builder)
        Netsh.new underlying_builder
      end
      def netsh
        b = UnderlyingBuilder.new
        c = FluentCommandBuilder::Netsh::V2008.create b
        yield b if block_given?
        c
      end
      class Netsh < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'netsh'
        end
        def advfirewall
          Advfirewall.new @builder
        end
        def http
          Http.new @builder
        end
      end
      class Advfirewall < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'netsh'
          @builder.append ' advfirewall'
        end
        def firewall
          Firewall.new @builder
        end
      end
      class Firewall < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'netsh'
          @builder.append ' firewall'
        end
        def add_rule(rule_name, direction, action)
          AddRule.new @builder, rule_name, direction, action
        end
        def delete_rule(rule_name)
          DeleteRule.new @builder, rule_name
        end
        def set_rule
          SetRule.new @builder
        end
        def show_rule(rule_name)
          ShowRule.new @builder, rule_name
        end
      end
      class AddRule < CommandBase
        def initialize(underlying_builder, rule_name, direction, action)
          super underlying_builder
          @builder.command_name = 'netsh'
          @builder.append " add rule name=#{@builder.format rule_name} dir=#{@builder.format direction} action=#{@builder.format action}"
        end
        def program(path)
          @builder.append " program=#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def service(service_short_name)
          @builder.append " service=#{@builder.format service_short_name}"
          yield @builder if block_given?
          self
        end
        def description(rule_description)
          @builder.append " description=#{@builder.format rule_description}"
          yield @builder if block_given?
          self
        end
        def enable(enable)
          @builder.append " enable=#{@builder.format enable}"
          yield @builder if block_given?
          self
        end
        def profile(profile)
          @builder.append " profile=#{@builder.format profile}"
          yield @builder if block_given?
          self
        end
        def local_ip(address)
          @builder.append " localIp=#{@builder.format address, ','}"
          yield @builder if block_given?
          self
        end
        def remote_ip(address)
          @builder.append " remoteIp=#{@builder.format address, ','}"
          yield @builder if block_given?
          self
        end
        def local_port(port)
          @builder.append " localPort=#{@builder.format port, ','}"
          yield @builder if block_given?
          self
        end
        def remote_port(port)
          @builder.append " remotePort=#{@builder.format port, ','}"
          yield @builder if block_given?
          self
        end
        def protocol(protocol)
          @builder.append " protocol=#{@builder.format protocol}"
          yield @builder if block_given?
          self
        end
        def interface_type(type)
          @builder.append " interfaceType=#{@builder.format type}"
          yield @builder if block_given?
          self
        end
        def remote_computer_group(sddl_string)
          @builder.append " rmtcomputergrp=#{@builder.format sddl_string}"
          yield @builder if block_given?
          self
        end
        def remote_user_group(sddl_string)
          @builder.append " rmtusgrp=#{@builder.format sddl_string}"
          yield @builder if block_given?
          self
        end
        def edge(edge)
          @builder.append " edge=#{@builder.format edge}"
          yield @builder if block_given?
          self
        end
        def security(security)
          @builder.append " security=#{@builder.format security}"
          yield @builder if block_given?
          self
        end
      end
      class DeleteRule < CommandBase
        def initialize(underlying_builder, rule_name)
          super underlying_builder
          @builder.command_name = 'netsh'
          @builder.append " delete rule name=#{@builder.format rule_name}"
        end
        def dir(direction)
          @builder.append " dir=#{@builder.format direction}"
          yield @builder if block_given?
          self
        end
        def profile(profile)
          @builder.append " profile=#{@builder.format profile}"
          yield @builder if block_given?
          self
        end
        def program(path)
          @builder.append " program=#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def service(service_short_name)
          @builder.append " service=#{@builder.format service_short_name}"
          yield @builder if block_given?
          self
        end
        def local_ip(address)
          @builder.append " localIp=#{@builder.format address, ','}"
          yield @builder if block_given?
          self
        end
        def remote_ip(address)
          @builder.append " remoteIp=#{@builder.format address, ','}"
          yield @builder if block_given?
          self
        end
        def local_port(port)
          @builder.append " localPort=#{@builder.format port, ','}"
          yield @builder if block_given?
          self
        end
        def remote_port(port)
          @builder.append " remotePort=#{@builder.format port, ','}"
          yield @builder if block_given?
          self
        end
        def protocol(protocol)
          @builder.append " protocol=#{@builder.format protocol}"
          yield @builder if block_given?
          self
        end
      end
      class SetRule < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'netsh'
          @builder.append ' set rule'
        end
        def group(group_name)
          @builder.append " group=#{@builder.format group_name}"
          yield @builder if block_given?
          self
        end
        def dir(direction)
          @builder.append " dir=#{@builder.format direction}"
          yield @builder if block_given?
          self
        end
        def profile(profile)
          @builder.append " profile=#{@builder.format profile}"
          yield @builder if block_given?
          self
        end
        def program(path)
          @builder.append " program=#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def service(service_short_name)
          @builder.append " service=#{@builder.format service_short_name}"
          yield @builder if block_given?
          self
        end
        def local_ip(address)
          @builder.append " localIp=#{@builder.format address, ','}"
          yield @builder if block_given?
          self
        end
        def remote_ip(address)
          @builder.append " remoteIp=#{@builder.format address, ','}"
          yield @builder if block_given?
          self
        end
        def local_port(port)
          @builder.append " localPort=#{@builder.format port, ','}"
          yield @builder if block_given?
          self
        end
        def remote_port(port)
          @builder.append " remotePort=#{@builder.format port, ','}"
          yield @builder if block_given?
          self
        end
        def protocol(protocol)
          @builder.append " protocol=#{@builder.format protocol}"
          yield @builder if block_given?
          self
        end
        def new
          New.new @builder
        end
      end
      class New < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'netsh'
          @builder.append ' new'
        end
        def name(rule_name)
          @builder.append " name=#{@builder.format rule_name}"
          yield @builder if block_given?
          self
        end
        def dir(direction)
          @builder.append " dir=#{@builder.format direction}"
          yield @builder if block_given?
          self
        end
        def program(path)
          @builder.append " program=#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def service(service_short_name)
          @builder.append " service=#{@builder.format service_short_name}"
          yield @builder if block_given?
          self
        end
        def action(action)
          @builder.append " action=#{@builder.format action}"
          yield @builder if block_given?
          self
        end
        def description(rule_description)
          @builder.append " description=#{@builder.format rule_description}"
          yield @builder if block_given?
          self
        end
        def enable(enable)
          @builder.append " enable=#{@builder.format enable}"
          yield @builder if block_given?
          self
        end
        def profile(profile)
          @builder.append " profile=#{@builder.format profile}"
          yield @builder if block_given?
          self
        end
        def local_ip(address)
          @builder.append " localIp=#{@builder.format address, ','}"
          yield @builder if block_given?
          self
        end
        def remote_ip(address)
          @builder.append " remoteIp=#{@builder.format address, ','}"
          yield @builder if block_given?
          self
        end
        def local_port(port)
          @builder.append " localPort=#{@builder.format port, ','}"
          yield @builder if block_given?
          self
        end
        def remote_port(port)
          @builder.append " remotePort=#{@builder.format port, ','}"
          yield @builder if block_given?
          self
        end
        def protocol(protocol)
          @builder.append " protocol=#{@builder.format protocol}"
          yield @builder if block_given?
          self
        end
        def interface_type(type)
          @builder.append " interfaceType=#{@builder.format type}"
          yield @builder if block_given?
          self
        end
        def remote_computer_group(sddl_string)
          @builder.append " rmtcomputergrp=#{@builder.format sddl_string}"
          yield @builder if block_given?
          self
        end
        def remote_user_group(sddl_string)
          @builder.append " rmtusgrp=#{@builder.format sddl_string}"
          yield @builder if block_given?
          self
        end
        def edge(edge)
          @builder.append " edge=#{@builder.format edge}"
          yield @builder if block_given?
          self
        end
        def security(security)
          @builder.append " security=#{@builder.format security}"
          yield @builder if block_given?
          self
        end
      end
      class ShowRule < CommandBase
        def initialize(underlying_builder, rule_name)
          super underlying_builder
          @builder.command_name = 'netsh'
          @builder.append " show rule name=#{@builder.format rule_name}"
        end
        def profile(profile)
          @builder.append " profile=#{@builder.format profile}"
          yield @builder if block_given?
          self
        end
        def type(type)
          @builder.append " type=#{@builder.format type}"
          yield @builder if block_given?
          self
        end
        def verbose
          @builder.append ' verbose'
          yield @builder if block_given?
          self
        end
      end
      class Http < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'netsh'
          @builder.append ' http'
        end
        def add_url_acl(url)
          AddUrlAcl.new @builder, url
        end
        def delete_url_acl(url)
          @builder.append " delete urlacl url=#{@builder.format url}"
          yield @builder if block_given?
          self
        end
      end
      class AddUrlAcl < CommandBase
        def initialize(underlying_builder, url)
          super underlying_builder
          @builder.command_name = 'netsh'
          @builder.append " add urlacl url=#{@builder.format url}"
        end
        def user(user)
          @builder.append " user=#{@builder.format user}"
          yield @builder if block_given?
          self
        end
        def listen(listen)
          @builder.append " listen=#{@builder.format listen}"
          yield @builder if block_given?
          self
        end
        def delegate(delegate)
          @builder.append " delegate=#{@builder.format delegate}"
          yield @builder if block_given?
          self
        end
        def sddl(sddl)
          @builder.append " sddl=#{@builder.format sddl}"
          yield @builder if block_given?
          self
        end
      end
    end
  end
end
