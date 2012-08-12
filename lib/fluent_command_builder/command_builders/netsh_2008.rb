require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def netsh_2008()
    Netsh::V2008.create() { |b| yield b if block_given? }
  end
  module Netsh
    module V2008
      def self.create()
        b = UnderlyingBuilder.new FluentCommandBuilder::Netsh::COMMAND_NAME
        c = Netsh.new b
        yield b if block_given?
        c
      end
      def netsh()
        V2008.create() { |b| yield b if block_given? }
      end
      class Netsh < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def advfirewall
          Advfirewall.new b
        end
        def http
          Http.new b
        end
      end
      class Advfirewall < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          b.append ' advfirewall'
        end
        def firewall
          Firewall.new b
        end
      end
      class Firewall < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          b.append ' firewall'
        end
        def add_rule(rule_name, direction, action)
          AddRule.new b, rule_name, direction, action
        end
        def delete_rule(rule_name)
          DeleteRule.new b, rule_name
        end
        def set_rule
          SetRule.new b
        end
        def show_rule(rule_name)
          ShowRule.new b, rule_name
        end
      end
      class AddRule < CommandBase
        def initialize(underlying_builder, rule_name, direction, action)
          super underlying_builder
          b.append " add rule name=#{b.format rule_name} dir=#{b.format direction} action=#{b.format action}"
        end
        def program(path)
          b.append " program=#{b.format path}"
          yield b if block_given?
          self
        end
        def service(service_short_name)
          b.append " service=#{b.format service_short_name}"
          yield b if block_given?
          self
        end
        def description(rule_description)
          b.append " description=#{b.format rule_description}"
          yield b if block_given?
          self
        end
        def enable(enable)
          b.append " enable=#{b.format enable}"
          yield b if block_given?
          self
        end
        def profile(profile)
          b.append " profile=#{b.format profile}"
          yield b if block_given?
          self
        end
        def local_ip(address)
          b.append " localIp=#{b.format address, ','}"
          yield b if block_given?
          self
        end
        def remote_ip(address)
          b.append " remoteIp=#{b.format address, ','}"
          yield b if block_given?
          self
        end
        def local_port(port)
          b.append " localPort=#{b.format port, ','}"
          yield b if block_given?
          self
        end
        def remote_port(port)
          b.append " remotePort=#{b.format port, ','}"
          yield b if block_given?
          self
        end
        def protocol(protocol)
          b.append " protocol=#{b.format protocol}"
          yield b if block_given?
          self
        end
        def interface_type(type)
          b.append " interfaceType=#{b.format type}"
          yield b if block_given?
          self
        end
        def remote_computer_group(sddl_string)
          b.append " rmtcomputergrp=#{b.format sddl_string}"
          yield b if block_given?
          self
        end
        def remote_user_group(sddl_string)
          b.append " rmtusgrp=#{b.format sddl_string}"
          yield b if block_given?
          self
        end
        def edge(edge)
          b.append " edge=#{b.format edge}"
          yield b if block_given?
          self
        end
        def security(security)
          b.append " security=#{b.format security}"
          yield b if block_given?
          self
        end
      end
      class DeleteRule < CommandBase
        def initialize(underlying_builder, rule_name)
          super underlying_builder
          b.append " delete rule name=#{b.format rule_name}"
        end
        def dir(direction)
          b.append " dir=#{b.format direction}"
          yield b if block_given?
          self
        end
        def profile(profile)
          b.append " profile=#{b.format profile}"
          yield b if block_given?
          self
        end
        def program(path)
          b.append " program=#{b.format path}"
          yield b if block_given?
          self
        end
        def service(service_short_name)
          b.append " service=#{b.format service_short_name}"
          yield b if block_given?
          self
        end
        def local_ip(address)
          b.append " localIp=#{b.format address, ','}"
          yield b if block_given?
          self
        end
        def remote_ip(address)
          b.append " remoteIp=#{b.format address, ','}"
          yield b if block_given?
          self
        end
        def local_port(port)
          b.append " localPort=#{b.format port, ','}"
          yield b if block_given?
          self
        end
        def remote_port(port)
          b.append " remotePort=#{b.format port, ','}"
          yield b if block_given?
          self
        end
        def protocol(protocol)
          b.append " protocol=#{b.format protocol}"
          yield b if block_given?
          self
        end
      end
      class SetRule < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          b.append ' set rule'
        end
        def group(group_name)
          b.append " group=#{b.format group_name}"
          yield b if block_given?
          self
        end
        def dir(direction)
          b.append " dir=#{b.format direction}"
          yield b if block_given?
          self
        end
        def profile(profile)
          b.append " profile=#{b.format profile}"
          yield b if block_given?
          self
        end
        def program(path)
          b.append " program=#{b.format path}"
          yield b if block_given?
          self
        end
        def service(service_short_name)
          b.append " service=#{b.format service_short_name}"
          yield b if block_given?
          self
        end
        def local_ip(address)
          b.append " localIp=#{b.format address, ','}"
          yield b if block_given?
          self
        end
        def remote_ip(address)
          b.append " remoteIp=#{b.format address, ','}"
          yield b if block_given?
          self
        end
        def local_port(port)
          b.append " localPort=#{b.format port, ','}"
          yield b if block_given?
          self
        end
        def remote_port(port)
          b.append " remotePort=#{b.format port, ','}"
          yield b if block_given?
          self
        end
        def protocol(protocol)
          b.append " protocol=#{b.format protocol}"
          yield b if block_given?
          self
        end
        def new
          New.new b
        end
      end
      class New < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          b.append ' new'
        end
        def name(rule_name)
          b.append " name=#{b.format rule_name}"
          yield b if block_given?
          self
        end
        def dir(direction)
          b.append " dir=#{b.format direction}"
          yield b if block_given?
          self
        end
        def program(path)
          b.append " program=#{b.format path}"
          yield b if block_given?
          self
        end
        def service(service_short_name)
          b.append " service=#{b.format service_short_name}"
          yield b if block_given?
          self
        end
        def action(action)
          b.append " action=#{b.format action}"
          yield b if block_given?
          self
        end
        def description(rule_description)
          b.append " description=#{b.format rule_description}"
          yield b if block_given?
          self
        end
        def enable(enable)
          b.append " enable=#{b.format enable}"
          yield b if block_given?
          self
        end
        def profile(profile)
          b.append " profile=#{b.format profile}"
          yield b if block_given?
          self
        end
        def local_ip(address)
          b.append " localIp=#{b.format address, ','}"
          yield b if block_given?
          self
        end
        def remote_ip(address)
          b.append " remoteIp=#{b.format address, ','}"
          yield b if block_given?
          self
        end
        def local_port(port)
          b.append " localPort=#{b.format port, ','}"
          yield b if block_given?
          self
        end
        def remote_port(port)
          b.append " remotePort=#{b.format port, ','}"
          yield b if block_given?
          self
        end
        def protocol(protocol)
          b.append " protocol=#{b.format protocol}"
          yield b if block_given?
          self
        end
        def interface_type(type)
          b.append " interfaceType=#{b.format type}"
          yield b if block_given?
          self
        end
        def remote_computer_group(sddl_string)
          b.append " rmtcomputergrp=#{b.format sddl_string}"
          yield b if block_given?
          self
        end
        def remote_user_group(sddl_string)
          b.append " rmtusgrp=#{b.format sddl_string}"
          yield b if block_given?
          self
        end
        def edge(edge)
          b.append " edge=#{b.format edge}"
          yield b if block_given?
          self
        end
        def security(security)
          b.append " security=#{b.format security}"
          yield b if block_given?
          self
        end
      end
      class ShowRule < CommandBase
        def initialize(underlying_builder, rule_name)
          super underlying_builder
          b.append " show rule name=#{b.format rule_name}"
        end
        def profile(profile)
          b.append " profile=#{b.format profile}"
          yield b if block_given?
          self
        end
        def type(type)
          b.append " type=#{b.format type}"
          yield b if block_given?
          self
        end
        def verbose
          b.append ' verbose'
          yield b if block_given?
          self
        end
      end
      class Http < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          b.append ' http'
        end
        def add_url_acl(url)
          AddUrlAcl.new b, url
        end
        def delete_url_acl(url)
          b.append " delete urlacl url=#{b.format url}"
          yield b if block_given?
          self
        end
      end
      class AddUrlAcl < CommandBase
        def initialize(underlying_builder, url)
          super underlying_builder
          b.append " add urlacl url=#{b.format url}"
        end
        def user(user)
          b.append " user=#{b.format user}"
          yield b if block_given?
          self
        end
        def listen(listen)
          b.append " listen=#{b.format listen}"
          yield b if block_given?
          self
        end
        def delegate(delegate)
          b.append " delegate=#{b.format delegate}"
          yield b if block_given?
          self
        end
        def sddl(sddl)
          b.append " sddl=#{b.format sddl}"
          yield b if block_given?
          self
        end
      end

    end
  end
end