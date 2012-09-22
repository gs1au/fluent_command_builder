# Note: Tests do not represent valid command line usage.

require_relative '../../../command_test_base'

class DotCover10Test < CommandTestBase
  include FluentCommandBuilder::DotCover::V10

  def test_analyse_full_command
    expected = 'dotCover analyse configurationFile'
    actual = dotcover.analyse('configurationFile')
    assert_command expected, actual
  end

  def test_cover_full_command
    expected = 'dotCover cover configurationFile'
    actual = dotcover.cover('configurationFile')
    assert_command expected, actual
  end

  def test_delete_full_command
    expected = 'dotCover delete configurationFile'
    actual = dotcover.delete('configurationFile')
    assert_command expected, actual
  end

  def test_help_full_command
    expected = 'dotCover help command fileName'
    actual = dotcover.help('command', 'fileName')
    assert_command expected, actual
  end

  def test_help_file_name_is_optional
    expected = 'dotCover help command'
    actual = dotcover.help('command')
    assert_command expected, actual
  end

  def test_help_command_is_optional
    expected = 'dotCover help'
    actual = dotcover.help
    assert_command expected, actual
  end

  def test_list_full_command
    expected = 'dotCover list configurationFile'
    actual = dotcover.list('configurationFile')
    assert_command expected, actual
  end

  def test_merge_full_command
    expected = 'dotCover merge configurationFile'
    actual = dotcover.merge('configurationFile')
    assert_command expected, actual
  end

  def test_report_full_command
    expected = 'dotCover report configurationFile'
    actual = dotcover.report('configurationFile')
    assert_command expected, actual
  end

end