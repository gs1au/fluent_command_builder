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

TaskMaker.make_task 'cucumber', cucumber_version do |task_maker|
  system "cucumber --help > #{task_maker.output_dir}/help.txt"
end