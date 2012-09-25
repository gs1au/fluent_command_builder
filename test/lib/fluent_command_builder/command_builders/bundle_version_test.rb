require_relative '../../../version_test_base'

class BundleVersionTest < VersionTestBase

  def test_version_11
    assert_version FluentCommandBuilder::Bundle, '1.1.4', 'Bundler version 1.1.4'
  end

end