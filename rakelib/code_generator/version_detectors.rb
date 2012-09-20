def standard_version_detector(command_arg=nil, command_name='COMMAND_NAME')
  s = "StandardVersionDetector.new #{command_name}"
  s += ", '#{command_arg}'" if command_arg
  s
end

def version_detector_line(module_name)
  case module_name.to_sym
    when :AppCfgPython
      %Q[AppEnginePythonVersionDetector.new COMMAND_NAME]
    when :AspnetCompiler
      standard_version_detector '/version', "'MSBuild'"
    when :Bundle
      standard_version_detector '--version'
    when :Cucumber
      standard_version_detector '--version'
    when :DevAppserverPython
      %Q[AppEnginePythonVersionDetector.new COMMAND_NAME]
    when :DotCover
      standard_version_detector 'version'
    when :FastLinkChecker
      standard_version_detector
    when :InstallUtil
      standard_version_detector
    when :MSBuild
      standard_version_detector '/version'
    when :MSDeploy
      standard_version_detector
    when :MSTest
      standard_version_detector '/help'
    when :Netsh
      'WindowsVersionDetector.new'
    when :NuGet
      standard_version_detector
    when :NUnit
      standard_version_detector '/help'
    when :Rake
      standard_version_detector '--version'
    when :SecurityOSX
      'OsxVersionDetector.new'
    when :SevenZip
      standard_version_detector
    when :TeamFoundation
      standard_version_detector
    when :TeamFoundationTEE
      standard_version_detector
    when :XCodeBuild
      standard_version_detector '-version'
    else
      'DefaultVersionDetector.new COMMAND_NAME'
  end
end