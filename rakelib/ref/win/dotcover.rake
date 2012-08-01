require_relative '../task_maker'

TaskMaker.make_task 'dotcover', `dotcover version`.match(/v(\d+\.\d+.\d+\.\d+)/)[1] do |task_maker|
  output = `dotcover help`
  actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
  actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
  actions.each { |action| system %Q[dotcover help #{action} > "#{task_maker.output_dir}/#{action}.txt"] }
end