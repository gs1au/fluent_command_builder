require_relative 'lib/command_test_base'

class SmokeTest < CommandTestBase

  def test_command_argument
    expected = 'MSBuild sample.proj'
    actual = msbuild_40('sample.proj')
    assert_command expected, actual
  end

  def test_command_argument_with_spaces
    expected = 'MSBuild "sample 1.proj"'
    actual = msbuild_40('sample 1.proj')
    assert_command expected, actual
  end

  def test_list_argument_accepts_array
    expected = 'MSBuild /target:target1;target2'
    actual = msbuild_40.target(%w(target1 target2))
    assert_command expected, actual
  end

  def test_list_argument_with_spaces
    expected = 'MSBuild /target:"target 1";"target 2"'
    actual = msbuild_40.target(['target 1', 'target 2'])
    assert_command expected, actual
  end

  def test_list_argument_accepts_string
    expected = 'MSBuild /target:target1;target2'
    actual = msbuild_40.target('target1;target2')
    assert_command expected, actual
  end

  def test_key_value_list_argument_accepts_hash
    expected = 'MSBuild /property:key1=value1;key2=value2'
    actual = msbuild_40.property({'key1' => 'value1', 'key2' => 'value2'})
    assert_command expected, actual
  end

  def test_key_value_list_argument_with_spaces
    expected = 'MSBuild /property:"key 1"="value 1";"key 2"="value 2"'
    actual = msbuild_40.property({'key 1' => 'value 1', 'key 2' => 'value 2'})
    assert_command expected, actual
  end

  def test_key_value_list_argument_accepts_array
    expected = 'MSBuild /property:key1=value1;key2=value2'
    actual = msbuild_40.property(%w(key1=value1 key2=value2))
    assert_command expected, actual
  end

  def test_key_value_list_argument_accepts_string
    expected = 'MSBuild /property:key1=value1;key2=value2'
    actual = msbuild_40.property('key1=value1;key2=value2')
    assert_command expected, actual
  end

  def test_optional_argument_not_specified
    expected = 'MSBuild /validate'
    actual = msbuild_40.validate
    assert_command expected, actual
  end

  def test_argument_specified_multiple_times
    expected = 'MSBuild "project 1.proj" "project 2.proj"'
    actual = msbuild_40(['project 1.proj', 'project 2.proj'])
    assert_command expected, actual
  end

  def test_nested_command
    expected = 'bundle exec rake test'
    actual = bundle_11.exec(rake_09('test'))
    assert_command expected, actual
  end

  def test_yield_command_builder_on_module_method
    builder = nil
    msbuild_40('sample.proj') { |b| builder = b }
    assert_kind_of UnderlyingBuilder, builder
  end

  def test_yield_command_builder_on_class_method
    builder = nil
    msbuild_40('sample.proj').target('target') { |b| builder = b }
    assert_kind_of UnderlyingBuilder, builder
  end

  def test_full_command_path
    expected = 'C:\\tools\\MSBuild sample.proj'
    actual = msbuild_40('sample.proj') { |b| b.path = 'C:\\tools' }
    assert_command expected, actual
  end

  def test_subcommand
    expected = 'dotCover analyse /targetExecutable=nunit'
    actual = dotcover_11.analyse.target_executable('nunit')
    assert_command expected, actual
  end

end