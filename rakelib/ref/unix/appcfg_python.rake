require_relative 'lib/app_engine_task_generator'

namespace :ref do
  app_engine_task 'appcfg.py' do |output_dir|
    output = `/usr/local/bin/appcfg.py`
    actions_text = output.match(/Action must be one of:\n(.+)Use 'help <action>' for a detailed description./m)[1]
    actions = actions_text.lines.map { |action| action.match(/  (.+?):/)[1] }
    actions.each { |action| sh "/usr/local/bin/appcfg.py help #{action} > '#{output_dir}/#{action}.txt'" }
  end
end

#require_relative 'lib/app_engine'
#
#namespace :ref do
#  app_engine = AppEngine.new
#  version = app_engine.major_version + app_engine.minor_version
#  task_name = "appcfg_python_#{version}"
#  output_dir = File.join 'reference/appcfg_python', task_name
#  directory output_dir
#
#  task task_name => [output_dir] do
#    output = `/usr/local/bin/appcfg.py`
#    actions_text = output.match(/Action must be one of:\n(.+)Use 'help <action>' for a detailed description./m)[1]
#    actions = actions_text.lines.map { |action| action.match(/  (.+?):/)[1] }
#    actions.each { |action| sh "/usr/local/bin/appcfg.py help #{action} > '#{output_dir}/#{action}.txt'" }
#  end
#end