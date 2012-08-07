require_relative 'task_maker'
require_relative 'dot_net_task_maker'
require_relative 'visual_studio_task_maker'

DotNetTaskMaker.make_task 'aspnet_compiler.exe', '-?'
DotNetTaskMaker.make_task 'installutil.exe', '/help'
DotNetTaskMaker.make_task 'msbuild.exe', '/help'

TaskMaker.make_task 'dotcover', DotCover.version do |task_maker|
  output = `dotcover help`
  actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
  actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
  actions.each { |action| system %Q[dotcover help #{action} > "#{task_maker.output_dir}/#{action}.txt"] }
end

VisualStudioTaskMaker.make_task 'mstest.exe', '/help'

TaskMaker.make_task 'msdeploy', MSDeploy.version do |task_maker|
  system %Q["%PROGRAMFILES%/IIS/Microsoft Web Deploy/msdeploy" > "#{task_maker.output_dir}/help.txt"]
end

TaskMaker.make_task 'nuget', NuGet.version do |task_maker|
  output = `nuget`
  actions_text = output.match(/Available commands:\n(.+)/m)[1]
  actions = actions_text.lines.map { |l| l.match(/^ (\w+)/) { |m| m[1] } }
  actions.compact.each { |action| system %Q[nuget help #{action} > "#{task_maker.output_dir}/#{action}.txt"] }
end