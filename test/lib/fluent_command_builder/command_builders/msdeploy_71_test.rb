# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class MSDeploy71Test < CommandTestBase

  def test_full_command
    expected = 'MSDeploy -allowUntrusted:bool -appHostConfigDir:path -declareParam:key1=value1,key2=value2 -declareParamFile:xmlFile -dest:provider -disableLink:linkExtension -disableRule:rule1,rule2 -disableSkipDirective:skipDirectiveName -enableLink:linkExtension -enableRule:rule1,rule2 -enableSkipDirective:skipDirectiveName -postSync:command -preSync:command -removeParam:param -replace:arg -retryAttempts:number -retryInterval:milliseconds -setParam:key1=value1,key2=value2 -setParamFile:xmlFile -showSecure -skip:arg -source:provider -unicode -useCheckSum -verb:verbName -verbose -webServerDir:path -whatif -xml -xpath:path'
    actual = msdeploy_71.allow_untrusted('bool').app_host_config_dir('path').declare_param({'key1' => 'value1', 'key2' => 'value2'}).declare_param_file('xmlFile').dest('provider').disable_link('linkExtension').disable_rule(['rule1', 'rule2']).disable_skip_directive('skipDirectiveName').enable_link('linkExtension').enable_rule(%w(rule1 rule2)).enable_skip_directive('skipDirectiveName').post_sync('command').pre_sync('command').remove_param('param').replace('arg').retry_attempts('number').retry_interval('milliseconds').set_param({'key1' => 'value1', 'key2' => 'value2'}).set_param_file('xmlFile').show_secure.skip('arg').source('provider').unicode.use_check_sum.verb('verbName').verbose.web_server_dir('path').whatif.xml.xpath('path')
    assert_command expected, actual
  end

end