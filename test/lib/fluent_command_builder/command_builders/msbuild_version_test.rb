require_relative '../../../version_test_base'

class MSBuildVersionTest < VersionTestBase

  def test_version_40
    assert_version FluentCommandBuilder::MSBuild, '4.0.30319.1', <<EOF
    Microsoft (R) Build Engine Version 4.0.30319.1
    [Microsoft .NET Framework, Version 4.0.30319.269]
    Copyright (C) Microsoft Corporation 2007. All rights reserved.

    4.0.30319.1
EOF
  end

end


