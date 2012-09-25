require_relative '../../../version_test_base'

class RakeVersionTest < VersionTestBase

  def test_version_09
    assert_version FluentCommandBuilder::Rake, '0.9.2.2', 'rake, version 0.9.2.2'
  end

end