require_relative '../lib/fluent_command_builder'
require_relative '../lib/command_version_detector'; include FluentCommandBuilder
require_relative 'task_maker'

namespace :ref do

  TaskMaker.make_task2 AppCfgPython do |task_maker|
    command = 'appcfg.py'
    output = `#{command}`
    actions_text = output.match(/Action must be one of:\n(.+)Use 'help <action>' for a detailed description./m)[1]
    actions = actions_text.lines.map { |action| action.match(/  (.+?):/)[1] }
    actions.each { |action| system "#{command} help #{action} > '#{task_maker.output_dir}/#{action}.txt'" }
  end

  TaskMaker.make_task1 DevAppserverPython, '--help'

  TaskMaker.make_task1 FluentCommandBuilder::Bundle, '--help'


  TaskMaker.make_task3 Cucumber

  TaskMaker.make_task1 FluentCommandBuilder::Rake, '--help'

  TaskMaker.make_task 'xcodebuild', XCodeBuild.version do |task_maker|
    system "xcodebuild --help &> #{task_maker.output_dir}/help.txt"
  end

  TaskMaker.make_task1 AspnetCompiler, '/help'

  TaskMaker.make_task1 InstallUtil, '/help'

  TaskMaker.make_task1 MSBuild, '/help'

  TaskMaker.make_task2 DotCover do |task_maker|
    output = `dotcover help`
    actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
    actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
    actions.each { |action| system %Q[dotcover help #{action} > "#{task_maker.output_dir}/#{action}.txt"] }
  end

  TaskMaker.make_task1 MSTest, '/help'

  TaskMaker.make_task1 MSDeploy

  TaskMaker.make_task2 Security do |task_maker|
    command = 'security'
    output = `#{command}`
    actions_text = output.match(/security commands are:\n(.+)/m)[1]
    actions = actions_text.lines.map { |action| action.match(/    (.+?) /)[1] }
    actions.each { |action| system "#{command} help #{action} > '#{task_maker.output_dir}/#{action}.txt'" }
  end

end