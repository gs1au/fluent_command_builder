require_relative '../lib/command_version_detector'; include FluentCommandBuilder
require_relative 'task_maker'

TaskMaker.make_task 'appcfg_python', AppCfgPython.version do |task_maker|
  command = '/usr/local/bin/appcfg.py'
  output = `#{command}`
  actions_text = output.match(/Action must be one of:\n(.+)Use 'help <action>' for a detailed description./m)[1]
  actions = actions_text.lines.map { |action| action.match(/  (.+?):/)[1] }
  actions.each { |action| system "#{command} help #{action} > '#{task_maker.output_dir}/#{action}.txt'" }
end

TaskMaker.make_task 'dev_appserver_python', DevAppserverPython.version do |task_maker|
  system "/usr/local/bin/dev_appserver.py --help > #{task_maker.output_dir}/help.txt"
end

TaskMaker.make_task 'bundler', FluentCommandBuilder::Bundler.version do |task_maker|
  system "bundle --help #{task_maker.output_dir}/help.txt"
end

TaskMaker.make_task 'cucumber', Cucumber.version do |task_maker|
  system "cucumber --help > #{task_maker.output_dir}/help.txt"
end

TaskMaker.make_task 'rake', FluentCommandBuilder::Rake.version do |task_maker|
  system "rake --help > #{task_maker.output_dir}/help.txt"
end

TaskMaker.make_task 'xcodebuild', XCodeBuild.version do |task_maker|
  puts 1
  system "xcodebuild --help &> #{task_maker.output_dir}/help.txt"
end

#TaskMaker.make_task 'security_osx', SecurityOsx.version do |task_maker|
#  command = 'security'
#  output = `#{command}`
#  actions_text = output.match(/security commands are:\n(.+)/m)[1]
#  actions = actions_text.lines.map { |action| action.match(/    (.+?) /)[1] }
#  actions.each { |action| system "#{command} help #{action} > '#{task_maker.output_dir}/#{action}.txt'" }
#end

TaskMaker.make_task 'aspnet_compiler', AspnetCompiler.version do |task_maker|
  system %Q[aspnet_compiler /help > "#{task_maker.output_dir}/help.txt"]
end

TaskMaker.make_task 'installutil', InstallUtil.version do |task_maker|
  system %Q[installutil /help > "#{task_maker.output_dir}/help.txt"]
end

TaskMaker.make_task 'msbuild', MSBuild.version do |task_maker|
  system %Q[msbuild /help > "#{task_maker.output_dir}/help.txt"]
end

TaskMaker.make_task 'dotcover', DotCover.version do |task_maker|
  output = `dotcover help`
  actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
  actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
  actions.each { |action| system %Q[dotcover help #{action} > "#{task_maker.output_dir}/#{action}.txt"] }
end

TaskMaker.make_task 'mstest', MSTest.version do |task_maker|
  system %Q[mstest /help > "#{task_maker.output_dir}/help.txt"]
end

TaskMaker.make_task 'msdeploy', MSDeploy.version do |task_maker|
  system %Q[msdeploy > "#{task_maker.output_dir}/help.txt"]
end

TaskMaker.make_task 'nuget', NuGet.version do |task_maker|
  output = `nuget`
  actions_text = output.match(/Available commands:\n(.+)/m)[1]
  actions = actions_text.lines.map { |l| l.match(/^ (\w+)/) { |m| m[1] } }
  actions.compact.each { |action| system %Q[nuget help #{action} > "#{task_maker.output_dir}/#{action}.txt"] }
end