require_relative '../../lib/fluent_command_builder'
require_relative 'ref_task'

namespace :ref do

  ref_task 'appcfg_python', AppCfgPython.version do |t|
    output = `appcfg.py --help`
    actions_text = output.match(/Action must be one of:\n(.+)Use 'help <action>' for a detailed description./m)[1]
    actions = actions_text.lines.map { |action| action.match(/  (.+?):/)[1] }
    actions.each { |action| t.execute "appcfg.py --help #{action}", action }
  end

  ref_task 'dev_appserver_python', DevAppserverPython.version do |t|
    t.execute 'dev_appserver.py'
  end

  ref_task 'bundler', FluentCommandBuilder::Bundle.version do |t|
    t.execute 'bundle --help'
  end

  ref_task 'cucumber', FluentCommandBuilder::Cucumber.version do |t|
    t.execute 'cucumber --help'
  end

  ref_task 'rake', FluentCommandBuilder::Rake.version do |t|
    t.execute 'rake --help'
  end

  ref_task 'xcodebuild', XCodeBuild.version do |t|
    t.execute 'xcodebuild -help'
  end

  ref_task 'aspnet_compiler', AspnetCompiler.version do |t|
    t.execute 'aspnet_compiler'
  end

  ref_task 'installutil', InstallUtil.version do |t|
    t.execute 'installutil'
  end

  ref_task 'msbuild', MSBuild.version do |t|
    t.execute 'msbuild /help'
  end

  ref_task 'dotcover', DotCover.version do |t|
    output = `dotcover help`
    actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
    actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
    actions.each { |action| t.execute "dotcover help #{action}", action }
  end

  ref_task 'mstest', MSTest.version do |t|
    t.execute 'mstest /help'
  end

  ref_task 'msdeploy', MSDeploy.version do |t|
    t.execute 'msdeploy /help'
  end

  ref_task 'nuget', NuGet.version do |t|
    output = `nuget`
    actions_text = output.match(/Available commands:\n(.+)/m)[1]
    matches = actions_text.lines.map { |action| action.match(/^ (.+?) /) }.compact
    actions = matches.map { |m| m[1].strip == '' ? nil : m[1] }.compact
    actions.each { |action| t.execute "nuget help #{action}", action }
  end

  ref_task 'security_osx', SecurityOSX.version do |t|
    output = `security help`
    actions_text = output.match(/security commands are:\n(.+)/m)[1]
    actions = actions_text.lines.map { |action| action.match(/    (.+?) /)[1] }
    actions.each { |action| t.execute "security help #{action}", action }
  end

  ref_task 'team_foundation_tee', TeamFoundationTEE.version do |t|
    output = `tf -help`
    actions_text = output.match(/Available commands and their options:\n(.+)Options accepted by most commands:/m)[1].rstrip
    actions = actions_text.lines.map { |action| action.match(/^  (.+?) /) { |m| m[1].strip == '' ? nil : m[1].strip } }
    actions.compact!
    actions.uniq!
    actions.each { |action| t.execute "tf -help #{action}", action }
  end

  ref_task 'team_foundation', TeamFoundation.version do |t|
    output = `tf /help`
    actions_text = output.match(/Commands:\n(.+)/m)[1].rstrip
    actions = actions_text.lines.map { |action| action.match(/^tf (.+?) /) { |m| m[1].strip == '' ? nil : m[1].strip } }
    actions.compact!
    actions.uniq!
    actions.each { |action| t.execute "tf /help #{action}", action }
  end

end