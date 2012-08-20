include Rake::DSL
require_relative '../lib/fluent_command_builder'; include FluentCommandBuilder

class TaskMaker

  def initialize(command_name, version)
    @command_name = command_name
    @version = version
  end

  def make_task
    return unless @version
    directory output_dir
    desc task_desc
    task command_name_with_version => [output_dir] do
      puts generating_message
      yield self
      puts 'Done.'
    end
  end

  def output_dir
    File.join @command_name, command_name_with_version
  end

  def self.make_task(mod)
    begin
      task_maker = TaskMaker.new mod::COMMAND_NAME.downcase, mod.version
      task_maker.make_task do |task_maker|
        if block_given?
          yield task_maker
        else
          c = mod.create
          c.help if c.respond_to? :help
          c.execute! { |b| b.append " > #{task_maker.output_dir}/help.txt" }
        end
      end
    rescue
      # do nothing
    end
  end

  private

  def major_version
    @version.match(/^(\d+)\.\d+/)[1]
  end

  def minor_version
    @version.match(/^\d+\.(\d+)/)[1]
  end

  def command_name_with_version
    @command_name + '_' + major_version + minor_version
  end

  def task_desc
    "Generate reference for #{@command_name} #{@version}."
  end

  def generating_message
    "#{task_desc}..".sub('Generate', 'Generating')
  end

end