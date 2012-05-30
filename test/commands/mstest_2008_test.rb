# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class MSTest2008Test < CommandTestBase

  def test_full_command
    expected = 'MSTest /testContainer:fileName /testMetadata:fileName /testList:testListPath /test:testName /noIsolation /runConfig:fileName /resultsFile:fileName /unique /detail:propertyId /help /noLogo /publish:serverName /publishResultsFile:fileName /publishBuild:buildId /teamProject:teamProjectName /platform:platform /flavor:flavor'
    actual = mstest_2008.test_container('fileName').test_metadata('fileName').test_list('testListPath').test('testName').no_isolation.run_config('fileName').results_file('fileName').unique.detail('propertyId').help.no_logo.publish('serverName').publish_results_file('fileName').publish_build('buildId').team_project('teamProjectName').platform('platform').flavor('flavor')
    assert_command expected, actual
  end

end