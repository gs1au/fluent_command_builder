# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class NUnit26Test < CommandTestBase

  def test_full_command
    expected = 'nunit-console inputFiles -fixture:fixture -load:fixture -run:test -runList:file -config:config -result:file -xml:file -xmlConsole -noResult -noXml -output:file -out:file -err:file -work:directory -labels -trace:level -include:category -exclude:category -framework:framework -process:process -domain:domain -apartment:apartment -noShadow -noThread -timeout:timeout -wait -noLogo -noDots -stopOnError -cleanup -help'
    actual = nunit_26('inputFiles').fixture('fixture').load('fixture').run('test').run_list('file').config('config').result('file').xml('file').xml_console.no_result.no_xml.output('file').out('file').err('file').work('directory').labels.trace('level').include('category').exclude('category').framework('framework').process('process').domain('domain').apartment('apartment').no_shadow.no_thread.timeout('timeout').wait.no_logo.no_dots.stop_on_error.cleanup.help
    assert_command expected, actual
  end
  
end

