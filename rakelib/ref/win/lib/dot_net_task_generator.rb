require_relative 'dot_net_framework'
require_relative 'dot_net_framework_command'

def dot_net_task(command_name, command_args)

  command_name_without_extension = File.basename command_name, '.*'
  tasks = []

  DotNetFramework.installations.each do |dot_net_framework|
    command = DotNetFrameworkCommand.new dot_net_framework, command_name
    next unless command.exists?

    version = dot_net_framework.major_version + dot_net_framework.minor_version
    task_name = "#{command_name_without_extension}_#{version}"
    tasks << task_name
    output_dir = File.expand_path File.join('reference', command_name_without_extension, task_name)
    directory output_dir

    task_desc = "Generate reference for #{command.command_name} #{dot_net_framework.version}."
    desc task_desc

    task task_name => [output_dir] do
      print "#{task_desc}..".sub('Generate', 'Generating')
      command.execute %Q[#{command_args} > "#{output_dir}/help.txt"]
      puts ' done'
    end
  end

  desc "Generate reference for all versions of #{command_name}."
  task command_name_without_extension => tasks

end