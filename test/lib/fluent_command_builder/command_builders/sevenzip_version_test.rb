require_relative '../../../command_test_base'

class SevenZipVersionTest < CommandTestBase

  def test_version_92
    output = <<EOF

    7-Zip (A) 9.20  Copyright (c) 1999-2010 Igor Pavlov  2010-11-18

    Usage: 7za <command> [<switches>...] <archive_name> [<file_names>...]
           [<@listfiles...>]

    <Commands>
      a: Add files to archive
      b: Benchmark
      d: Delete files from archive
      e: Extract files from archive (without using directory names)
      l: List contents of archive
      t: Test integrity of archive
      u: Update files to archive
      x: eXtract files with full paths
    <Switches>
      -ai[r[-|0]]{@listfile|!wildcard}: Include archives
      -ax[r[-|0]]{@listfile|!wildcard}: eXclude archives
      -bd: Disable percentage indicator
      -i[r[-|0]]{@listfile|!wildcard}: Include filenames
      -m{Parameters}: set compression Method
      -o{Directory}: set Output directory
      -p{Password}: set Password
      -r[-|0]: Recurse subdirectories
      -scs{UTF-8 | WIN | DOS}: set charset for list files
      -sfx[{name}]: Create SFX archive
      -si[{name}]: read data from stdin
      -slt: show technical information for l (List) command
      -so: write data to stdout
      -ssc[-]: set sensitive case mode
      -ssw: compress shared files
      -t{Type}: Set type of archive
      -u[-][p#][q#][r#][x#][y#][z#][!newArchiveName]: Update options
      -v{Size}[b|k|m|g]: Create volumes
      -w[{path}]: assign Work directory. Empty path means a temporary directory
      -x[r[-|0]]]{@listfile|!wildcard}: eXclude filenames
      -y: assume Yes on all queries

EOF
    executor = stub
    executor.stubs(:execute).returns(output)
    FluentCommandBuilder::SevenZip.version_detector.backticks_executor = executor
    actual = FluentCommandBuilder::SevenZip.version
    assert_equal '9.20', actual
  end

end


