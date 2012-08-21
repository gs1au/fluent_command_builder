require_relative '../lib/fluent_command_builder'
require_relative 'task_maker'

namespace :ref do

  TaskMaker.make_task AppCfgPython do |task_maker|
    output = `#{appcfg_python.to_s}`
    actions_text = output.match(/Action must be one of:\n(.+)Use 'help <action>' for a detailed description./m)[1]
    actions = actions_text.lines.map { |action| action.match(/  (.+?):/)[1] }
    actions.each do |action|
      appcfg_python.help(action).execute! { |b| b.append %Q[ > "#{task_maker.output_dir}/#{action}.txt"] }
    end
  end

  TaskMaker.make_task DevAppserverPython

  TaskMaker.make_task FluentCommandBuilder::Bundle

  TaskMaker.make_task FluentCommandBuilder::Cucumber

  TaskMaker.make_task FluentCommandBuilder::Rake

  TaskMaker.make_task XCodeBuild

  TaskMaker.make_task AspnetCompiler

  TaskMaker.make_task InstallUtil

  TaskMaker.make_task MSBuild

  TaskMaker.make_task DotCover do |task_maker|
    output = `#{dotcover.to_s}`
    actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
    actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
    actions.each do |action|
      dotcover.help(action).execute! { |b| b.append %Q[ > "#{task_maker.output_dir}/#{action}.txt"] }
    end
  end

  TaskMaker.make_task MSTest

  TaskMaker.make_task MSDeploy

  TaskMaker.make_task SecurityOSX do |task_maker|
    output = `#{security.to_s}`
    actions_text = output.match(/security commands are:\n(.+)/m)[1]
    actions = actions_text.lines.map { |action| action.match(/    (.+?) /)[1] }
    actions.each do |action|
      security.help(action).execute! { |b| b.append %Q[ > "#{task_maker.output_dir}/#{action}.txt"] }
    end
  end

  TaskMaker.make_task TeamFoundationTEE do |task_maker|
    output = `#{team_foundation_tee.to_s}`
    actions_text = output.match(/Available commands and their options:\n(.+)Options accepted by most commands:/m)[1].rstrip
    puts actions_text
    actions = actions_text.lines.map { |action| action.match(/^  (.+?) /) { |m| m[1].strip == '' ? nil : m[1].strip  } }
    actions.compact!
    actions.uniq!
    actions.each do |action|
      team_foundation_tee.help(action).execute! { |b| b.append %Q[ > "#{task_maker.output_dir}/#{action}.txt"] }
    end
  end

end