# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder_config')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  module FastLinkChecker
    module V21
      VERSION = '2.1'
      @@config = CommandBuilderConfig.new FluentCommandBuilder::FastLinkChecker::COMMAND_NAME, VERSION
      @@config.version_detector = FluentCommandBuilder::FastLinkChecker.version_detector
      def configure_fastlinkchecker
        yield @@config
        @@config.validate
      end
      def fastlinkchecker
        b = UnderlyingBuilder.new @@config
        c = FastLinkChecker.new(b)
        yield b if block_given?
        c
      end
      class FastLinkChecker < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def site(url)
          @b.append " --site #{@b.format url}"
          yield @b if block_given?
          self
        end
        def check_hyperlinks
          @b.append ' -checkHyperlinks'
          yield @b if block_given?
          self
        end
        def check_images
          @b.append ' -checkImages'
          yield @b if block_given?
          self
        end
        def check_others
          @b.append ' -checkOthers'
          yield @b if block_given?
          self
        end
        def recheck_bad(recheck_times)
          @b.append " -recheckBad #{@b.format recheck_times}"
          yield @b if block_given?
          self
        end
        def disp(server_name)
          @b.append " -disp #{@b.format server_name}"
          yield @b if block_given?
          self
        end
        def auth(auth_type)
          @b.append " -auth #{@b.format auth_type}"
          yield @b if block_given?
          self
        end
        def username(username)
          @b.append " -user #{@b.format username}"
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -pwd #{@b.format_password password}"
          yield @b if block_given?
          self
        end
        def ignore_robots_txt
          @b.append ' -ignoreRobotsTxt'
          yield @b if block_given?
          self
        end
        def check_first_only
          @b.append ' -checkFirstOnly'
          yield @b if block_given?
          self
        end
        def check_no_extern
          @b.append ' -checkNoExtern'
          yield @b if block_given?
          self
        end
        def check_ignore_case
          @b.append ' -checkIgnoreCase'
          yield @b if block_given?
          self
        end
        def ignore_cookies
          @b.append ' -ignoreCookies'
          yield @b if block_given?
          self
        end
        def not_ignore_www
          @b.append ' -notIgnoreWww'
          yield @b if block_given?
          self
        end
        def check_parent_dir
          @b.append ' -checkParentDir'
          yield @b if block_given?
          self
        end
        def ignore_relative
          @b.append ' -ignoreRelative'
          yield @b if block_given?
          self
        end
        def get_after_head_fail
          @b.append ' -getAfterHeadFail'
          yield @b if block_given?
          self
        end
        def check_restrict(check_level)
          @b.append " -checkRestrict #{@b.format check_level}"
          yield @b if block_given?
          self
        end
        def size_limit_above
          @b.append ' -sizeLimitAbove'
          yield @b if block_given?
          self
        end
        def size_limit_below(size_limit_kb)
          @b.append " -sizeLimitBelow #{@b.format size_limit_kb}"
          yield @b if block_given?
          self
        end
        def limit_links(link_type, n)
          @b.append " -limitLinks #{@b.format link_type} #{@b.format n}"
          yield @b if block_given?
          self
        end
        def skip_slow_links
          @b.append ' -skipSlowLinks'
          yield @b if block_given?
          self
        end
        def check_only(wildcards)
          @b.append " -checkOnly #{@b.format wildcards}"
          yield @b if block_given?
          self
        end
        def skip_files(wildcards)
          @b.append " -skipFiles #{@b.format wildcards}"
          yield @b if block_given?
          self
        end
        def skip_domains(domains)
          @b.append " -skipDomains #{@b.format domains, ';'}"
          yield @b if block_given?
          self
        end
        def skip_bookmarks(bookmarks)
          @b.append " -skipBookmarks #{@b.format bookmarks, ';'}"
          yield @b if block_given?
          self
        end
        def ignore_form_tag
          @b.append ' -ignoreFormTag'
          yield @b if block_given?
          self
        end
        def not_ignore_spaces
          @b.append ' -notIgnoreSpaces'
          yield @b if block_given?
          self
        end
        def ini(ini_file)
          @b.append " --ini #{@b.format ini_file}"
          yield @b if block_given?
          self
        end
        def flc(flc_file)
          @b.append " --flc #{@b.format flc_file}"
          yield @b if block_given?
          self
        end
        def cache
          @b.append ' --cache'
          yield @b if block_given?
          self
        end
        def verbosely
          @b.append ' --verbosely'
          yield @b if block_given?
          self
        end
        def print_broken
          @b.append ' --printBroken'
          yield @b if block_given?
          self
        end
        def user_agent(agent_name)
          @b.append " --userAgent #{@b.format agent_name}"
          yield @b if block_given?
          self
        end
        def report(report_type)
          @b.append " --report #{@b.format report_type}"
          yield @b if block_given?
          self
        end
        def from(address)
          @b.append " -from #{@b.format address}"
          yield @b if block_given?
          self
        end
        def subject(subject)
          @b.append " -subject #{@b.format subject}"
          yield @b if block_given?
          self
        end
        def attach
          @b.append ' -attach'
          yield @b if block_given?
          self
        end
        def start_tls
          @b.append ' -startTls'
          yield @b if block_given?
          self
        end
        def columns(columns)
          @b.append " -columns #{@b.format columns}"
          yield @b if block_given?
          self
        end
        def sort(sort_columns)
          @b.append " -sort #{@b.format sort_columns}"
          yield @b if block_given?
          self
        end
        def unprocessed
          @b.append ' -unprocessed'
          yield @b if block_given?
          self
        end
        def filename(filename)
          @b.append " #{@b.format filename}"
          yield @b if block_given?
          self
        end
        def email(email, port=nil, username=nil, password=nil)
          @b.append " #{@b.format email}"
          @b.append " smtpserver:#{@b.format port} #{@b.format username} #{@b.format_password password}" unless port.nil? or username.nil? or password.nil?
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -h'
          yield @b if block_given?
          self
        end
      end

    end
  end
end