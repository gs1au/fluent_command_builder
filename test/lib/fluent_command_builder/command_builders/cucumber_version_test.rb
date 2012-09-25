require_relative '../../../version_test_base'

class CucumberVersionTest < VersionTestBase

  def test_version_12
    assert_version FluentCommandBuilder::Cucumber, '1.2.0', '1.2.0'
  end

end