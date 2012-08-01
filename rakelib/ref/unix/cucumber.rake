require_relative '../task_maker'

TaskMaker.make_task 'cucumber', `cucumber --version` do |task_maker|
  system "cucumber --help > #{task_maker.output_dir}/help.txt"
end