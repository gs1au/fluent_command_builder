require_relative 'lib/app_engine'
require_relative '../task_maker'

TaskMaker.make_task 'dev_appserver_python', AppEngine.version do |task_maker|
  system "/usr/local/bin/dev_appserver.py --help > #{task_maker.output_dir}/help.txt"
end