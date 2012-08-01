require_relative 'task_maker'

class DotNetTaskMaker

  def self.make_task(command_name, command_args)
    win_dir = `echo %WINDIR%`.strip.gsub('\\', '/')
    commands = Dir["#{win_dir}/Microsoft.Net/Framework/v*/#{command_name}"]

    commands.each do |command|
      task_name = File.basename command_name, '.*'

      TaskMaker.make_task task_name, dot_net_version(command) do |task_maker|
        system %Q["#{command}" #{command_args} > "#{task_maker.output_dir}/help.txt"]
      end
    end
  end

end