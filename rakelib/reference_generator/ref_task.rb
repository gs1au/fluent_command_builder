include Rake::DSL
require_relative '../../lib/fluent_command_builder'; include FluentCommandBuilder

def ref_task(mod, command_alias=nil)
  begin
    task_maker = TaskMaker.new mod::COMMAND_NAME.downcase, mod.version, command_alias
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

class TaskMaker

  def initialize(command_name, version, command_alias=nil)
    @command_name = command_name
    @version = version
    @command_alias = command_alias || command_name
  end

  def make_task
    return unless @version
    directory output_dir
    desc task_desc
    task task_name => [output_dir] do
      puts generating_message
      yield self
      puts 'Done.'
    end
  end

  def output_dir
    File.join 'reference', @command_alias, task_name
  end

  private

  def major_version
    @version.match(/^(\d+)\.\d+/)[1]
  end

  def minor_version
    @version.match(/^\d+\.(\d+)/)[1]
  end

  def task_name
    @command_alias + '_' + major_version + minor_version
  end

  def command_name_with_version
    @command_name + '_' + major_version + minor_version
  end

  def task_desc
    "Generate reference for #{@command_alias} #{@version}."
  end

  def generating_message
    "#{task_desc}..".sub('Generate', 'Generating')
  end

end