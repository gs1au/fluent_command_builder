# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class NuGet20Test < CommandTestBase
  include FluentCommandBuilder::NuGet::V20

  def test_config_command
    expected = 'NuGet config -Set name=value -Help'
    actual = nuget.config.set('name', 'value').help
    assert_command expected, actual
  end

  def test_delete_command
    expected = 'NuGet delete packageId packageVersion -Source source -NoPrompt -ApiKey apiKey -Help'
    actual = nuget.delete('packageId', 'packageVersion').source('source').no_prompt.api_key('apiKey').help
    assert_command expected, actual
  end

  def test_help_command
    expected = 'NuGet help command -All -Markdown -Help'
    actual = nuget.help('command').all.markdown.help
    assert_command expected, actual
  end

  def test_install_command
    expected = 'NuGet install packageId -Source source -OutputDirectory outputDirectory -Version version -ExcludeVersion -Prerelease -NoCache -Help'
    actual = nuget.install('packageId').source('source').output_directory('outputDirectory').version('version').exclude_version.prerelease.no_cache.help
    assert_command expected, actual
  end

  def test_list_command
    expected = 'NuGet list searchTerms -Source source -Verbose -AllVersions -Prerelease -Help'
    actual = nuget.list('searchTerms').source('source').verbose.all_versions.prerelease.help
    assert_command expected, actual
  end

  def test_pack_command
    expected = 'NuGet pack nuspec -OutputDirectory outputDirectory -BasePath basePath -Verbose -Version version -Exclude pattern -Symbols -Tool -Build -NoDefaultExcludes -NoPackageAnalysis -ExcludeEmptyDirectories -Properties prop1;prop2 -Help'
    actual = nuget.pack('nuspec').output_directory('outputDirectory').base_path('basePath').verbose.version('version').exclude('pattern').symbols.tool.build.no_default_excludes.no_package_analysis.exclude_empty_directories.properties(%w(prop1 prop2)).help
    assert_command expected, actual
  end

  def test_publish_command
    expected = 'NuGet publish packageId packageVersion apiKey -Source source -Help'
    actual = nuget.publish('packageId', 'packageVersion', 'apiKey').source('source').help
    assert_command expected, actual
  end

  def test_push_command
    expected = 'NuGet push packagePath -CreateOnly -Source source -ApiKey apiKey -Timeout timeout -Help'
    actual = nuget.push('packagePath').create_only.source('source').api_key('apiKey').timeout('timeout').help
    assert_command expected, actual
  end

  def test_set_api_key_command
    expected = 'NuGet setApiKey apiKey -Source source -Help'
    actual = nuget.set_api_key('apiKey').source('source').help
    assert_command expected, actual
  end

  def test_sources_command
    expected = 'NuGet sources action -Name name -Source source -UserName userName -Password password -Help'
    actual = nuget.sources('action').name('name').source('source').user_name('userName').password('password').help
    assert_command expected, actual
  end

  def test_spec_command
    expected = 'NuGet spec packageId -AssemblyPath assemblyPath -Force -Help'
    actual = nuget.spec('packageId').assembly_path('assemblyPath').force.help
    assert_command expected, actual
  end

  def test_update_command
    expected = 'NuGet update packagesConfig -Source source -Id packageId -RepositoryPath repositoryPath -Safe -Verbose -Prerelease -Help'
    actual = nuget.update('packagesConfig').source('source').id('packageId').repository_path('repositoryPath').safe.verbose.prerelease.help
    assert_command expected, actual
  end

end