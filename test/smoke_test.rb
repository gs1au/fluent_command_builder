require 'test/unit'
require_relative '../lib/fluent_command_builder'
include FluentCommandBuilder

class SmokeTest < Test::Unit::TestCase

  def test_msbuild_40
    expected = 'MSBuild sample.proj /target:clean;build /property:a=1;b=2'
    actual = msbuild_40.project_file('sample.proj').target(['clean', 'build']).property({:a => 1, :b => 2}).to_s
    assert_equal expected, actual
  end

end