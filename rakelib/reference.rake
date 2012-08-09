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

  TaskMaker.make_task3 DevAppserverPython

  TaskMaker.make_task3 FluentCommandBuilder::Bundle


  TaskMaker.make_task3 Cucumber

  TaskMaker.make_task3 FluentCommandBuilder::Rake

  TaskMaker.make_task3 XCodeBuild

  TaskMaker.make_task3 AspnetCompiler

  TaskMaker.make_task3 InstallUtil

  TaskMaker.make_task3 MSBuild

  TaskMaker.make_task2 DotCover do |task_maker|
    output = `dotcover help`
    actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
    actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
    actions.each { |action| system %Q[dotcover help #{action} > "#{task_maker.output_dir}/#{action}.txt"] }
  end

  TaskMaker.make_task3 MSTest

  TaskMaker.make_task1 MSDeploy

  TaskMaker.make_task2 Security do |task_maker|
    command = 'security'
    output = `#{command}`
    actions_text = output.match(/security commands are:\n(.+)/m)[1]
    actions = actions_text.lines.map { |action| action.match(/    (.+?) /)[1] }
    actions.each { |action| system "#{command} help #{action} > '#{task_maker.output_dir}/#{action}.txt'" }
  end

end