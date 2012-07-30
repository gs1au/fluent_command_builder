require_relative 'lib/app_engine'

namespace :ref do
  app_engine = AppEngine.new
  version = app_engine.major_version + app_engine.minor_version
  task_name = "dev_appserver_python_#{version}"
  output_dir = File.join 'reference/dev_appserver_python', task_name
  directory output_dir

  task task_name => [output_dir] do
    sh "/usr/local/bin/dev_appserver.py --help > #{output_dir}/help.txt"
  end
end