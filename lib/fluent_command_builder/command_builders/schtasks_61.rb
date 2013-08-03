# Generated code. Do not modify.

require_relative '../internal/command_base'
require_relative '../internal/command_builder_config'
require_relative '../internal/underlying_builder'

module FluentCommandBuilder
  module Schtasks
    module V61
      VERSION = '6.1'
      @@config = CommandBuilderConfig.new FluentCommandBuilder::Schtasks::COMMAND_NAME, VERSION
      def configure_schtasks
        yield @@config
        @@config.validate_path
        @@config.validate_version
      end
      def schtasks
        b = UnderlyingBuilder.new @@config
        c = Schtasks.new(b)
        yield b if block_given?
        c
      end
      class Schtasks < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def create
          Create.new @b
        end
        def change
          Change.new @b
        end
        def run
          Run.new @b
        end
        def end
          End.new @b
        end
        def query
          Query.new @b
        end
        def delete
          Delete.new @b
        end
      end
      class Create < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' /create'
        end
        def schedule_type(schedule_type)
          @b.append " /sc #{@b.format schedule_type}"
          yield @b if block_given?
          self
        end
        def task_name(task_name)
          @b.append " /tn #{@b.format task_name}"
          yield @b if block_given?
          self
        end
        def task_run(task_run)
          @b.append " /tr #{@b.format task_run}"
          yield @b if block_given?
          self
        end
        def computer(computer, username=nil, password=nil)
          @b.append " /s #{@b.format computer}"
          @b.append " /u #{@b.format username}" unless username.nil?
          @b.append " /p #{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def run_as(username, password)
          @b.append " /ru #{@b.format username} /rp #{@b.format_password password}"
          yield @b if block_given?
          self
        end
        def modifier(modifier)
          @b.append " /mo #{@b.format modifier}"
          yield @b if block_given?
          self
        end
        def day(day)
          @b.append " /d #{@b.format day, ','}"
          yield @b if block_given?
          self
        end
        def month(month)
          @b.append " /m #{@b.format month, ','}"
          yield @b if block_given?
          self
        end
        def idle_time(idle_time)
          @b.append " /i #{@b.format idle_time}"
          yield @b if block_given?
          self
        end
        def start_time(start_time)
          @b.append " /st #{@b.format start_time}"
          yield @b if block_given?
          self
        end
        def repetition_interval(interval)
          @b.append " /ri #{@b.format interval}"
          yield @b if block_given?
          self
        end
        def end_time(end_time)
          @b.append " /et #{@b.format end_time}"
          yield @b if block_given?
          self
        end
        def duration(duration)
          @b.append " /du #{@b.format duration}"
          yield @b if block_given?
          self
        end
        def kill
          @b.append ' /k'
          yield @b if block_given?
          self
        end
        def start_date(start_date)
          @b.append " /sd #{@b.format start_date}"
          yield @b if block_given?
          self
        end
        def end_date(end_date)
          @b.append " /ed #{@b.format end_date}"
          yield @b if block_given?
          self
        end
        def run_only_when_logged_in
          @b.append ' /it'
          yield @b if block_given?
          self
        end
        def delete_upon_completion
          @b.append ' /z'
          yield @b if block_given?
          self
        end
        def force
          @b.append ' /f'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' /?'
          yield @b if block_given?
          self
        end
      end
      class Change < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' /change'
        end
        def task_name(task_name)
          @b.append " /tn #{@b.format task_name}"
          yield @b if block_given?
          self
        end
        def computer(computer, username=nil, password=nil)
          @b.append " /s #{@b.format computer}"
          @b.append " /u #{@b.format username}" unless username.nil?
          @b.append " /p #{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def run_as(username, password)
          @b.append " /ru #{@b.format username} /rp #{@b.format_password password}"
          yield @b if block_given?
          self
        end
        def task_run(task_run)
          @b.append " /tr #{@b.format task_run}"
          yield @b if block_given?
          self
        end
        def start_time(start_time)
          @b.append " /st #{@b.format start_time}"
          yield @b if block_given?
          self
        end
        def repetition_interval(interval)
          @b.append " /ri #{@b.format interval}"
          yield @b if block_given?
          self
        end
        def end_time(end_time)
          @b.append " /et #{@b.format end_time}"
          yield @b if block_given?
          self
        end
        def duration(duration)
          @b.append " /du #{@b.format duration}"
          yield @b if block_given?
          self
        end
        def kill
          @b.append ' /k'
          yield @b if block_given?
          self
        end
        def start_date(start_date)
          @b.append " /sd #{@b.format start_date}"
          yield @b if block_given?
          self
        end
        def end_date(end_date)
          @b.append " /ed #{@b.format end_date}"
          yield @b if block_given?
          self
        end
        def enable
          @b.append ' /enable'
          yield @b if block_given?
          self
        end
        def disable
          @b.append ' /disable'
          yield @b if block_given?
          self
        end
        def run_only_when_logged_in
          @b.append ' /it'
          yield @b if block_given?
          self
        end
        def delete_upon_completion
          @b.append ' /z'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' /?'
          yield @b if block_given?
          self
        end
      end
      class Run < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' /run'
        end
        def task_name(task_name)
          @b.append " /tn #{@b.format task_name}"
          yield @b if block_given?
          self
        end
        def computer(computer, username=nil, password=nil)
          @b.append " /s #{@b.format computer}"
          @b.append " /u #{@b.format username}" unless username.nil?
          @b.append " /p #{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def help
          @b.append ' /?'
          yield @b if block_given?
          self
        end
      end
      class End < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' /end'
        end
        def task_name(task_name)
          @b.append " /tn #{@b.format task_name}"
          yield @b if block_given?
          self
        end
        def computer(computer, username=nil, password=nil)
          @b.append " /s #{@b.format computer}"
          @b.append " /u #{@b.format username}" unless username.nil?
          @b.append " /p #{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def help
          @b.append ' /?'
          yield @b if block_given?
          self
        end
      end
      class Query < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' /query'
        end
        def format(format)
          @b.append " /fo #{@b.format format}"
          yield @b if block_given?
          self
        end
        def no_headings
          @b.append ' /nh'
          yield @b if block_given?
          self
        end
        def advanced_properties
          @b.append ' /v'
          yield @b if block_given?
          self
        end
        def computer(computer, username=nil, password=nil)
          @b.append " /s #{@b.format computer}"
          @b.append " /u #{@b.format username}" unless username.nil?
          @b.append " /p #{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def help
          @b.append ' /?'
          yield @b if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' /delete'
        end
        def task_name(task_name)
          @b.append " /tn #{@b.format task_name}"
          yield @b if block_given?
          self
        end
        def force
          @b.append ' /f'
          yield @b if block_given?
          self
        end
        def computer(computer, username=nil, password=nil)
          @b.append " /s #{@b.format computer}"
          @b.append " /u #{@b.format username}" unless username.nil?
          @b.append " /p #{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def help
          @b.append ' /?'
          yield @b if block_given?
          self
        end
      end

    end
  end
end