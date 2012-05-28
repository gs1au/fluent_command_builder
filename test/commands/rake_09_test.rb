# Note: Tests do not represent valid command line usage.

require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder

class Rake09Test < Test::Unit::TestCase
  
  def test_full_command
    expected = 'rake task --classic-namespace --describe pattern --dry-run --execute code --execute-print code --execute-continue code --libdir libDir --no-search --prereqs --quiet --rakefile file --rakelibdir rakeLibDir --require file --rules --silent --no-system --tasks pattern --trace --verbose --version --where pattern --no-deprecation-warnings --help'
    actual = rake_09('task').classic_namespace.describe('pattern').dry_run.execute('code').execute_print('code').execute_continue('code').libdir('libDir').no_search.prereqs.quiet.rakefile('file').rakelibdir('rakeLibDir').require('file').rules.silent.no_system.tasks('pattern').trace.verbose.version.where('pattern').no_deprecation_warnings.help.to_s
    assert_equal expected, actual
  end
  
  def test_task_is_optional
    expected = 'rake'
    actual = rake_09.to_s
    assert_equal expected, actual
  end
  
end