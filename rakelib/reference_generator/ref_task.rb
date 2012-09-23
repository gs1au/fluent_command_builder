include Rake::DSL
require_relative '../../lib/fluent_command_builder'; include FluentCommandBuilder

def ref_task(command_alias, version)
  return unless version
  task_maker = TaskMaker.new command_alias, version
  task_maker.make_task do |t|
    yield t
  end
end

class TaskMaker

  def initialize(command_alias, version)
    @command_alias = command_alias
    @version = Version.new version
  end

  def make_task
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

  def execute(command, output_file_name='help')
    system %Q[#{command} > "#{output_dir}/#{output_file_name}.txt" 2>&1]
  end

  private

  def task_name
    @command_alias + '_' + @version.compact
  end

  def task_desc
    "Generate reference for #{@command_alias} #{@version.first 2}."
  end

  def generating_message
    "#{task_desc}..".sub('Generate', 'Generating')
  end

end