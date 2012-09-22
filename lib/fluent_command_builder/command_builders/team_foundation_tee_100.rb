# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder_config')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  module TeamFoundationTEE
    module V100
      VERSION = '10.0'
      @@config = CommandBuilderConfig.new FluentCommandBuilder::TeamFoundationTEE::COMMAND_NAME, VERSION
      @@config.version_detector = FluentCommandBuilder::TeamFoundationTEE.version_detector
      def configure_team_foundation_tee
        yield @@config
        @@config.validate_path
        @@config.validate_version
      end
      def team_foundation_tee
        b = UnderlyingBuilder.new @@config
        c = TeamFoundationTEE.new(b)
        yield b if block_given?
        c
      end
      class TeamFoundationTEE < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def add(item_spec)
          Add.new @b, item_spec
        end
        def branch(old_item, new_item)
          Branch.new @b, old_item, new_item
        end
        def branches(item_spec)
          Branches.new @b, item_spec
        end
        def changeset(changeset_number=nil)
          Changeset.new @b, changeset_number
        end
        def checkin(item_spec=nil)
          Checkin.new @b, item_spec
        end
        def checkin_shelveset(shelveset_name, shelveset_owner=nil)
          CheckinShelveset.new @b, shelveset_name, shelveset_owner
        end
        def checkout(item_spec=nil)
          Checkout.new @b, item_spec
        end
        def delete(item_spec)
          Delete.new @b, item_spec
        end
        def destroy(item_spec)
          Destroy.new @b, item_spec
        end
        def compare_with_current_workspace_version(item_spec)
          CompareWithCurrentWorkspaceVersion.new @b, item_spec
        end
        def compare(item_spec, item_spec2)
          Compare.new @b, item_spec, item_spec2
        end
        def compare_with_shelveset_version(shelveset_item_spec)
          CompareWithShelvesetVersion.new @b, shelveset_item_spec
        end
        def configure_compare_tool
          @b.append ' difference -configure'
          yield @b if block_given?
          self
        end
        def dir(item_spec)
          Dir.new @b, item_spec
        end
        def eula
          Eula.new @b
        end
        def get(item_spec=nil)
          Get.new @b, item_spec
        end
        def getcs
          Getcs.new @b
        end
        def help(command=nil)
          Help.new @b, command
        end
        def history(item_spec)
          History.new @b, item_spec
        end
        def label(label_name, item_spec, scope=nil)
          Label.new @b, label_name, item_spec, scope
        end
        def delete_label(label_name, item_spec, scope=nil)
          DeleteLabel.new @b, label_name, item_spec, scope
        end
        def labels(label_name=nil)
          Labels.new @b, label_name
        end
        def lock(item_spec)
          Lock.new @b, item_spec
        end
        def merge(source, destination)
          Merge.new @b, source, destination
        end
        def merges(destination, source=nil)
          Merges.new @b, destination, source
        end
        def print(item_spec)
          Print.new @b, item_spec
        end
        def product_key
          ProductKey.new @b
        end
        def copy_profile(existing_profile_name, new_profile_name)
          @b.append " profile -copy #{@b.format existing_profile_name} #{@b.format new_profile_name}"
          yield @b if block_given?
          self
        end
        def delete_profile(profile_name)
          @b.append " profile -delete #{@b.format profile_name}"
          yield @b if block_given?
          self
        end
        def edit_profile(existing_profile_name)
          EditProfile.new @b, existing_profile_name
        end
        def new_profile(new_profile_name)
          NewProfile.new @b, new_profile_name
        end
        def profiles
          Profiles.new @b
        end
        def properties(item_spec)
          Properties.new @b, item_spec
        end
        def rename(old_item, new_item)
          Rename.new @b, old_item, new_item
        end
        def resolve(item_spec=nil)
          Resolve.new @b, item_spec
        end
        def replace_shelveset(shelveset_name)
          ReplaceShelveset.new @b, shelveset_name
        end
        def shelve(shelveset_name, item_spec)
          Shelve.new @b, shelveset_name, item_spec
        end
        def delete_shelveset(shelveset_name, shelveset_owner=nil)
          DeleteShelveset.new @b, shelveset_name, shelveset_owner
        end
        def shelvesets(shelveset_name=nil)
          Shelvesets.new @b, shelveset_name
        end
        def status(item_spec)
          Status.new @b, item_spec
        end
        def undelete(item_spec, deletion_id=nil)
          Undelete.new @b, item_spec, deletion_id
        end
        def undo(item_spec)
          Undo.new @b, item_spec
        end
        def unlabel(label_name, item_spec)
          Unlabel.new @b, label_name, item_spec
        end
        def unshelve(shelveset_name=nil, username=nil, item_spec=nil)
          Unshelve.new @b, shelveset_name, username, item_spec
        end
        def show_local_folder_mapping(local_folder)
          ShowLocalFolderMapping.new @b, local_folder
        end
        def show_workspace_mappings(workspace_name)
          ShowWorkspaceMappings.new @b, workspace_name
        end
        def show_server_folder_mappings(server_folder)
          ShowServerFolderMappings.new @b, server_folder
        end
        def map_folder(server_folder, local_folder)
          MapFolder.new @b, server_folder, local_folder
        end
        def unmap_folder
          UnmapFolder.new @b
        end
        def cloak_folder(server_folder)
          CloakFolder.new @b, server_folder
        end
        def decloak_folder(server_folder)
          DecloakFolder.new @b, server_folder
        end
        def create_workspace(workspace_name, workspace_owner=nil)
          CreateWorkspace.new @b, workspace_name, workspace_owner
        end
        def delete_workspace(workspace_name, workspace_owner=nil)
          DeleteWorkspace.new @b, workspace_name, workspace_owner
        end
        def modify_workspace(workspace_name=nil, workspace_owner=nil)
          ModifyWorkspace.new @b, workspace_name, workspace_owner
        end
        def workspaces(workspace_name=nil)
          Workspaces.new @b, workspace_name
        end
        def remove_workspace(workspace_name)
          RemoveWorkspace.new @b, workspace_name
        end
      end
      class Add < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " add #{@b.format item_spec}"
        end
        def lock(lock_type)
          @b.append " -lock:#{@b.format lock_type}"
          yield @b if block_given?
          self
        end
        def type(file_type)
          @b.append " -type:#{@b.format file_type}"
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Branch < CommandBase
        def initialize(underlying_builder, old_item, new_item)
          super underlying_builder
          @b.append " branch #{@b.format old_item} #{@b.format new_item}"
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def no_get
          @b.append ' -noGet'
          yield @b if block_given?
          self
        end
        def lock(lock_type)
          @b.append " -lock:#{@b.format lock_type}"
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def silent
          @b.append ' -silent'
          yield @b if block_given?
          self
        end
        def checkin
          @b.append ' -checkin'
          yield @b if block_given?
          self
        end
        def comment(comment)
          @b.append " -comment:#{@b.format comment}"
          yield @b if block_given?
          self
        end
        def author(author_name)
          @b.append " -author:#{@b.format author_name}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Branches < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " branches #{@b.format item_spec}"
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Changeset < CommandBase
        def initialize(underlying_builder, changeset_number=nil)
          super underlying_builder
          @b.append ' changeset'
          @b.append " #{@b.format changeset_number}" unless changeset_number.nil?
        end
        def comment(comment)
          @b.append " -comment:#{@b.format comment}"
          yield @b if block_given?
          self
        end
        def notes(notes)
          @b.append " -notes:#{@b.format notes, ';', '='}"
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def latest
          @b.append ' -latest'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Checkin < CommandBase
        def initialize(underlying_builder, item_spec=nil)
          super underlying_builder
          @b.append ' checkin'
          @b.append " #{@b.format item_spec}" unless item_spec.nil?
        end
        def author(author_name)
          @b.append " -author:#{@b.format author_name}"
          yield @b if block_given?
          self
        end
        def comment(comment)
          @b.append " -comment:#{@b.format comment}"
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def notes(notes)
          @b.append " -notes:#{@b.format notes, ';', '='}"
          yield @b if block_given?
          self
        end
        def override(reason)
          @b.append " -override:#{@b.format reason}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def saved
          @b.append ' -saved'
          yield @b if block_given?
          self
        end
        def validate
          @b.append ' -validate'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class CheckinShelveset < CommandBase
        def initialize(underlying_builder, shelveset_name, shelveset_owner=nil)
          super underlying_builder
          @b.append " checkin -shelveset:#{@b.format shelveset_name}"
          @b.append ";#{@b.format shelveset_owner}" unless shelveset_owner.nil?
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def author(author_name)
          @b.append " -author:#{@b.format author_name}"
          yield @b if block_given?
          self
        end
      end
      class Checkout < CommandBase
        def initialize(underlying_builder, item_spec=nil)
          super underlying_builder
          @b.append ' checkout'
          @b.append " #{@b.format item_spec}" unless item_spec.nil?
        end
        def lock(lock_type)
          @b.append " -lock:#{@b.format lock_type}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def type(encoding)
          @b.append " -type:#{@b.format encoding}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " delete #{@b.format item_spec}"
        end
        def lock(lock_type)
          @b.append " -lock:#{@b.format lock_type}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Destroy < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " destroy #{@b.format item_spec}"
        end
        def keep_history
          @b.append ' -keepHistory'
          yield @b if block_given?
          self
        end
        def stop_at(version_spec)
          @b.append " -stopAt:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def preview
          @b.append ' -preview'
          yield @b if block_given?
          self
        end
        def start_cleanup
          @b.append ' -startCleanup'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def force
          @b.append ' -force'
          yield @b if block_given?
          self
        end
        def silent
          @b.append ' -silent'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class CompareWithCurrentWorkspaceVersion < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " difference #{@b.format item_spec}"
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def type(file_type)
          @b.append " -type:#{@b.format file_type}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def ignore_space
          @b.append ' -ignoreSpace'
          yield @b if block_given?
          self
        end
        def ignore_eol
          @b.append ' -ignoreEol'
          yield @b if block_given?
          self
        end
        def ignore_case
          @b.append ' -ignoreCase'
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def options
          @b.append ' -options'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Compare < CommandBase
        def initialize(underlying_builder, item_spec, item_spec2)
          super underlying_builder
          @b.append " difference #{@b.format item_spec} #{@b.format item_spec2}"
        end
        def type(file_type)
          @b.append " -type:#{@b.format file_type}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def ignore_space
          @b.append ' -ignoreSpace'
          yield @b if block_given?
          self
        end
        def ignore_eol
          @b.append ' -ignoreEol'
          yield @b if block_given?
          self
        end
        def ignore_case
          @b.append ' -ignoreCase'
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def options
          @b.append ' -options'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class CompareWithShelvesetVersion < CommandBase
        def initialize(underlying_builder, shelveset_item_spec)
          super underlying_builder
          @b.append " difference #{@b.format shelveset_item_spec}"
        end
        def shelveset(shelveset_name, shelveset_owner=nil)
          @b.append " -shelveset:#{@b.format shelveset_name}"
          @b.append ";#{@b.format shelveset_owner}" unless shelveset_owner.nil?
          yield @b if block_given?
          self
        end
        def type(file_type)
          @b.append " -type:#{@b.format file_type}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def ignore_space
          @b.append ' -ignoreSpace'
          yield @b if block_given?
          self
        end
        def ignore_eol
          @b.append ' -ignoreEol'
          yield @b if block_given?
          self
        end
        def ignore_case
          @b.append ' -ignoreCase'
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def options
          @b.append ' -options'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Dir < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " dir #{@b.format item_spec}"
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def folders
          @b.append ' -folders'
          yield @b if block_given?
          self
        end
        def deleted
          @b.append ' -deleted'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class Eula < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' eula'
        end
        def accept
          @b.append ' -accept'
          yield @b if block_given?
          self
        end
      end
      class Get < CommandBase
        def initialize(underlying_builder, item_spec=nil)
          super underlying_builder
          @b.append ' get'
          @b.append " #{@b.format item_spec}" unless item_spec.nil?
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def all
          @b.append ' -all'
          yield @b if block_given?
          self
        end
        def overwrite
          @b.append ' -overwrite'
          yield @b if block_given?
          self
        end
        def force
          @b.append ' -force'
          yield @b if block_given?
          self
        end
        def preview
          @b.append ' -preview'
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def remap
          @b.append ' -remap'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Getcs < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' getcs'
        end
        def changeset(changeset_number)
          @b.append " -changeset:#{@b.format changeset_number}"
          yield @b if block_given?
          self
        end
        def latest
          @b.append ' -latest'
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
        def listexitcodes
          @b.append ' -listexitcodes]'
          yield @b if block_given?
          self
        end
      end
      class History < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " history #{@b.format item_spec}"
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def stop_after(number)
          @b.append " -stopAfter:#{@b.format number}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def user(user_name)
          @b.append " -user:#{@b.format user_name}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def slot_mode
          @b.append ' -slotMode'
          yield @b if block_given?
          self
        end
        def item_mode
          @b.append ' -itemMode'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def sort(sort)
          @b.append " -sort:#{@b.format sort}"
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class Label < CommandBase
        def initialize(underlying_builder, label_name, item_spec, scope=nil)
          super underlying_builder
          @b.append " label #{@b.format label_name}"
          @b.append "@#{@b.format scope}" unless scope.nil?
          @b.append " #{@b.format item_spec}"
        end
        def owner(owner_name)
          @b.append " -owner:#{@b.format owner_name}"
          yield @b if block_given?
          self
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def comment(comment)
          @b.append " -comment:#{@b.format comment}"
          yield @b if block_given?
          self
        end
        def child(lock_type)
          @b.append " -child:#{@b.format lock_type}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class DeleteLabel < CommandBase
        def initialize(underlying_builder, label_name, item_spec, scope=nil)
          super underlying_builder
          @b.append " label -delete #{@b.format label_name}"
          @b.append "@#{@b.format scope}" unless scope.nil?
          @b.append " #{@b.format item_spec}"
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class Labels < CommandBase
        def initialize(underlying_builder, label_name=nil)
          super underlying_builder
          @b.append ' labels'
          @b.append " #{@b.format label_name}" unless label_name.nil?
        end
        def owner(owner_name)
          @b.append " -owner:#{@b.format owner_name}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Lock < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " lock #{@b.format item_spec}"
        end
        def lock(lock_type)
          @b.append " -lock:#{@b.format lock_type}"
          yield @b if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @b.append " -workspace:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class Merge < CommandBase
        def initialize(underlying_builder, source, destination)
          super underlying_builder
          @b.append " merge #{@b.format source} #{@b.format destination}"
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def force
          @b.append ' -force'
          yield @b if block_given?
          self
        end
        def candidate
          @b.append ' -candidate'
          yield @b if block_given?
          self
        end
        def discard
          @b.append ' -discard'
          yield @b if block_given?
          self
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def lock(lock_type)
          @b.append " -lock:#{@b.format lock_type}"
          yield @b if block_given?
          self
        end
        def preview
          @b.append ' -preview'
          yield @b if block_given?
          self
        end
        def baseless
          @b.append ' -baseless'
          yield @b if block_given?
          self
        end
        def no_summary
          @b.append ' -noSummary'
          yield @b if block_given?
          self
        end
        def no_implicit_baseless
          @b.append ' -noImplicitBaseless'
          yield @b if block_given?
          self
        end
        def conservative
          @b.append ' -conservative'
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Merges < CommandBase
        def initialize(underlying_builder, destination, source=nil)
          super underlying_builder
          @b.append ' merges'
          @b.append " #{@b.format source}" unless source.nil?
          @b.append " #{@b.format destination}"
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def extended
          @b.append ' -extended'
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def show_all
          @b.append ' -showAll'
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class Print < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " print #{@b.format item_spec}"
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
      end
      class ProductKey < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' productKey'
        end
        def set(my_product_key)
          @b.append " -set:#{@b.format my_product_key}"
          yield @b if block_given?
          self
        end
        def trial
          @b.append ' -trial'
          yield @b if block_given?
          self
        end
      end
      class EditProfile < CommandBase
        def initialize(underlying_builder, existing_profile_name)
          super underlying_builder
          @b.append " profile -edit #{@b.format existing_profile_name}"
        end
        def string(property_name, value)
          @b.append " -string:#{@b.format property_name}=#{@b.format value}"
          yield @b if block_given?
          self
        end
        def boolean(property_name, value)
          @b.append " -boolean:#{@b.format property_name}=#{@b.format value}"
          yield @b if block_given?
          self
        end
        def number(property_name, value)
          @b.append " -number:#{@b.format property_name}=#{@b.format value}"
          yield @b if block_given?
          self
        end
      end
      class NewProfile < CommandBase
        def initialize(underlying_builder, new_profile_name)
          super underlying_builder
          @b.append " profile -new #{@b.format new_profile_name}"
        end
        def string(property_name, value)
          @b.append " -string:#{@b.format property_name}=#{@b.format value}"
          yield @b if block_given?
          self
        end
        def boolean(property_name, value)
          @b.append " -boolean:#{@b.format property_name}=#{@b.format value}"
          yield @b if block_given?
          self
        end
        def number(property_name, value)
          @b.append " -number:#{@b.format property_name}=#{@b.format value}"
          yield @b if block_given?
          self
        end
      end
      class Profiles < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' profiles'
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
      end
      class Properties < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " properties #{@b.format item_spec}"
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def version(version_spec)
          @b.append " -version:#{@b.format version_spec}"
          yield @b if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @b.append " -workspace:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
      end
      class Rename < CommandBase
        def initialize(underlying_builder, old_item, new_item)
          super underlying_builder
          @b.append " rename #{@b.format old_item} #{@b.format new_item}"
        end
        def lock(lock_type)
          @b.append " -lock:#{@b.format lock_type}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Resolve < CommandBase
        def initialize(underlying_builder, item_spec=nil)
          super underlying_builder
          @b.append ' resolve'
          @b.append " #{@b.format item_spec}" unless item_spec.nil?
        end
        def auto(resolution)
          @b.append " -auto:#{@b.format resolution}"
          yield @b if block_given?
          self
        end
        def preview
          @b.append ' -preview'
          yield @b if block_given?
          self
        end
        def override_type(override_type)
          @b.append " -overrideType:#{@b.format override_type}"
          yield @b if block_given?
          self
        end
        def convert_to_type(convert_type)
          @b.append " -convertToType:#{@b.format convert_type}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def new_name(path)
          @b.append " -newName:#{@b.format path}"
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class ReplaceShelveset < CommandBase
        def initialize(underlying_builder, shelveset_name)
          super underlying_builder
          @b.append " shelve -replace #{@b.format shelveset_name}"
        end
        def comment(comment)
          @b.append " -comment:#{@b.format comment}"
          yield @b if block_given?
          self
        end
        def validate
          @b.append ' -validate'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Shelve < CommandBase
        def initialize(underlying_builder, shelveset_name, item_spec)
          super underlying_builder
          @b.append " shelve #{@b.format shelveset_name} #{@b.format item_spec}"
        end
        def move
          @b.append ' -move'
          yield @b if block_given?
          self
        end
        def replace
          @b.append ' -replace'
          yield @b if block_given?
          self
        end
        def comment(comment)
          @b.append " -comment:#{@b.format comment}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def validate
          @b.append ' -validate'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class DeleteShelveset < CommandBase
        def initialize(underlying_builder, shelveset_name, shelveset_owner=nil)
          super underlying_builder
          @b.append " shelve -delete #{@b.format shelveset_name}"
          @b.append ";#{@b.format shelveset_owner}" unless shelveset_owner.nil?
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class Shelvesets < CommandBase
        def initialize(underlying_builder, shelveset_name=nil)
          super underlying_builder
          @b.append ' shelvesets'
          @b.append " #{@b.format shelveset_name}" unless shelveset_name.nil?
        end
        def owner(owner_name)
          @b.append " -owner:#{@b.format owner_name}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Status < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " status #{@b.format item_spec}"
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @b.append " -workspace:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
        def shelveset(shelveset_name, shelveset_owner=nil)
          @b.append " -shelveset:#{@b.format shelveset_name}"
          @b.append ";#{@b.format shelveset_owner}" unless shelveset_owner.nil?
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def user(user_name)
          @b.append " -user:#{@b.format user_name}"
          yield @b if block_given?
          self
        end
      end
      class Undelete < CommandBase
        def initialize(underlying_builder, item_spec, deletion_id=nil)
          super underlying_builder
          @b.append " undelete #{@b.format item_spec}"
          @b.append ";#{@b.format deletion_id}" unless deletion_id.nil?
        end
        def no_get
          @b.append ' -noGet'
          yield @b if block_given?
          self
        end
        def lock(lock_type)
          @b.append " -lock:#{@b.format lock_type}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Undo < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @b.append " undo #{@b.format item_spec}"
        end
        def workspace(workspace_name, workspace_owner=nil)
          @b.append " -workspace:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class Unlabel < CommandBase
        def initialize(underlying_builder, label_name, item_spec)
          super underlying_builder
          @b.append " unlabel #{@b.format label_name} #{@b.format item_spec}"
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class Unshelve < CommandBase
        def initialize(underlying_builder, shelveset_name=nil, username=nil, item_spec=nil)
          super underlying_builder
          @b.append ' unshelve'
          @b.append " #{@b.format shelveset_name}" unless shelveset_name.nil?
          @b.append ";#{@b.format username}" unless username.nil?
          @b.append " #{@b.format item_spec}" unless item_spec.nil?
        end
        def move
          @b.append ' -move'
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class ShowLocalFolderMapping < CommandBase
        def initialize(underlying_builder, local_folder)
          super underlying_builder
          @b.append " workfold #{@b.format local_folder}"
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class ShowWorkspaceMappings < CommandBase
        def initialize(underlying_builder, workspace_name)
          super underlying_builder
          @b.append " workfold -workspace:#{@b.format workspace_name}"
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class ShowServerFolderMappings < CommandBase
        def initialize(underlying_builder, server_folder)
          super underlying_builder
          @b.append " workfold #{@b.format server_folder}"
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @b.append " -workspace:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class MapFolder < CommandBase
        def initialize(underlying_builder, server_folder, local_folder)
          super underlying_builder
          @b.append " workfold -map #{@b.format server_folder} #{@b.format local_folder}"
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @b.append " -workspace:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class UnmapFolder < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' workfold -unmap'
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @b.append " -workspace:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def recursive
          @b.append ' -recursive'
          yield @b if block_given?
          self
        end
      end
      class CloakFolder < CommandBase
        def initialize(underlying_builder, server_folder)
          super underlying_builder
          @b.append " workfold -cloak #{@b.format server_folder}"
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @b.append " -workspace:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class DecloakFolder < CommandBase
        def initialize(underlying_builder, server_folder)
          super underlying_builder
          @b.append " workfold -decloak #{@b.format server_folder}"
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @b.append " -workspace:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end
      class CreateWorkspace < CommandBase
        def initialize(underlying_builder, workspace_name, workspace_owner=nil)
          super underlying_builder
          @b.append " workspace -new #{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
        end
        def no_prompt
          @b.append ' -noPrompt'
          yield @b if block_given?
          self
        end
        def template(workspace_name, workspace_owner=nil)
          @b.append " -template:#{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
          yield @b if block_given?
          self
        end
        def computer(computer_name)
          @b.append " -computer:#{@b.format computer_name}"
          yield @b if block_given?
          self
        end
        def comment(comment)
          @b.append " -comment:#{@b.format comment}"
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def permission(permission)
          @b.append " -permission:#{@b.format permission}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class DeleteWorkspace < CommandBase
        def initialize(underlying_builder, workspace_name, workspace_owner=nil)
          super underlying_builder
          @b.append " workspace -delete #{@b.format workspace_name}"
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class ModifyWorkspace < CommandBase
        def initialize(underlying_builder, workspace_name=nil, workspace_owner=nil)
          super underlying_builder
          @b.append ' workspace '
          @b.append "#{@b.format workspace_name}" unless workspace_name.nil?
          @b.append ";#{@b.format workspace_owner}" unless workspace_owner.nil?
        end
        def computer(computer_name)
          @b.append " -computer:#{@b.format computer_name}"
          yield @b if block_given?
          self
        end
        def comment(comment)
          @b.append " -comment:#{@b.format comment}"
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def permission(permission)
          @b.append " -permission:#{@b.format permission}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
        def new_name(workspace_name)
          @b.append " -newName:#{@b.format workspace_name}"
          yield @b if block_given?
          self
        end
        def new_owner(owner_name)
          @b.append " -newOwner:#{@b.format owner_name}"
          yield @b if block_given?
          self
        end
      end
      class Workspaces < CommandBase
        def initialize(underlying_builder, workspace_name=nil)
          super underlying_builder
          @b.append ' workspaces'
          @b.append " #{@b.format workspace_name}" unless workspace_name.nil?
        end
        def owner(owner_name)
          @b.append " -owner:#{@b.format owner_name}"
          yield @b if block_given?
          self
        end
        def computer(computer_name)
          @b.append " -computer:#{@b.format computer_name}"
          yield @b if block_given?
          self
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -format:#{@b.format format}"
          yield @b if block_given?
          self
        end
        def update_user_name(old_user_name)
          @b.append " -updateUserName:#{@b.format old_user_name}"
          yield @b if block_given?
          self
        end
        def update_computer_name(old_computer_name)
          @b.append " -updateComputerName:#{@b.format old_computer_name}"
          yield @b if block_given?
          self
        end
        def login(username, password=nil)
          @b.append " -login:#{@b.format username}"
          @b.append ",#{@b.format_password password}" unless password.nil?
          yield @b if block_given?
          self
        end
      end
      class RemoveWorkspace < CommandBase
        def initialize(underlying_builder, workspace_name)
          super underlying_builder
          @b.append " workspaces -remove:#{@b.format workspace_name, ','}"
        end
        def collection(team_project_collection_url)
          @b.append " -collection:#{@b.format team_project_collection_url}"
          yield @b if block_given?
          self
        end
      end

    end
  end
end