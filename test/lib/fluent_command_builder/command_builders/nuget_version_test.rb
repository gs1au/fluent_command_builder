require_relative '../../../command_test_base'

class NuGetVersionTest < CommandTestBase

  def test_version_20
    FluentCommandBuilder::NuGet.version_detector.backticks_executor = MockExecutor.new <<EOF
NuGet Version: 2.0.30619.9000
usage: NuGet <command> [args] [options]
Type 'NuGet help <command>' for help on a specific command.

Available commands:

 config      Gets or sets NuGet config values.
 delete      Deletes a package from the server.
 help (?)    Displays general help information and help information about other commands.
 install     Installs a package using the specified sources. If no sources are specified, all sources defined in %AppData%\NuGet\NuGet.config are used.  If NuG
             et.config specifies no sources, uses the default NuGet feed.
 list        Displays a list of packages from a given source. If no sources are specified, all sources defined in %AppData%\NuGet\NuGet.config are used. If NuG
             et.config specifies no sources, uses the default NuGet feed.
 pack        Creates a NuGet package based on the specified nuspec or project file.
 publish     Publishes a package that was uploaded to the server but not added to the feed.
 push        Pushes a package to the server and optionally publishes it.
 setApiKey   Saves an API key for a given server URL. When no URL is provided API key is saved for the NuGet gallery.
 sources     Provides the ability to manage list of sources located in  %AppData%\NuGet\NuGet.config
 spec        Generates a nuspec for a new package. If this command is run in the same folder as a project file (.csproj, .vbproj, .fsproj), it will create a to
             kenized nuspec file.
 update      Update packages to latest available versions. This command also updates NuGet.exe itself.

For more information, visit http://docs.nuget.org/docs/reference/command-line-reference

EOF
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::NuGet.version
    assert_equal '2.0.30619.9000', actual
  end

end


