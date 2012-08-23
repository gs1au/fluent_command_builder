require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder::MSBuild::V40
include FluentCommandBuilder::NUnit::V25

class Example2Test < Test::Unit::TestCase

  def test_msbuild_example
    expected = 'MSBuild sample.proj /target:rebuild /property:configuration=release'
    actual = msbuild('sample.proj').target(:rebuild).property(configuration: 'release').to_s
    assert_equal expected, actual
  end

end



