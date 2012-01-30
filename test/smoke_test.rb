require 'test/unit'
require_relative '../lib/fluent_command_builder'
include FluentCommandBuilder

class SmokeTest < Test::Unit::TestCase

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

end