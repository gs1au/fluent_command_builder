require_relative '../command_test_base'

class TeamFoundationTeeVersionTest < CommandTestBase

  def test_version_101
    FluentCommandBuilder::TeamFoundationTEE.version_detector.backticks_executor = MockExecutor.new <<EOF
Team Explorer Everywhere (version 10.1.0.201101271439)

 Available commands and their options:

  add        [-lock:none|checkin|checkout] [-type:<value>] [-recursive] <localItemSpec>...
  branch     [-version:<value>] [-noget] [-lock:none|checkin|checkout] [-recursive] [-checkin] <oldItemSpec> <newLocalItem>
  branches   [-version:<value>] <itemSpec>...
  changeset  [-latest] [-comment:<value>|@valuefile] [-notes:"note"="value"[;"note2"="value2"[;...]]|@notefile] [changenumber]
  checkin    [-author:<value>] [-comment:<value>|@valuefile] [-notes:"note"="value"[;"note2"="value2"[;...]]|@notefile] [-override:<value>|
             @valuefile] [-recursive] [-validate] [-bypass] [-force] [-associate:<workItemID>[,<workItemID>...]] [-resolve:<workItemID>[,<workItemID>...]]
             [<itemSpec>...]
  checkout   [-recursive] [-lock:none|checkin|checkout] [-type:<value>] <itemSpec>...
  delete     [-lock:none|checkin|checkout] [-recursive] <itemSpec>...
  destroy    [-keephistory] [-startcleanup] [-preview] [-silent] [-stopat:<value>] [-noprompt] itemspec1[;versionspec][;XdeletionID] [itemspec2...itemspecN]
  difference [-recursive] <itemSpec> <itemSpec2>
  difference [-shelveset:<value>] [-recursive] <shelvesetItemSpec>
  difference [-version:<value>] [-recursive] <itemSpec>
  dir        [-version:<value>] [-recursive] [-folders] [-deleted] <itemSpec>...
  eula       [-accept]
  get        [-version:<value>] [-recursive] [-preview] [-force] [-all] [-overwrite] [<itemSpec>...]
  getcs      -changeset:<value> [-latest]
  help       [-listexitcodes] [<command>]
  history    [-version:<value>] [-stopafter:<value>] [-recursive] [-user:<value>] [-format:brief|detailed|xml] [-slotmode] [-itemmode] <itemSpec>
  label      [-owner:<value>] [-version:<value>] [-comment:<value>|@valuefile] [-child:fail|replace|merge] [-recursive] <labelName>[@<scope>] <itemSpec>...
  label      -delete [-owner:<value>] [-version:<value>] <labelName>[@<scope>]
  labels     [-owner:<value>] [-format:brief|detailed|xml] [<labelNameFilter>]
  lock       [-recursive] [-lock:none|checkin|checkout] <itemSpec>...
  merge      [-recursive] [-force] [-candidate] [-discard] [-version:<value>] [-lock:none|checkin|
             checkout] [-preview] [-baseless] [-nosummary] [-noimplicitbaseless] <source> <destination>
  merges     [-recursive] [-format:brief|detailed|xml] [<sourceItem>] <destinationItem>
  online     [-adds] [-deletes] [-diff] [-exclude:<value>[,<value>]] [-recursive] [-preview] [<itemSpec>...]
  print      [-version:<value>] <itemSpec>
  productkey [-set:<value>] [-trial]
  profile    -copy <existingProfileName> <newProfileName>
  profile    -delete <profileName>
  profile    -edit [-string:<property>[=[<value>]]...] [-boolean:<property>[=[true|false]]...] [-number:<property>[=[<number>]]...] <profileName>
  profile    -new [-string:<property>[=[<value>]]...] [-boolean:<property>[=[true|false]]...] [-number:<property>[=[<number>]]...] <profileName>
  profiles   [-format:brief|detailed|xml]
  properties [-recursive] [-version:<value>] <itemSpec>...
  reconcile  [-teamProject:<value>]
  reconcile  -buildName:<value> [-teamProject:<value>] [-recursive] [<itemSpec>...]
  reconcile  -changeset:<value> [-recursive] [<itemSpec>...]
  reconcile  -forgetBuild:<buildName> [-teamProject:<value>]
  rename     [-lock:none|checkin|checkout] <oldItem> <newItem>
  resolve    [-auto:AutoMerge|TakeTheirs|KeepYours|OverwriteLocal|DeleteConflict|KeepYoursRenameTheirs|
             External] [-preview] [-converttotype:<value>] [-recursive] [-newname:<value>] <itemSpec>
  resolve    [-auto:AutoMerge|TakeTheirs|KeepYours|OverwriteLocal|DeleteConflict|KeepYoursRenameTheirs|
             External] [-preview] [-overridetype:<value>] [-recursive] [-newname:<value>] <itemSpec>
  shelve     [-move] [-replace] [-comment:<value>|@valuefile] [-recursive] [-validate] <shelvesetName[;owner]> <fileSpec>...
  shelve     [-replace] [-comment:<value>|@valuefile] [-validate] <shelvesetName[;owner]>
  shelve     -delete [-collection:<url>] [-validate] <shelvesetName[;owner]>
  shelvesets [-owner:<value>] [-format:brief|detailed|xml] [<shelvesetName>]
  status     [-workspace:<value>] [-shelveset:<value>] [-format:brief|detailed|xml] [-recursive] [-user:<value>] [<itemSpec>...]
  undelete   [-noget] [-lock:none|checkin|checkout] [-newname:<value>] <itemSpec>[;deletionID]...
  undelete   [-noget] [-lock:none|checkin|checkout] [-recursive] <itemSpec>[;deletionID]...
  undo       [-recursive] <itemSpec>...
  unlabel    [-recursive] <labelName>[@<scope>] <itemSpec>...
  unshelve   [-move] [-recursive] [-format:brief|detailed|xml] <shelvesetName[;owner]> [<itemSpec>...]
  workfold   [-collection:<url>] [-workspace:<value>] <serverFolder>
  workfold   [-map] [-collection:<url>] [-workspace:<value>] <serverFolder> <localFolder>
  workfold   [-workspace:<value>]
  workfold   <localFolder>
  workfold   -cloak [-collection:<url>] [-workspace:<value>] <serverFolder>|<localFolder>
  workfold   -decloak [-collection:<url>] [-workspace:<value>] <serverFolder>|<localFolder>
  workfold   -unmap [-collection:<url>] [-workspace:<value>] <serverFolder>|<localFolder>
  workspace  [-collection:<url>] [-comment:<value>|@valuefile] [-newname:<value>] [<workspacename;[workspaceowner]>]
  workspace  -delete [-collection:<url>] [<workspacename;[workspaceowner]>]
  workspace  -new [-noprompt] [-template:<value>] [-computer:<value>] [-comment:<value>|@valuefile] [-collection:<url>] [<workspacename;[workspaceowner]>]
  workspaces [-owner:<value>] [-computer:<value>] [-collection:<url>] [-format:brief|detailed|xml] [-updateUserName:<user@domain>|
             <domain\\user>] [-updateComputerName:<value>] workspaceName
  workspaces -remove:<workspace1>[,<workspace2>,...] -collection:<url>

 Options accepted by most commands:

  [-login:domain\\username,password] | [-login:username@domain,password]
  -collection:<url>
  -continueOnError
  -exitcode
  -help
  -noprompt
  -outputSeparator:<value>
  -profile:<value>
  -proxy:<url>
  -server:<url>
  -workspace:<value>

Options may be started with any of: -

For general help, view the 'help/index.htm' file installed with the program.
For help on a specific command, supply the command name as an argument
to the help command.  For example: 'tf help checkin'
EOF
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::TeamFoundationTEE.version
    assert_equal '10.1.0.201101271439', actual
  end

end





