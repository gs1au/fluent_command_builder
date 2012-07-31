def dotcover_version
  output = `dotcover version`
  output.match(/v(\d+\.\d+)/)[1]
end

version = dotcover_version.gsub '.', ''
task_name = "dotcover_#{version}"
output_dir = File.join '../../../reference/dotcover', task_name
directory output_dir

desc "Generate reference for dotcover.exe #{dotcover_version}."
task task_name => [output_dir] do
  output = `dotcover help`
  actions_text = output.match(/Available commands:\n(.+)/m)[1].strip
  actions = actions_text.lines.map { |action| action.strip.match(/(.+?) /)[1] }
  actions.each { |action| sh %Q[dotcover help #{action} > "#{output_dir}/#{action}.txt"] }
end