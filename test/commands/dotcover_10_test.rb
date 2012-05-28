# Note: Tests do not represent valid command line usage.

require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder

class DotCover10Test < Test::Unit::TestCase

  def test_analyse_full_command
    expected = 'dotCover analyse configurationFile'
    actual = dotcover_10.analyse('configurationFile').to_s
    assert_equal expected, actual
  end

  def test_cover_full_command
    expected = 'dotCover cover configurationFile'
    actual = dotcover_10.cover('configurationFile').to_s
    assert_equal expected, actual
  end

  def test_delete_full_command
    expected = 'dotCover delete configurationFile'
    actual = dotcover_10.delete('configurationFile').to_s
    assert_equal expected, actual
  end

  def test_help_full_command
    expected = 'dotCover help command fileName'
    actual = dotcover_10.help('command', 'fileName').to_s
    assert_equal expected, actual
  end

  def test_help_file_name_is_optional
    expected = 'dotCover help command'
    actual = dotcover_10.help('command').to_s
    assert_equal expected, actual
  end

  def test_help_command_is_optional
    expected = 'dotCover help'
    actual = dotcover_10.help.to_s
    assert_equal expected, actual
  end

  def test_list_full_command
    expected = 'dotCover list configurationFile'
    actual = dotcover_10.list('configurationFile').to_s
    assert_equal expected, actual
  end

  def test_merge_full_command
    expected = 'dotCover merge configurationFile'
    actual = dotcover_10.merge('configurationFile').to_s
    assert_equal expected, actual
  end

  def test_report_full_command
    expected = 'dotCover report configurationFile'
    actual = dotcover_10.report('configurationFile').to_s
    assert_equal expected, actual
  end

end