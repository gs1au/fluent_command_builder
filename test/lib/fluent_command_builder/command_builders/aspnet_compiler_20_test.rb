# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class AspnetCompiler20Test < CommandTestBase
  include FluentCommandBuilder::AspnetCompiler::V20

  def test_full_command
    expected = 'aspnet_compiler targetDir -m metabasePath -v virtualPath -p physicalPath -u -f -d -fixedNames -c -errorStack -noLogo -keyFile keyFile -keyContainer keyContainer -aptca -delaySign'
    actual = aspnet_compiler('targetDir').metabase_path('metabasePath').virtual_path('virtualPath').physical_path('physicalPath').allow_subsequent_updates.force_overwrite_files.force_debug_output.fixed_names.full_rebuild.error_stack.no_logo.key_file('keyFile').key_container('keyContainer').aptca.delay_sign.to_s
    assert_command expected, actual
  end

  def test_target_dir_is_optional
    expected = 'aspnet_compiler'
    actual = aspnet_compiler
    assert_command expected, actual
  end

end