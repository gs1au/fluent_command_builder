require_relative 'task_maker'
require_relative 'dot_net_task_maker'

DotNetTaskMaker.make_task 'aspnet_compiler.exe', '-?'
DotNetTaskMaker.make_task 'installutil.exe', '/help'
DotNetTaskMaker.make_task 'msbuild.exe', '/help'

TaskMaker.make_task 'dotcover', dotcover_version do |task_maker|
  output = `dotcover help`
  actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
  actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
  actions.each { |action| system %Q[dotcover help #{action} > "#{task_maker.output_dir}/#{action}.txt"] }
end