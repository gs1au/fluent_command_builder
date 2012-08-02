require_relative 'task_maker'

TaskMaker.make_task 'appcfg_python', appengine_version do |task_maker|
  command = '/usr/local/bin/appcfg.py'
  output = `#{command}`
  actions_text = output.match(/Action must be one of:\n(.+)Use 'help <action>' for a detailed description./m)[1]
  actions = actions_text.lines.map { |action| action.match(/  (.+?):/)[1] }
  actions.each { |action| system "#{command} help #{action} > '#{task_maker.output_dir}/#{action}.txt'" }
end

TaskMaker.make_task 'dev_appserver_python', appengine_version do |task_maker|
  system "/usr/local/bin/dev_appserver.py --help > #{task_maker.output_dir}/help.txt"
end

TaskMaker.make_task 'bundler', bundler_version do |task_maker|
  system "bundle --help #{task_maker.output_dir}/help.txt"
end

TaskMaker.make_task 'cucumber', cucumber_version do |task_maker|
  system "cucumber --help > #{task_maker.output_dir}/help.txt"
end

TaskMaker.make_task 'rake', rake_version do |task_maker|
  system "rake --help > #{task_maker.output_dir}/help.txt"
end

TaskMaker.make_task 'xcodebuild', xcodebuild_version do |task_maker|
  system "xcodebuild --help &> #{task_maker.output_dir}/help.txt"
end

TaskMaker.make_task 'security_osx', osx_version do |task_maker|
  command = 'security'
  output = `#{command}`
  actions_text = output.match(/security commands are:\n(.+)/m)[1]
  actions = actions_text.lines.map { |action| action.match(/    (.+?) /)[1] }
  actions.each { |action| system "#{command} help #{action} > '#{task_maker.output_dir}/#{action}.txt'" }
end