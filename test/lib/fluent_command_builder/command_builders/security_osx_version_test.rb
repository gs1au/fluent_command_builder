require_relative '../../../version_test_base'

class SecurityOsxVersionTest < VersionTestBase

  def test_version_108
    assert_version FluentCommandBuilder::SecurityOSX, '10.8', '10.8'
  end

end