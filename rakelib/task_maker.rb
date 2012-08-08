include Rake::DSL

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
    File.join 'reference', @command_name, command_name_with_version
  end

  def self.make_task(command_name, version, &block)
    task_maker = TaskMaker.new command_name, version
    task_maker.make_task &block
  end

  def self.make_task1(mod, args='')
    self.make_task mod::COMMAND_NAME.downcase, mod.version do |task_maker|
      system "#{mod::COMMAND_NAME} #{args} > #{task_maker.output_dir}/help.txt"
    end
  end

  def self.make_task2(mod, &block)
    self.make_task mod::COMMAND_NAME.downcase, mod.version, &block
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