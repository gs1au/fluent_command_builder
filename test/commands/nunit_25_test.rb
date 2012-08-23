# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class NUnit25Test < CommandTestBase

  def test_full_command
    expected = 'nunit-console inputFiles -fixture:fixture -load:fixture -run:test -config:config -xml:file -xmlConsole -output:file -out:file -err:file -labels -trace:level -include:category -exclude:category -framework:framework -process:process -domain:domain -noShadow -noThread -timeout:timeout -wait -noLogo -noDots -help'
    actual = nunit_25('inputFiles').fixture('fixture').load('fixture').run('test').config('config').xml('file').xml_console.output('file').out('file').err('file').labels.trace('level').include('category').exclude('category').framework('framework').process('process').domain('domain').no_shadow.no_thread.timeout('timeout').wait.no_logo.no_dots.help
    assert_command expected, actual
  end
  
end

