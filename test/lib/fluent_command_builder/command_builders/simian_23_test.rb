# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class Simian23Test < CommandTestBase
  include FluentCommandBuilder::Simian::V23

  def test_full_command
    expected = 'simian -formatter=formatter -threshold=threshold -language=language -defaultLanguage=language -failOnDuplication=bool -reportDuplicateText=bool -ignoreBlocks=bool -ignoreCurlyBraces=bool -ignoreIdentifiers=bool -ignoreIdentifierCase=bool -ignoreRegions=bool -ignoreStrings=bool -ignoreStringCase=bool -ignoreNumbers=bool -ignoreCharacters=bool -ignoreCharacterCase=bool -ignoreLiterals=bool -ignoreSubtypeNames=bool -ignoreModifiers=bool -ignoreVariableNames=bool -balanceParentheses=bool -balanceCurlyBraces=bool -balanceSquareBrackets=bool'
    actual = simian.formatter('formatter').threshold('threshold').language('language').default_language('language').fail_on_duplication('bool').report_duplicate_text('bool').ignore_blocks('bool').ignore_curly_braces('bool').ignore_identifiers('bool').ignore_identifier_case('bool').ignore_regions('bool').ignore_strings('bool').ignore_string_case('bool').ignore_numbers('bool').ignore_characters('bool').ignore_character_case('bool').ignore_literals('bool').ignore_subtype_names('bool').ignore_modifiers('bool').ignore_variable_names('bool').balance_parentheses('bool').balance_curly_braces('bool').balance_square_brackets('bool')
    assert_command expected, actual
  end

end