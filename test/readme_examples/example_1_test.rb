require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder::MSBuild::V40

class Example1Test < Test::Unit::TestCase

  def test_msbuild_example
    expected = 'MSBuild sample.proj /target:clean;build /property:configuration=release'
    actual = msbuild('sample.proj').target([:clean, :build]).property(configuration: 'release').to_s
    assert_equal expected, actual
  end

end


