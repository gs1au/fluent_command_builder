require_relative 'lib/dot_net_task_generator'

namespace :ref do
  dot_net_task 'aspnet_compiler.exe', '-?'
end