# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class SecurityOsx107Test < CommandTestBase

  def test_delete_certificate
    expected = 'security delete-certificate -c commonName -Z hash -t keychain'
    actual = security_osx_107.delete_certificate.common_name('commonName').hash('hash').delete_user_trust_settings.keychain('keychain')
    assert_command expected, actual
  end

  def test_import
    expected = 'security import inputFile -k keychain -t type -f format -w -x -P passphrase -a name value -A -T appPath'
    actual = security_osx_107.import('inputFile').keychain('keychain').type('type').format('format').wrapped.not_extractable.passphrase('passphrase').attribute('name', 'value').allow_without_warning.allow_application('appPath')
    assert_command expected, actual
  end

  def test_unlock_keychain
    expected = 'security unlock-keychain -u -p password keychain'
    actual = security_osx_107.unlock_keychain.no_password.password('password').keychain('keychain')
    assert_command expected, actual
  end

end