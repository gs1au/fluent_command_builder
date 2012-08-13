# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class Netsh61Test < CommandTestBase

  def test_advfirewall_firewall_add_rule_full_command
    expected = 'netsh advfirewall firewall add rule name=ruleName dir=direction action=action program=path service=serviceShortName description=ruleDescription enable=enable profile=profile localIp=address1,address2 remoteIp=address1,address2 localPort=port1,port2 remotePort=port1,port2 protocol=protocol interfaceType=type rmtcomputergrp=sddlString rmtusgrp=sddlString edge=edge security=security'
    actual = netsh_61.advfirewall.firewall.add_rule('ruleName', 'direction', 'action').program('path').service('serviceShortName').description('ruleDescription').enable('enable').profile('profile').local_ip(%w(address1 address2)).remote_ip(%w(address1 address2)).local_port(%w(port1 port2)).remote_port(%w(port1 port2)).protocol('protocol').interface_type('type').remote_computer_group('sddlString').remote_user_group('sddlString').edge('edge').security('security')
    assert_command expected, actual
  end

  def test_advfirewall_firewall_delete_rule_full_command
    expected = 'netsh advfirewall firewall delete rule name=ruleName dir=direction profile=profile program=program service=serviceShortName localIp=address1,address2 remoteIp=address1,address2 localPort=port1,port2 remotePort=port1,port2 protocol=protocol'
    actual = netsh_61.advfirewall.firewall.delete_rule('ruleName').dir('direction').profile('profile').program('program').service('serviceShortName').local_ip(%w(address1 address2)).remote_ip(%w(address1 address2)).local_port(%w(port1 port2)).remote_port(%w(port1 port2)).protocol('protocol')
    assert_command expected, actual
  end

  def test_advfirewall_firewall_set_rule_full_command_except_new
    expected = 'netsh advfirewall firewall set rule group=groupName dir=direction profile=profile program=program service=serviceShortName localIp=address1,address2 remoteIp=address1,address2 localPort=port1,port2 remotePort=port1,port2 protocol=protocol'    
    actual = netsh_61.advfirewall.firewall.set_rule.group('groupName').dir('direction').profile('profile').program('program').service('serviceShortName').local_ip(%w(address1 address2)).remote_ip(%w(address1 address2)).local_port(%w(port1 port2)).remote_port(%w(port1 port2)).protocol('protocol')
    assert_command expected, actual
  end

  def test_advfirewall_firewall_set_rule_new
    expected = 'netsh advfirewall firewall set rule new name=ruleName dir=direction program=path service=serviceShortName action=action description=ruleDescription enable=enable profile=profile localIp=address1,address2 remoteIp=address1,address2 localPort=port1,port2 remotePort=port1,port2 protocol=protocol interfaceType=type rmtcomputergrp=sddlString rmtusgrp=sddlString edge=edge security=security'
    actual = netsh_61.advfirewall.firewall.set_rule.new.name('ruleName').dir('direction').program('path').service('serviceShortName').action('action').description('ruleDescription').enable('enable').profile('profile').local_ip(%w(address1 address2)).remote_ip(%w(address1 address2)).local_port(%w(port1 port2)).remote_port(%w(port1 port2)).protocol('protocol').interface_type('type').remote_computer_group('sddlString').remote_user_group('sddlString').edge('edge').security('security')
    assert_command expected, actual
  end
  
  def test_advfirewall_firewall_show_rule_full_command
    expected = 'netsh advfirewall firewall show rule name=ruleName profile=profile type=type verbose'
    actual = netsh_61.advfirewall.firewall.show_rule('ruleName').profile('profile').type('type').verbose
    assert_command expected, actual
  end

  def test_http_add_url_acl_full_command
    expected = 'netsh http add urlacl url=url user=user listen=listen delegate=delegate sddl=sddl'
    actual = netsh_61.http.add_url_acl('url').user('user').listen('listen').delegate('delegate').sddl('sddl')
    assert_command expected, actual
  end

  def test_http_delete_url_acl_full_command
    expected = 'netsh http delete urlacl url=url'
    actual = netsh_61.http.delete_url_acl('url')
    assert_command expected, actual
  end

end