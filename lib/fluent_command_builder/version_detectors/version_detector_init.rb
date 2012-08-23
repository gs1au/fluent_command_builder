#require File.expand_path(File.dirname(__FILE__) + '/appengine_python_version_detector')
#require File.expand_path(File.dirname(__FILE__) + '/default_version_detector')
#
#module FluentCommandBuilder
#  AppCfgPython.version_detector = AppEnginePythonVersionDetector.new AppCfgPython::COMMAND_NAME
#  AspnetCompiler.version_detector = MSBuild.version_detector
#  Bundle.version_detector.args = '--version'
#  Cucumber.version_detector.args = '--version'
#  DevAppserverPython.version_detector = AppEnginePythonVersionDetector.new DevAppserverPython::COMMAND_NAME
#  DotCover.version_detector.args = 'version'
#  InstallUtil.version_detector.args = nil
#  MSBuild.version_detector.args = '/version'
#  MSDeploy.version_detector.args = nil
#  MSTest.version_detector.args = '/help'
#  NuGet.version_detector.args = nil
#  NUnit.version_detector.args = '/help'
#  Rake.version_detector.args = '--version'
#  SecurityOSX.version_detector = DefaultVersionDetector.new 'sw_vers', '-productVersion'
#  SevenZip.version_detector.args = nil
#  TeamFoundation.version_detector.args = nil
#  TeamFoundationTEE.version_detector.args = nil
#  XCodeBuild.version_detector.args = '-version'
#end
#
