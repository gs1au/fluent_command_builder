require 'test/unit'
require_relative '../lib/fluent_command_builder'
include FluentCommandBuilder

class SmokeTest < Test::Unit::TestCase

  def test_command_argument
    expected = 'MSBuild sample.proj'
    actual = msbuild_40('sample.proj').to_s
    assert_equal expected, actual
  end

  def test_list_argument
    expected = 'MSBuild /target:clean;build'
    actual = msbuild_40.target(['clean', 'build']).to_s
    assert_equal expected, actual
  end

  def test_key_value_list_argument
    expected = 'MSBuild /property:a=1;b=2'
    actual = msbuild_40.property({:a => 1, :b => 2}).to_s
    assert_equal expected, actual
  end

  def test_optional_argument
    expected = 'MSBuild /validate'
    actual = msbuild_40.validate.to_s
    assert_equal expected, actual
  end

  def test_argument_specified_multiple_times
    expected = 'MSBuild "project 1.proj" "project 2.proj"'
    actual = msbuild_40(['project 1.proj', 'project 2.proj']).to_s
    assert_equal expected, actual
  end

  def test_nested_command
    expected = 'bundle exec rake test'
    actual = bundle_11.exec(rake_09('test')).to_s
    assert_equal expected, actual
  end

end