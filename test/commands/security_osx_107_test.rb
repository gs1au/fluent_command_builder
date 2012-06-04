# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class SecurityOsx107Test < CommandTestBase

  def test_delete_certificate
    expected = 'security delete-certificate keychain -c commonName -Z hash -t'
    actual = security_osx_107.delete_certificate('keychain').common_name('commonName').hash('hash').delete_user_trust_settings
    assert_command expected, actual
  end

  def test_import
    expected = 'security import inputFile -k keychain -t type -f format -w -x -P passphrase -a name value -A -T appPath'
    actual = security_osx_107.import('inputFile').keychain('keychain').type('type').format('format').wrapped.not_extractable.passphrase('passphrase').attribute('name', 'value').allow_without_warning.allow_application('appPath')
    assert_command expected, actual
  end

  def test_unlock_keychain
    expected = 'security unlock-keychain keychain -u -p password'
    actual = security_osx_107.unlock_keychain('keychain').no_password.password('password')
    assert_command expected, actual
  end

end