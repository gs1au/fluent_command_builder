# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../printer')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def nuget_20
    FluentCommandBuilder::NuGet::V20.create { |b| yield b if block_given? }
  end
  module NuGet
    module V20
      VERSION = '2.0'
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        printer = FluentCommandBuilder::Printer.new
        begin
          printer.print_warning %Q[Default Path for command "#{FluentCommandBuilder::NuGet::COMMAND_NAME}", version "#{VERSION}" does not exist. Path: #{value}] unless File.exist? value
        rescue
          printer.print_warning %Q[Failed to determine whether Default Path for command "#{FluentCommandBuilder::NuGet::COMMAND_NAME}", version "#{VERSION}" exists. An internal error occurred.]
        end
        @default_path = value
      end
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::NuGet::COMMAND_NAME, VERSION
        b.path = self.default_path
        b.actual_version_lambda = lambda { |path| FluentCommandBuilder::NuGet.version path }
        c = NuGet.new(b)
        yield b if block_given?
        c
      end
      def nuget
        FluentCommandBuilder::NuGet::V20.create { |b| yield b if block_given? }
      end
      class NuGet < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def config
          Config.new @b
        end
        def delete(package_id, package_version)
          Delete.new @b, package_id, package_version
        end
        def help(command=nil)
          Help.new @b, command
        end
        def install(package_id_or_path_to_packages_config)
          Install.new @b, package_id_or_path_to_packages_config
        end
        def list(search_terms=nil)
          List.new @b, search_terms
        end
        def pack(nuspec_or_project)
          Pack.new @b, nuspec_or_project
        end
        def publish(package_id, package_version, api_key)
          Publish.new @b, package_id, package_version, api_key
        end
        def push(package_path)
          Push.new @b, package_path
        end
        def set_api_key(api_key)
          SetApiKey.new @b, api_key
        end
        def sources(action)
          Sources.new @b, action
        end
        def spec(package_id)
          Spec.new @b, package_id
        end
        def update(packages_config_or_solution)
          Update.new @b, packages_config_or_solution
        end
      end
      class Config < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' config'
        end
        def set(name, value)
          @b.append " -Set #{@b.format name}=#{@b.format value}"
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(underlying_builder, package_id, package_version)
          super underlying_builder
          @b.append " delete #{@b.format package_id} #{@b.format package_version}"
        end
        def source(source)
          @b.append " -Source #{@b.format source}"
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -NoPrompt'
          yield @b if block_given?
          self
        end
        def api_key(api_key)
          @b.append " -ApiKey #{@b.format api_key}"
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class Help < CommandBase
        def initialize(underlying_builder, command=nil)
          super underlying_builder
          @b.append ' help'
          @b.append " #{@b.format command}" unless command.nil?
        end
        def all
          @b.append ' -All'
          yield @b if block_given?
          self
        end
        def markdown
          @b.append ' -Markdown'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class Install < CommandBase
        def initialize(underlying_builder, package_id_or_path_to_packages_config)
          super underlying_builder
          @b.append " install #{@b.format package_id_or_path_to_packages_config}"
        end
        def source(source)
          @b.append " -Source #{@b.format source}"
          yield @b if block_given?
          self
        end
        def output_directory(output_directory)
          @b.append " -OutputDirectory #{@b.format output_directory}"
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " -Version #{@b.format version}"
          yield @b if block_given?
          self
        end
        def exclude_version
          @b.append ' -ExcludeVersion'
          yield @b if block_given?
          self
        end
        def prerelease
          @b.append ' -Prerelease'
          yield @b if block_given?
          self
        end
        def no_cache
          @b.append ' -NoCache'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class List < CommandBase
        def initialize(underlying_builder, search_terms=nil)
          super underlying_builder
          @b.append ' list'
          @b.append " #{@b.format search_terms}" unless search_terms.nil?
        end
        def source(source)
          @b.append " -Source #{@b.format source}"
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' -Verbose'
          yield @b if block_given?
          self
        end
        def all_versions
          @b.append ' -AllVersions'
          yield @b if block_given?
          self
        end
        def prerelease
          @b.append ' -Prerelease'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class Pack < CommandBase
        def initialize(underlying_builder, nuspec_or_project)
          super underlying_builder
          @b.append " pack #{@b.format nuspec_or_project}"
        end
        def output_directory(output_directory)
          @b.append " -OutputDirectory #{@b.format output_directory}"
          yield @b if block_given?
          self
        end
        def base_path(base_path)
          @b.append " -BasePath #{@b.format base_path}"
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' -Verbose'
          yield @b if block_given?
          self
        end
        def version(version)
          @b.append " -Version #{@b.format version}"
          yield @b if block_given?
          self
        end
        def exclude(pattern)
          @b.append " -Exclude #{@b.format pattern}"
          yield @b if block_given?
          self
        end
        def symbols
          @b.append ' -Symbols'
          yield @b if block_given?
          self
        end
        def tool
          @b.append ' -Tool'
          yield @b if block_given?
          self
        end
        def build
          @b.append ' -Build'
          yield @b if block_given?
          self
        end
        def no_default_excludes
          @b.append ' -NoDefaultExcludes'
          yield @b if block_given?
          self
        end
        def no_package_analysis
          @b.append ' -NoPackageAnalysis'
          yield @b if block_given?
          self
        end
        def exclude_empty_directories
          @b.append ' -ExcludeEmptyDirectories'
          yield @b if block_given?
          self
        end
        def properties(properties)
          @b.append " -Properties #{@b.format properties, ';'}"
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class Publish < CommandBase
        def initialize(underlying_builder, package_id, package_version, api_key)
          super underlying_builder
          @b.append " publish #{@b.format package_id} #{@b.format package_version} #{@b.format api_key}"
        end
        def source(source)
          @b.append " -Source #{@b.format source}"
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class Push < CommandBase
        def initialize(underlying_builder, package_path)
          super underlying_builder
          @b.append " push #{@b.format package_path}"
        end
        def create_only
          @b.append ' -CreateOnly'
          yield @b if block_given?
          self
        end
        def source(source)
          @b.append " -Source #{@b.format source}"
          yield @b if block_given?
          self
        end
        def api_key(api_key)
          @b.append " -ApiKey #{@b.format api_key}"
          yield @b if block_given?
          self
        end
        def timeout(seconds)
          @b.append " -Timeout #{@b.format seconds}"
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class SetApiKey < CommandBase
        def initialize(underlying_builder, api_key)
          super underlying_builder
          @b.append " setApiKey #{@b.format api_key}"
        end
        def source(source)
          @b.append " -Source #{@b.format source}"
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class Sources < CommandBase
        def initialize(underlying_builder, action)
          super underlying_builder
          @b.append " sources #{@b.format action}"
        end
        def name(name)
          @b.append " -Name #{@b.format name}"
          yield @b if block_given?
          self
        end
        def source(source)
          @b.append " -Source #{@b.format source}"
          yield @b if block_given?
          self
        end
        def user_name(user_name)
          @b.append " -UserName #{@b.format user_name}"
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -Password #{@b.format_password password}"
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class Spec < CommandBase
        def initialize(underlying_builder, package_id)
          super underlying_builder
          @b.append " spec #{@b.format package_id}"
        end
        def assembly_path(assembly_path)
          @b.append " -AssemblyPath #{@b.format assembly_path}"
          yield @b if block_given?
          self
        end
        def force
          @b.append ' -Force'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end
      class Update < CommandBase
        def initialize(underlying_builder, packages_config_or_solution)
          super underlying_builder
          @b.append " update #{@b.format packages_config_or_solution}"
        end
        def source(source)
          @b.append " -Source #{@b.format source}"
          yield @b if block_given?
          self
        end
        def id(package_id)
          @b.append " -Id #{@b.format package_id}"
          yield @b if block_given?
          self
        end
        def repository_path(repository_path)
          @b.append " -RepositoryPath #{@b.format repository_path}"
          yield @b if block_given?
          self
        end
        def safe
          @b.append ' -Safe'
          yield @b if block_given?
          self
        end
        def self
          @b.append ' -Self'
          yield @b if block_given?
          self
        end
        def verbose
          @b.append ' -Verbose'
          yield @b if block_given?
          self
        end
        def prerelease
          @b.append ' -Prerelease'
          yield @b if block_given?
          self
        end
        def help
          @b.append ' -Help'
          yield @b if block_given?
          self
        end
      end

    end
  end
end