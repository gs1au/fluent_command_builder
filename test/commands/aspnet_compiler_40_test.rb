# Note: Tests do not represent valid command line usage.

require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder

class AspnetCompiler40Test < Test::Unit::TestCase

  def test_full_command
    expected = 'aspnet_compiler targetDir -m metabasePath -v virtualPath -p physicalPath -u -f -d -fixedNames -c -errorStack -noLogo -keyFile keyFile -keyContainer keyContainer -aptca -delaySign'
    actual = aspnet_compiler_40('targetDir').metabase_path('metabasePath').virtual_path('virtualPath').physical_path('physicalPath').allow_subsequent_updates.force_overwrite_files.force_debug_output.fixed_names.full_rebuild.error_stack.no_logo.key_file('keyFile').key_container('keyContainer').aptca.delay_sign.to_s
    assert_equal expected, actual
  end

  def test_target_dir_is_optional
    expected = 'aspnet_compiler'
    actual = aspnet_compiler_40.to_s
    assert_equal expected, actual
  end

end