require_relative 'task_maker'

class VisualStudioTaskMaker

  def self.make_task(command_name, command_args)
    programs_dir = `echo %PROGRAMFILES(X86)%`.strip.gsub('\\', '/')
    commands = Dir["#{programs_dir}/Microsoft Visual Studio */**/#{command_name}"]

    commands.each do |command|
      task_name = File.basename command_name, '.*'

      TaskMaker.make_task task_name, visual_studio_version(command) do |task_maker|
        puts `"#{command}" -version`
        system %Q["#{command}" #{command_args} > "#{task_maker.output_dir}/help.txt"]
      end
    end
  end

end