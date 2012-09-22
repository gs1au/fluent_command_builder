# Note: Tests do not represent valid command line usage.

require_relative '../../../command_test_base'

class Rake09Test < CommandTestBase
  include FluentCommandBuilder::Rake::V09
  
  def test_full_command
    expected = 'rake task --classic-namespace --describe pattern --dry-run --execute code --execute-print code --execute-continue code --libdir libDir --no-search --prereqs --quiet --rakefile file --rakelibdir rakeLibDir --require file --rules --silent --no-system --tasks pattern --trace --verbose --version --where pattern --no-deprecation-warnings --help'
    actual = rake('task').classic_namespace.describe('pattern').dry_run.execute('code').execute_print('code').execute_continue('code').libdir('libDir').no_search.prereqs.quiet.rakefile('file').rakelibdir('rakeLibDir').require('file').rules.silent.no_system.tasks('pattern').trace.verbose.version.where('pattern').no_deprecation_warnings.help
    assert_command expected, actual
  end
  
  def test_task_is_optional
    expected = 'rake'
    actual = rake
    assert_command expected, actual
  end

  def test_multiple_tasks
    expected = 'rake task1 task2'
    actual = rake(%w(task1 task2))
    assert_command expected, actual
  end

  def test_multiple_tasks_with_spaces
    expected = 'rake "task 1" "task 2"'
    actual = rake(['task 1', 'task 2'])
    assert_command expected, actual
  end
  
end