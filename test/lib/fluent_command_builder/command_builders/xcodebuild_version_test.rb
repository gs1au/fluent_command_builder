require_relative '../../../version_test_base'

class XCodeBuildVersionTest < VersionTestBase

  def test_version_44
    assert_version FluentCommandBuilder::XCodeBuild, '4.4.1', "Xcode 4.4.1\nBuild version 4F1003"
  end

end