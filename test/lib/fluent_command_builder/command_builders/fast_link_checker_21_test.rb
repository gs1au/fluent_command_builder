# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class FastLinkChecker21Test < CommandTestBase

  def test_full_command
    expected = 'conlinkchecker --site site -checkHyperlinks -checkImages -checkOthers -recheckBad 1 -disp serverName -auth authType -user username -pwd password -ignoreRobotsTxt -checkFirstOnly -checkNoExtern -checkIgnoreCase -ignoreCookies -notIgnoreWww -checkParentDir -ignoreRelative -getAfterHeadFail -checkRestrict checkLevel -sizeLimitAbove -sizeLimitBelow sizeLimit -limitLinks linkType n -skipSlowLinks -checkOnly wildcards -skipFiles wildcards -skipDomains domain1;domain2 -skipBookmarks bookmark1;bookmark2 -ignoreFormTag -notIgnoreSpaces --ini iniFile --flc flcFile --cache --printBroken --userAgent agentName --report reportType -from address -subject subject -attach -startTls --verbosely -columns columns -sort sortColumns -unprocessed filename email smtpserver:port username password -h'
    c = fastlinkchecker_21.site('site').check_hyperlinks.check_images.check_others.recheck_bad(1).disp('serverName')
    c.auth('authType').username('username').password('password').ignore_robots_txt.check_first_only.check_no_extern
    c.check_ignore_case.ignore_cookies.not_ignore_www.check_parent_dir.ignore_relative.get_after_head_fail
    c.check_restrict('checkLevel').size_limit_above.size_limit_below('sizeLimit').limit_links('linkType', 'n')
    c.skip_slow_links.check_only('wildcards').skip_files('wildcards').skip_domains([:domain1, :domain2])
    c.skip_bookmarks([:bookmark1, :bookmark2]).ignore_form_tag.not_ignore_spaces.ini('iniFile').flc('flcFile').cache
    c.print_broken.user_agent('agentName').report('reportType').from('address').subject('subject').attach.start_tls
    c.verbosely.columns('columns').sort('sortColumns').unprocessed.filename('filename')
    c.email('email', 'port', 'username', 'password').help
    actual = c.to_s
    assert_command expected, actual
  end

end