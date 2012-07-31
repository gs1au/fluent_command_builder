require_relative 'lib/app_engine'
require_relative '../task_maker'

TaskMaker.make_task 'appcfg_python', AppEngine.version do |task_maker|
  command = '/usr/local/bin/appcfg.py'
  output = `#{command}`
  actions_text = output.match(/Action must be one of:\n(.+)Use 'help <action>' for a detailed description./m)[1]
  actions = actions_text.lines.map { |action| action.match(/  (.+?):/)[1] }
  actions.each { |action| system "#{command} help #{action} > '#{task_maker.output_dir}/#{action}.txt'" }
end