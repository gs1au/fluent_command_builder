# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class AspnetCompiler20And40Test < CommandTestBase

  def test_full_command
    expected = 'aspnet_compiler targetDir -m metabasePath -v virtualPath -p physicalPath -u -f -d -fixedNames -c -errorStack -noLogo -keyFile keyFile -keyContainer keyContainer -aptca -delaySign'
    assert_each_command expected, aspnet_compiler_20('targetDir'), aspnet_compiler_40('targetDir') do |aspnet_compiler|
      aspnet_compiler.metabase_path('metabasePath').virtual_path('virtualPath').physical_path('physicalPath').allow_subsequent_updates.force_overwrite_files.force_debug_output.fixed_names.full_rebuild.error_stack.no_logo.key_file('keyFile').key_container('keyContainer').aptca.delay_sign.to_s
    end
  end

  def test_target_dir_is_optional
    expected = 'aspnet_compiler'
    assert_each_command expected, aspnet_compiler_20, aspnet_compiler_40
  end

end