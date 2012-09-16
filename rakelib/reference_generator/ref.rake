require_relative '../../lib/fluent_command_builder'
require_relative 'ref_task'

namespace :ref do

  ref_task AppCfgPython, 'appcfg_python' do |task_maker|
    output = `#{appcfg_python.to_s}`
    actions_text = output.match(/Action must be one of:\n(.+)Use 'help <action>' for a detailed description./m)[1]
    actions = actions_text.lines.map { |action| action.match(/  (.+?):/)[1] }
    actions.each do |action|
      appcfg_python.help(action).execute! { |b| b.append %Q[ > "#{task_maker.output_dir}/#{action}.txt"] }
    end
  end

  ref_task DevAppserverPython, 'dev_appserver_python'

  ref_task FluentCommandBuilder::Bundle, 'bundler'

  ref_task FluentCommandBuilder::Cucumber

  ref_task FluentCommandBuilder::Rake

  ref_task XCodeBuild

  ref_task AspnetCompiler

  ref_task InstallUtil

  ref_task MSBuild

  ref_task DotCover do |task_maker|
    output = `#{dotcover.to_s}`
    actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
    actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
    actions.each do |action|
      dotcover.help(action).execute! { |b| b.append %Q[ > "#{task_maker.output_dir}/#{action}.txt"] }
    end
  end

  ref_task MSTest

  ref_task MSDeploy

  ref_task SecurityOSX do |task_maker|
    output = `#{security.to_s}`
    actions_text = output.match(/security commands are:\n(.+)/m)[1]
    actions = actions_text.lines.map { |action| action.match(/    (.+?) /)[1] }
    actions.each do |action|
      security.help(action).execute! { |b| b.append %Q[ > "#{task_maker.output_dir}/#{action}.txt"] }
    end
  end

  ref_task TeamFoundationTEE, 'team_foundation_tee' do |task_maker|
    output = `#{team_foundation_tee.to_s}`
    actions_text = output.match(/Available commands and their options:\n(.+)Options accepted by most commands:/m)[1].rstrip
    actions = actions_text.lines.map { |action| action.match(/^  (.+?) /) { |m| m[1].strip == '' ? nil : m[1].strip  } }
    actions.compact!
    actions.uniq!
    actions.each do |action|
      team_foundation_tee.help(action).execute! { |b| b.append %Q[ > "#{task_maker.output_dir}/#{action}.txt"] }
    end
  end

  ref_task TeamFoundation, 'team_foundation' do |task_maker|
    output = `#{team_foundation.to_s}`
    actions_text = output.match(/Commands:\n(.+)/m)[1].rstrip
    puts actions_text
    actions = actions_text.lines.map { |action| action.match(/^tf (.+?) /) { |m| m[1].strip == '' ? nil : m[1].strip  } }
    actions.compact!
    actions.uniq!
    actions.each do |action|
      team_foundation.help(action).execute! { |b| b.append %Q[ > "#{task_maker.output_dir}/#{action}.txt"] }
    end
  end

end