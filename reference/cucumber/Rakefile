task :default do
  version = cucumber_version
  puts "Generating reference documentation for cucumber #{version}..."
  output_dir = create_output_dir version
  generate_documentation output_dir
end

def cucumber_version
  version = `cucumber --version`
  version.match(/(\d+\.\d+)/)[1]
end

def create_output_dir(version)
  short_version =  version.gsub '.', ''
  output_dir = "cucumber_#{short_version}"
  rm_rf output_dir
  mkdir output_dir
  output_dir
end

def generate_documentation(output_dir)
  sh "cucumber --help > #{output_dir}/help.txt"
end

