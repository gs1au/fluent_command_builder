require_relative 'app_engine'

def app_engine_task(command_name)

  command_name_without_extension = File.basename command_name, '.*'

  app_engine = AppEngine.new
  version = app_engine.major_version + app_engine.minor_version
  task_name = "#{command_name_without_extension}_#{version}"
  output_dir = File.join 'reference', command_name_without_extension, task_name
  directory output_dir

  task_desc = "Generate reference for #{command_name} #{app_engine.version}."
  desc task_desc

  task task_name => [output_dir] do
    print "#{task_desc}..".sub('Generate', 'Generating')
    yield output_dir
    puts ' done'
  end

end