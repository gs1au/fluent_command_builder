require 'rake'
require_relative 'framework'
require_relative 'framework_command'

def dot_net_task(command_name)

  command_name_without_extension = File.basename command_name, '.*'
  tasks = []

  DotNet::Framework.installations.each do |dot_net_framework|
    command = DotNet::FrameworkCommand.new dot_net_framework, command_name
    next unless command.exists?

    version = dot_net_framework.major_version + dot_net_framework.minor_version
    task_name = "#{command_name_without_extension}_#{version}"
    tasks << task_name
    output_dir = File.expand_path File.join(command_name_without_extension, task_name)
    directory output_dir

    task_desc = "Generate reference for #{command.command_name} #{dot_net_framework.version}."
    desc task_desc

    task task_name => [output_dir] do
      print "#{task_desc}..".sub('Generate', 'Generating')
      command.execute %Q[-? > "#{output_dir}/help.txt"]
      puts ' done'
    end
  end

  desc "Generate reference for all versions of #{command_name}."
  task command_name_without_extension => tasks

end