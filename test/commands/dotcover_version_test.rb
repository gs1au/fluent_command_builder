require_relative '../lib/command_test_base'

class DotCoverVersionTest < CommandTestBase

  def test_version_20
    FluentCommandBuilder::DotCover.version_detector.backticks_executor = MockExecutor.new <<EOF
JetBrains dotCover Console Runner v2.0.425.54. Copyright (c) 2009-2012 JetBrains s.r.o. All rights reserved.

Version output file is not specified
Type 'dotCover help' for usage.

EOF
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::DotCover.version
    assert_equal '2.0.425.54', actual
  end

end


