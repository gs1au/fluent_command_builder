require_relative '../../../command_test_base'

class MSBuildVersionTest < CommandTestBase

  def test_version_40
    output =  <<EOF
    Microsoft (R) Build Engine Version 4.0.30319.1
    [Microsoft .NET Framework, Version 4.0.30319.269]
    Copyright (C) Microsoft Corporation 2007. All rights reserved.

    4.0.30319.1
EOF
    executor = stub
    executor.stubs(:execute).returns(output)
    FluentCommandBuilder::MSBuild.version_detector.backticks_executor = executor
    actual = FluentCommandBuilder::MSBuild.version
    assert_equal '4.0.30319.1', actual
  end

end


