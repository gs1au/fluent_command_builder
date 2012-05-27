require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder

class XCodeBuild43Test < Test::Unit::TestCase

  def test_build_project_full_command
    expected = 'xcodebuild action1 action2 -project project -target target -configuration configuration -sdk sdk key=value -userdefault=value'
    actual = xcodebuild_43.build_project(['action1', 'action2']).project('project').target('target').configuration('configuration').sdk('sdk').setting('key', 'value').user_default('value').to_s
    assert_equal expected, actual
  end

  def test_build_project_build_action_is_optional
    expected = 'xcodebuild'
    actual = xcodebuild_43.build_project.to_s
    assert_equal expected, actual
  end

  def test_build_workspace_full_command
    expected = 'xcodebuild -workspace workspace action1 action2 -scheme scheme -configuration configuration -sdk sdk key=value -userdefault=value'
    actual = xcodebuild_43.build_workspace('workspace', ['action1', 'action2']).scheme('scheme').configuration('configuration').sdk('sdk').setting('key', 'value').user_default('value').to_s
    assert_equal expected, actual
  end

  def test_build_workspace_build_action_is_optional
    expected = 'xcodebuild -workspace workspace'
    actual = xcodebuild_43.build_workspace('workspace').to_s
    assert_equal expected, actual
  end

  def test_version_full_command
    expected = 'xcodebuild -version -sdk sdk infoItem'
    actual = xcodebuild_43.version.sdk('sdk').info_item('infoItem').to_s
    assert_equal expected, actual
  end

  def test_showsdks_full_command
    expected = 'xcodebuild -showsdks'
    actual = xcodebuild_43.showsdks.to_s
    assert_equal expected, actual
  end

  def test_list_full_command
    expected = 'xcodebuild -list'
    actual = xcodebuild_43.list.to_s
    assert_equal expected, actual
  end

  def test_list_project_full_command
    expected = 'xcodebuild -list -project project'
    actual = xcodebuild_43.list_project('project').to_s
    assert_equal expected, actual
  end

  def test_list_workspace_full_command
    expected = 'xcodebuild -list -workspace workspace'
    actual = xcodebuild_43.list_workspace('workspace').to_s
    assert_equal expected, actual
  end

end