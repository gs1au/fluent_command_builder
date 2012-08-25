require_relative '../lib/command_test_base'

class MSBuildVersionTest < CommandTestBase

  def test_version_40
    FluentCommandBuilder::MSBuild.version_detector.backticks_executor = MockExecutor.new <<EOF
Microsoft (R) Build Engine Version 4.0.30319.1
[Microsoft .NET Framework, Version 4.0.30319.269]
Copyright (C) Microsoft Corporation 2007. All rights reserved.

4.0.30319.1
EOF
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::MSBuild.version
    assert_equal '4.0.30319.1', actual
  end

end


