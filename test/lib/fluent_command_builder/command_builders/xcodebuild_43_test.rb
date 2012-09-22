# Note: Tests do not represent valid command line usage.

require_relative '../../../command_test_base'

class XCodeBuild43Test < CommandTestBase
  include FluentCommandBuilder::XCodeBuild::V43

  def test_build_project_full_command
    expected = 'xcodebuild action1 action2 -project project -target target -configuration configuration -sdk sdk key=value action1 action2'
    actual = xcodebuild.build_project(%w(action1 action2)).project('project').target('target').configuration('configuration').sdk('sdk').setting('key', 'value').build_action(%w(action1 action2))
    assert_command expected, actual
  end

  def test_build_project_build_action_is_optional
    expected = 'xcodebuild'
    actual = xcodebuild.build_project
    assert_command expected, actual
  end

  def test_build_workspace_full_command
    expected = 'xcodebuild -workspace workspace action1 action2 -scheme scheme -configuration configuration -sdk sdk key=value action1 action2'
    actual = xcodebuild.build_workspace('workspace', %w(action1 action2)).scheme('scheme').configuration('configuration').sdk('sdk').setting('key', 'value').build_action(%w(action1 action2))
    assert_command expected, actual
  end

  def test_build_workspace_build_action_is_optional
    expected = 'xcodebuild -workspace workspace'
    actual = xcodebuild.build_workspace('workspace')
    assert_command expected, actual
  end

  def test_version_full_command
    expected = 'xcodebuild -version -sdk sdk infoItem'
    actual = xcodebuild.version.sdk('sdk').info_item('infoItem')
    assert_command expected, actual
  end

  def test_showsdks_full_command
    expected = 'xcodebuild -showsdks'
    actual = xcodebuild.show_sdks
    assert_command expected, actual
  end

  def test_list_full_command
    expected = 'xcodebuild -list'
    actual = xcodebuild.list
    assert_command expected, actual
  end

  def test_list_project_full_command
    expected = 'xcodebuild -list -project project'
    actual = xcodebuild.list_project('project')
    assert_command expected, actual
  end

  def test_list_workspace_full_command
    expected = 'xcodebuild -list -workspace workspace'
    actual = xcodebuild.list_workspace('workspace')
    assert_command expected, actual
  end

end