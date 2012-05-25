require 'test/unit'
require_relative '../lib/fluent_command_builder'
include FluentCommandBuilder

class XCodeBuild43Test < Test::Unit::TestCase

  def test_build_project
    expected = 'xcodebuild action1 action2 -project project1 -target target1 -configuration configuration1 -sdk sdk1 key1=value1 -userdefault=value1'
    actual = xcodebuild_43.build_project(['action1', 'action2']).project('project1').target('target1').configuration('configuration1').sdk('sdk1').setting('key1', 'value1').user_default('value1').to_s
    assert_equal expected, actual
  end

  def test_build_workspace
    expected = 'xcodebuild -workspace workspace1 action1 action2 -scheme scheme1 -configuration configuration1 -sdk sdk1 key1=value1 -userdefault=value1'
    actual = xcodebuild_43.build_workspace('workspace1', ['action1', 'action2']).scheme('scheme1').configuration('configuration1').sdk('sdk1').setting('key1', 'value1').user_default('value1').to_s
    assert_equal expected, actual
  end

end