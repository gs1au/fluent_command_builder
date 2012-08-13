# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class MSTest100Test < CommandTestBase

  def test_full_command
    expected = 'MSTest /testContainer:fileName /testMetadata:fileName /testList:testListPath /category:testCategoryFilter /test:testName /noIsolation /testSettings:fileName /runConfig:fileName /resultsFile:fileName /unique /detail:propertyId /help /noLogo /useStdErr /publish:serverName /publishResultsFile:fileName /publishBuild:buildId /teamProject:teamProjectName /platform:platform /flavor:flavor'
    actual = mstest_100.test_container('fileName').test_metadata('fileName').test_list('testListPath').category('testCategoryFilter').test('testName').no_isolation.test_settings('fileName').run_config('fileName').results_file('fileName').unique.detail('propertyId').help.no_logo.use_std_err.publish('serverName').publish_results_file('fileName').publish_build('buildId').team_project('teamProjectName').platform('platform').flavor('flavor')
    assert_command expected, actual
  end
  
end