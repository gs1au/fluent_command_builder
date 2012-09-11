require_relative '../lib/command_test_base'

class FastLinkCheckerVersionTest < CommandTestBase

  def test_version_21
    FluentCommandBuilder::FastLinkChecker.version_detector.backticks_executor = MockExecutor.new <<EOF
      ***** Fast Link Checker Console Tool x64 Editon 2.1.0.604 *****
*==============================================================*
* This version is unregistered. You have 16 day(s) remaining.  *
* Type CONLINKCHECKER -r for view ordering information.        *
*   or CONLINKCHECKER -e for enter your registration number.   *
*==============================================================*

Command Line:
conlinkchecker.exe --Site URL [-CheckHyperlinks] [-CheckImages] [-CheckOthers]
  [-RecheckBad RecheckTimes] [-Disp servername] [-Auth basic | IWA |
  digest | negotiate -user username -pwd password]
  [-IgnoreRobotsTxt] [-CheckFirstOnly] [-CheckNoExtern]
  [-CheckIgnoreCase] [-IgnoreCookies] [-NotIgnoreWWW] [-CheckParentDir]
  [-IgnoreRelative] [-GETAfterHEADFail] [-CheckRestrict CheckLevel]
  [-SizeLimitAbove | -SizeLimitBelow SizeLimitKB]
  [-LimitLinks [found | processed | unique | broken] n]
  [-SkipSlowLinks] [-CheckOnly wildcards] [-SkipFiles wildcards]
  [-SkipDomains list] [-SkipBookmarks list]
  [-IgnoreFormTag] [-NotIgnoreSpaces]
[--Ini inifile.ini] [--Flc file[.flc]]
[--Cache] [--Verbosely] [--PrintBroken] [--UserAgent AgentName]
[--Report] [html | text | htmlfull | textfull | htmlstat | textstat | csvstat]
  [-from address] [-subject subject] [-attach] [-starttls] [-columns url |
  status | comment | title | protocol | contenttype | size | lastmod | charset |
  accesstime | location | page | position] [-sort url | status | comment |
  contenttype | size | lastmod | charset | accesstime | location | page |
  position] [-unprocessed] [filename/email [smtpserver:port
  [username [password]]]]

--Site
  URL - The address of the site to check links on.
  [-CheckHyperlinks] - Specify this option to check links to hypertext pages.
  [-CheckImages] - Specify this option to check links to graphic objects.
  [-CheckOthers] - Specify this option to check links to scripts, style sheets
                   and other objects.
  [-RecheckBad RecheckTimes] - Re-check links which are failed due to a system
                               errors such as timeout, error reading file,
                               socket errors, etc., which appeared on your
                               local system, not on web-server.
  [-Disp ServerName] - This name is to substitute instead of the actual
                      site name
  [-Auth basic | IWA | digest | negotiate -user username -pwd password] - Use
                      basic, IWA, digest or negotiate authorization.
  [-IgnoreRobotsTxt] - Specify this option to let the program check links on
                       pages forbidden to be indexed by robots in the
                       robots.txt file.
  [-CheckFirstOnly] - Specify this option to check links only on the page
                      specified in the URL field.
  [-CheckNoExtern] - Specify this option to ignore links to other sites and
                     check only links within the current site.
  [-CheckIgnoreCase] - Specify this option to make Fast Link Checker ignore
                       the case of letters when comparing links.
  [-IgnoreCookies] - Do not accept cookies for the currently scanned site.
  [-NotIgnoreWWW] - Do not ignore www prefix.
  [-CheckParentDir] - Check entire site not depending on the start directory.
  [-IgnoreRelative] - Ignore relative link overflow errors.
  [-GETAfterHEADFail] - Use GET method if HEAD failed.
  [-CheckRestrict CheckLevel] - Specify this option to restrict the level
                                of subfolders.
  [-SizeLimitAbove | -SizeLimitBelow SizeLimitKB] Skip all files which size
                      is greather or less than specified number of kilobytes.
  [-LimitLinks [found | processed | unique | broken] n] - Stop scanning if n
                   links of the specified type have been detected.
  [-SkipSlowLinks] - Skip checking all links marked as slow. Normally slow
                     links are checked like all other links but when this
                     option is set all slow links will be skipped.
  [-CheckOnly wildcards] - Skip all files which do not meet the wildcards
                           specified.
  [-SkipFiles wildcards] - Skip all files which do not meet the wildcards
                           specified.
  [-SkipDomains list] - Skip domains from the semicolon-separated list.
  [-SkipBookmarks list] - Skip bookmarks from the semicolon-separated list.
  [-IgnoreFormTag] - Ignore links from <form> tag.
  [-NotIgnoreSpaces] - Do not ignore spaces in URLs.

[--Ini inifile.ini] - You can specify the file with Fast Link Checker settings.
                      If this option is not specified, the standard Fast Link
                      Checker settings file will be used.

[--Flc file[.flc]] - When link checking will be done Fast Link Checker
                          will save results to the specified file.


[--Cache] - save cache of all downloaded files to the folder
            \\Documents and settings\\[User name]\\Application Data\\Fast Link
            Checker\\Cache
            Where [User name] is the user name you have logged into the system

[--Verbosely] - Specify this option to view link checking progress verbosely.

[--PrintBroken] - Specify this option to view all found broken links verbosely.

[--UserAgent AgentName] - The name of the user agent the program will use when
                          requesting files from a web server. Default value -
                          "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1".

[--Report] - Fast Link Checker can save report to a file or send it
             to email address.
             Several "--Report" statements may be specified.
[html | text | csv | htmlfull | textfull | csvstat |
htmlstat | textstat | csvstat] -
         Type of report: html - broken links in HTML format,
         text - broken links in text format, csv - broken links
         in csv format, htmlfull - all links in HTML format,
         textfull - all links in text format, csvfull - all links in
         csv format, textstat - statistics only in text format,
         htmlstat - statistics only in HTML format,
         csvstat - statistics only in csv format.
[-from address] - From address (if [email] specified).
[-subject subject] - Subject (if [email] specified).
[-attach] - Send report as attachment (if [email] specified).
[-starttls] - Use STARTTLS (SSL connection) (if [email] specified).
[-columns url | status | comment | title | protocol | contenttype | size |
lastmod | charset | accesstime | location | page | position] - Include
              the specified columns only (for htmlful, textfull or csvfull).
[-sort url | status | comment | contenttype | size | lastmod | charset |
accesstime | location | page | position] - Sort by the specified column.
[-unprocessed] - Include unprocessed links to the report.
[filename/email] - Name of a file to save report in or email address
                   to send report to.
[smtpserver:port] - Name and port of SMTP server for the specified
                    email address.
[username] - User name for SMTP server, if it requires authentication.
[password] - Password for SMTP server, if it requires authentication.

You can read more in the Fast Link Checker documentation at
http://fastlinkchecker.com/docs/manual/

There is the interactive command line generator available by the "Reports ->
Export Command Line" menu command in the Fast Link Checker application window.

Type "conlinkchecker.exe -h" to display help.


EOF
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::FastLinkChecker.version
    assert_equal '2.1.0.604', actual
  end

end


