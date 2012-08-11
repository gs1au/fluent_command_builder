require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def tf_tee_2010
    b = UnderlyingBuilder.new
    c = FluentCommandBuilder::Tf::TEE2010.create b
    yield b if block_given?
    c
  end
  module Tf
    module TEE2010
      def self.create(underlying_builder)
        Tf.new underlying_builder
      end
      def tf
        b = UnderlyingBuilder.new
        c = FluentCommandBuilder::Tf::TEE2010.create b
        yield b if block_given?
        c
      end
      class Tf < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'tf'
        end
        def add(item_spec)
          Add.new @builder, item_spec
        end
        def branch(old_item, new_item)
          Branch.new @builder, old_item, new_item
        end
        def branches(item_spec)
          Branches.new @builder, item_spec
        end
        def changeset(changeset_number=nil)
          Changeset.new @builder, changeset_number
        end
        def checkin(item_spec=nil)
          Checkin.new @builder, item_spec
        end
        def checkin_shelveset(shelveset_name, shelveset_owner=nil)
          CheckinShelveset.new @builder, shelveset_name, shelveset_owner
        end
        def checkout(item_spec=nil)
          Checkout.new @builder, item_spec
        end
        def delete(item_spec)
          Delete.new @builder, item_spec
        end
        def destroy(item_spec)
          Destroy.new @builder, item_spec
        end
        def compare_with_current_workspace_version(item_spec)
          CompareWithCurrentWorkspaceVersion.new @builder, item_spec
        end
        def compare(item_spec, item_spec2)
          Compare.new @builder, item_spec, item_spec2
        end
        def compare_with_shelveset_version(shelveset_item_spec)
          CompareWithShelvesetVersion.new @builder, shelveset_item_spec
        end
        def configure_compare_tool
          @builder.append ' difference -configure'
          yield @builder if block_given?
          self
        end
        def dir(item_spec)
          Dir.new @builder, item_spec
        end
        def eula
          Eula.new @builder
        end
        def get(item_spec=nil)
          Get.new @builder, item_spec
        end
        def getcs
          Getcs.new @builder
        end
        def history(item_spec)
          History.new @builder, item_spec
        end
        def label(label_name, item_spec, scope=nil)
          Label.new @builder, label_name, item_spec, scope
        end
        def delete_label(label_name, item_spec, scope=nil)
          DeleteLabel.new @builder, label_name, item_spec, scope
        end
        def labels(label_name=nil)
          Labels.new @builder, label_name
        end
        def lock(item_spec)
          Lock.new @builder, item_spec
        end
        def merge(source, destination)
          Merge.new @builder, source, destination
        end
        def merges(destination, source=nil)
          Merges.new @builder, destination, source
        end
        def print(item_spec)
          Print.new @builder, item_spec
        end
        def product_key
          ProductKey.new @builder
        end
        def copy_profile(existing_profile_name, new_profile_name)
          @builder.append " profile -copy #{@builder.format existing_profile_name} #{@builder.format new_profile_name}"
          yield @builder if block_given?
          self
        end
        def delete_profile(profile_name)
          @builder.append " profile -delete #{@builder.format profile_name}"
          yield @builder if block_given?
          self
        end
        def edit_profile(existing_profile_name)
          EditProfile.new @builder, existing_profile_name
        end
        def new_profile(new_profile_name)
          NewProfile.new @builder, new_profile_name
        end
        def profiles
          Profiles.new @builder
        end
        def properties(item_spec)
          Properties.new @builder, item_spec
        end
        def reconcile
          Reconcile.new @builder
        end
        def reconcile_build(build_name, item_spec=nil)
          ReconcileBuild.new @builder, build_name, item_spec
        end
        def reconcile_changeset(changeset_name, item_spec=nil)
          ReconcileChangeset.new @builder, changeset_name, item_spec
        end
        def reconcile_forget_build(build_name, item_spec=nil)
          ReconcileForgetBuild.new @builder, build_name, item_spec
        end
        def rename(old_item, new_item)
          Rename.new @builder, old_item, new_item
        end
        def resolve(item_spec=nil)
          Resolve.new @builder, item_spec
        end
        def replace_shelveset(shelveset_name)
          ReplaceShelveset.new @builder, shelveset_name
        end
        def shelve(shelveset_name, item_spec)
          Shelve.new @builder, shelveset_name, item_spec
        end
        def delete_shelveset(shelveset_name, shelveset_owner=nil)
          DeleteShelveset.new @builder, shelveset_name, shelveset_owner
        end
        def shelvesets(shelveset_name=nil)
          Shelvesets.new @builder, shelveset_name
        end
        def status(item_spec)
          Status.new @builder, item_spec
        end
        def undelete(item_spec, deletion_id=nil)
          Undelete.new @builder, item_spec, deletion_id
        end
        def undo(item_spec)
          Undo.new @builder, item_spec
        end
        def unlabel(label_name, item_spec)
          Unlabel.new @builder, label_name, item_spec
        end
        def unshelve(shelveset_name=nil, username=nil, item_spec=nil)
          Unshelve.new @builder, shelveset_name, username, item_spec
        end
        def show_local_folder_mapping(local_folder)
          ShowLocalFolderMapping.new @builder, local_folder
        end
        def show_workspace_mappings(workspace_name)
          ShowWorkspaceMappings.new @builder, workspace_name
        end
        def show_server_folder_mappings(server_folder)
          ShowServerFolderMappings.new @builder, server_folder
        end
        def map_folder(server_folder, local_folder)
          MapFolder.new @builder, server_folder, local_folder
        end
        def unmap_folder
          UnmapFolder.new @builder
        end
        def cloak_folder(server_folder)
          CloakFolder.new @builder, server_folder
        end
        def decloak_folder(server_folder)
          DecloakFolder.new @builder, server_folder
        end
        def create_workspace(workspace_name, workspace_owner=nil)
          CreateWorkspace.new @builder, workspace_name, workspace_owner
        end
        def delete_workspace(workspace_name, workspace_owner=nil)
          DeleteWorkspace.new @builder, workspace_name, workspace_owner
        end
        def modify_workspace(workspace_name=nil, workspace_owner=nil)
          ModifyWorkspace.new @builder, workspace_name, workspace_owner
        end
        def workspaces(workspace_name=nil)
          Workspaces.new @builder, workspace_name
        end
        def remove_workspace(workspace_name)
          RemoveWorkspace.new @builder, workspace_name
        end
      end
      class Add < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " add #{@builder.format item_spec}"
        end
        def lock(lock_type)
          @builder.append " -lock:#{@builder.format lock_type}"
          yield @builder if block_given?
          self
        end
        def type(file_type)
          @builder.append " -type:#{@builder.format file_type}"
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Branch < CommandBase
        def initialize(underlying_builder, old_item, new_item)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " branch #{@builder.format old_item} #{@builder.format new_item}"
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def no_get
          @builder.append ' -noGet'
          yield @builder if block_given?
          self
        end
        def lock(lock_type)
          @builder.append " -lock:#{@builder.format lock_type}"
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def silent
          @builder.append ' -silent'
          yield @builder if block_given?
          self
        end
        def checkin
          @builder.append ' -checkin'
          yield @builder if block_given?
          self
        end
        def comment(comment)
          @builder.append " -comment:#{@builder.format comment}"
          yield @builder if block_given?
          self
        end
        def author(author_name)
          @builder.append " -author:#{@builder.format author_name}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Branches < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " branches #{@builder.format item_spec}"
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Changeset < CommandBase
        def initialize(underlying_builder, changeset_number=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' changeset'
          @builder.append " #{@builder.format changeset_number}" unless changeset_number.nil?
        end
        def comment(comment)
          @builder.append " -comment:#{@builder.format comment}"
          yield @builder if block_given?
          self
        end
        def notes(notes)
          @builder.append " -notes:#{@builder.format notes, ';', '='}"
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def latest
          @builder.append ' -latest'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Checkin < CommandBase
        def initialize(underlying_builder, item_spec=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' checkin'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def author(author_name)
          @builder.append " -author:#{@builder.format author_name}"
          yield @builder if block_given?
          self
        end
        def comment(comment)
          @builder.append " -comment:#{@builder.format comment}"
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def notes(notes)
          @builder.append " -notes:#{@builder.format notes, ';', '='}"
          yield @builder if block_given?
          self
        end
        def override(reason)
          @builder.append " -override:#{@builder.format reason}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def saved
          @builder.append ' -saved'
          yield @builder if block_given?
          self
        end
        def validate
          @builder.append ' -validate'
          yield @builder if block_given?
          self
        end
        def bypass
          @builder.append ' -bypass'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def force
          @builder.append ' -force'
          yield @builder if block_given?
          self
        end
      end
      class CheckinShelveset < CommandBase
        def initialize(underlying_builder, shelveset_name, shelveset_owner=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " checkin -shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
        end
        def bypass
          @builder.append ' -bypass'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def author(author_name)
          @builder.append " -author:#{@builder.format author_name}"
          yield @builder if block_given?
          self
        end
        def force
          @builder.append ' -force'
          yield @builder if block_given?
          self
        end
      end
      class Checkout < CommandBase
        def initialize(underlying_builder, item_spec=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' checkout'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def lock(lock_type)
          @builder.append " -lock:#{@builder.format lock_type}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def type(encoding)
          @builder.append " -type:#{@builder.format encoding}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " delete #{@builder.format item_spec}"
        end
        def lock(lock_type)
          @builder.append " -lock:#{@builder.format lock_type}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Destroy < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " destroy #{@builder.format item_spec}"
        end
        def keep_history
          @builder.append ' -keepHistory'
          yield @builder if block_given?
          self
        end
        def stop_at(version_spec)
          @builder.append " -stopAt:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def preview
          @builder.append ' -preview'
          yield @builder if block_given?
          self
        end
        def start_cleanup
          @builder.append ' -startCleanup'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def silent
          @builder.append ' -silent'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class CompareWithCurrentWorkspaceVersion < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " difference #{@builder.format item_spec}"
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def type(file_type)
          @builder.append " -type:#{@builder.format file_type}"
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def ignore_space
          @builder.append ' -ignoreSpace'
          yield @builder if block_given?
          self
        end
        def ignore_eol
          @builder.append ' -ignoreEol'
          yield @builder if block_given?
          self
        end
        def ignore_case
          @builder.append ' -ignoreCase'
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def options
          @builder.append ' -options'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Compare < CommandBase
        def initialize(underlying_builder, item_spec, item_spec2)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " difference #{@builder.format item_spec} #{@builder.format item_spec2}"
        end
        def type(file_type)
          @builder.append " -type:#{@builder.format file_type}"
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def ignore_space
          @builder.append ' -ignoreSpace'
          yield @builder if block_given?
          self
        end
        def ignore_eol
          @builder.append ' -ignoreEol'
          yield @builder if block_given?
          self
        end
        def ignore_case
          @builder.append ' -ignoreCase'
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def options
          @builder.append ' -options'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class CompareWithShelvesetVersion < CommandBase
        def initialize(underlying_builder, shelveset_item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " difference #{@builder.format shelveset_item_spec}"
        end
        def shelveset(shelveset_name, shelveset_owner=nil)
          @builder.append " -shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
          yield @builder if block_given?
          self
        end
        def type(file_type)
          @builder.append " -type:#{@builder.format file_type}"
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def ignore_space
          @builder.append ' -ignoreSpace'
          yield @builder if block_given?
          self
        end
        def ignore_eol
          @builder.append ' -ignoreEol'
          yield @builder if block_given?
          self
        end
        def ignore_case
          @builder.append ' -ignoreCase'
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def options
          @builder.append ' -options'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Dir < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " dir #{@builder.format item_spec}"
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def folders
          @builder.append ' -folders'
          yield @builder if block_given?
          self
        end
        def deleted
          @builder.append ' -deleted'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class Eula < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' eula'
        end
        def accept
          @builder.append ' -accept'
          yield @builder if block_given?
          self
        end
      end
      class Get < CommandBase
        def initialize(underlying_builder, item_spec=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' get'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def all
          @builder.append ' -all'
          yield @builder if block_given?
          self
        end
        def overwrite
          @builder.append ' -overwrite'
          yield @builder if block_given?
          self
        end
        def force
          @builder.append ' -force'
          yield @builder if block_given?
          self
        end
        def preview
          @builder.append ' -preview'
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def remap
          @builder.append ' -remap'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Getcs < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' getcs'
        end
        def changeset(changeset_number)
          @builder.append " -changeset:#{@builder.format changeset_number}"
          yield @builder if block_given?
          self
        end
        def latest
          @builder.append ' -latest'
          yield @builder if block_given?
          self
        end
      end
      class History < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " history #{@builder.format item_spec}"
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def stop_after(number)
          @builder.append " -stopAfter:#{@builder.format number}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def user(user_name)
          @builder.append " -user:#{@builder.format user_name}"
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def slot_mode
          @builder.append ' -slotMode'
          yield @builder if block_given?
          self
        end
        def item_mode
          @builder.append ' -itemMode'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def sort(sort)
          @builder.append " -sort:#{@builder.format sort}"
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class Label < CommandBase
        def initialize(underlying_builder, label_name, item_spec, scope=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " label #{@builder.format label_name}"
          @builder.append "@#{@builder.format scope}" unless scope.nil?
          @builder.append " #{@builder.format item_spec}"
        end
        def owner(owner_name)
          @builder.append " -owner:#{@builder.format owner_name}"
          yield @builder if block_given?
          self
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def comment(comment)
          @builder.append " -comment:#{@builder.format comment}"
          yield @builder if block_given?
          self
        end
        def child(lock_type)
          @builder.append " -child:#{@builder.format lock_type}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class DeleteLabel < CommandBase
        def initialize(underlying_builder, label_name, item_spec, scope=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " label -delete #{@builder.format label_name}"
          @builder.append "@#{@builder.format scope}" unless scope.nil?
          @builder.append " #{@builder.format item_spec}"
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class Labels < CommandBase
        def initialize(underlying_builder, label_name=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' labels'
          @builder.append " #{@builder.format label_name}" unless label_name.nil?
        end
        def owner(owner_name)
          @builder.append " -owner:#{@builder.format owner_name}"
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Lock < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " lock #{@builder.format item_spec}"
        end
        def lock(lock_type)
          @builder.append " -lock:#{@builder.format lock_type}"
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class Merge < CommandBase
        def initialize(underlying_builder, source, destination)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " merge #{@builder.format source} #{@builder.format destination}"
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def force
          @builder.append ' -force'
          yield @builder if block_given?
          self
        end
        def candidate
          @builder.append ' -candidate'
          yield @builder if block_given?
          self
        end
        def discard
          @builder.append ' -discard'
          yield @builder if block_given?
          self
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def lock(lock_type)
          @builder.append " -lock:#{@builder.format lock_type}"
          yield @builder if block_given?
          self
        end
        def preview
          @builder.append ' -preview'
          yield @builder if block_given?
          self
        end
        def baseless
          @builder.append ' -baseless'
          yield @builder if block_given?
          self
        end
        def no_summary
          @builder.append ' -noSummary'
          yield @builder if block_given?
          self
        end
        def no_implicit_baseless
          @builder.append ' -noImplicitBaseless'
          yield @builder if block_given?
          self
        end
        def conservative
          @builder.append ' -conservative'
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Merges < CommandBase
        def initialize(underlying_builder, destination, source=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' merges'
          @builder.append " #{@builder.format source}" unless source.nil?
          @builder.append " #{@builder.format destination}"
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def extended
          @builder.append ' -extended'
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def show_all
          @builder.append ' -showAll'
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class Print < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " print #{@builder.format item_spec}"
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
      end
      class ProductKey < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' productKey'
        end
        def set(my_product_key)
          @builder.append " -set:#{@builder.format my_product_key}"
          yield @builder if block_given?
          self
        end
        def trial
          @builder.append ' -trial'
          yield @builder if block_given?
          self
        end
      end
      class EditProfile < CommandBase
        def initialize(underlying_builder, existing_profile_name)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " profile -edit #{@builder.format existing_profile_name}"
        end
        def string(property_name, value)
          @builder.append " -string:#{@builder.format property_name}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
        def boolean(property_name, value)
          @builder.append " -boolean:#{@builder.format property_name}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
        def number(property_name, value)
          @builder.append " -number:#{@builder.format property_name}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
      end
      class NewProfile < CommandBase
        def initialize(underlying_builder, new_profile_name)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " profile -new #{@builder.format new_profile_name}"
        end
        def string(property_name, value)
          @builder.append " -string:#{@builder.format property_name}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
        def boolean(property_name, value)
          @builder.append " -boolean:#{@builder.format property_name}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
        def number(property_name, value)
          @builder.append " -number:#{@builder.format property_name}=#{@builder.format value}"
          yield @builder if block_given?
          self
        end
      end
      class Profiles < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' profiles'
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
      end
      class Properties < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " properties #{@builder.format item_spec}"
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def version(version_spec)
          @builder.append " -version:#{@builder.format version_spec}"
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
      end
      class Reconcile < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' reconcile'
        end
        def team_project(team_project_name)
          @builder.append " -teamProject:#{@builder.format team_project_name}"
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
      end
      class ReconcileBuild < CommandBase
        def initialize(underlying_builder, build_name, item_spec=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " reconcile -buildName:#{@builder.format build_name}"
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def team_project(team_project_name)
          @builder.append " -teamProject:#{@builder.format team_project_name}"
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
      end
      class ReconcileChangeset < CommandBase
        def initialize(underlying_builder, changeset_name, item_spec=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " reconcile -changeset:#{@builder.format changeset_name}"
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def team_project(team_project_name)
          @builder.append " -teamProject:#{@builder.format team_project_name}"
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
      end
      class ReconcileForgetBuild < CommandBase
        def initialize(underlying_builder, build_name, item_spec=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " reconcile -forgetBuild:#{@builder.format build_name}"
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def team_project(team_project_name)
          @builder.append " -teamProject:#{@builder.format team_project_name}"
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
      end
      class Rename < CommandBase
        def initialize(underlying_builder, old_item, new_item)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " rename #{@builder.format old_item} #{@builder.format new_item}"
        end
        def lock(lock_type)
          @builder.append " -lock:#{@builder.format lock_type}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Resolve < CommandBase
        def initialize(underlying_builder, item_spec=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' resolve'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def auto(resolution)
          @builder.append " -auto:#{@builder.format resolution}"
          yield @builder if block_given?
          self
        end
        def preview
          @builder.append ' -preview'
          yield @builder if block_given?
          self
        end
        def override_type(override_type)
          @builder.append " -overrideType:#{@builder.format override_type}"
          yield @builder if block_given?
          self
        end
        def convert_to_type(convert_type)
          @builder.append " -convertToType:#{@builder.format convert_type}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def new_name(path)
          @builder.append " -newName:#{@builder.format path}"
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class ReplaceShelveset < CommandBase
        def initialize(underlying_builder, shelveset_name)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " shelve -replace #{@builder.format shelveset_name}"
        end
        def comment(comment)
          @builder.append " -comment:#{@builder.format comment}"
          yield @builder if block_given?
          self
        end
        def validate
          @builder.append ' -validate'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Shelve < CommandBase
        def initialize(underlying_builder, shelveset_name, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " shelve #{@builder.format shelveset_name} #{@builder.format item_spec}"
        end
        def move
          @builder.append ' -move'
          yield @builder if block_given?
          self
        end
        def replace
          @builder.append ' -replace'
          yield @builder if block_given?
          self
        end
        def comment(comment)
          @builder.append " -comment:#{@builder.format comment}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def validate
          @builder.append ' -validate'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class DeleteShelveset < CommandBase
        def initialize(underlying_builder, shelveset_name, shelveset_owner=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " shelve -delete #{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class Shelvesets < CommandBase
        def initialize(underlying_builder, shelveset_name=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' shelvesets'
          @builder.append " #{@builder.format shelveset_name}" unless shelveset_name.nil?
        end
        def owner(owner_name)
          @builder.append " -owner:#{@builder.format owner_name}"
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Status < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " status #{@builder.format item_spec}"
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def shelveset(shelveset_name, shelveset_owner=nil)
          @builder.append " -shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def user(user_name)
          @builder.append " -user:#{@builder.format user_name}"
          yield @builder if block_given?
          self
        end
      end
      class Undelete < CommandBase
        def initialize(underlying_builder, item_spec, deletion_id=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " undelete #{@builder.format item_spec}"
          @builder.append ";#{@builder.format deletion_id}" unless deletion_id.nil?
        end
        def no_get
          @builder.append ' -noGet'
          yield @builder if block_given?
          self
        end
        def lock(lock_type)
          @builder.append " -lock:#{@builder.format lock_type}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Undo < CommandBase
        def initialize(underlying_builder, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " undo #{@builder.format item_spec}"
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class Unlabel < CommandBase
        def initialize(underlying_builder, label_name, item_spec)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " unlabel #{@builder.format label_name} #{@builder.format item_spec}"
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class Unshelve < CommandBase
        def initialize(underlying_builder, shelveset_name=nil, username=nil, item_spec=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' unshelve'
          @builder.append " #{@builder.format shelveset_name}" unless shelveset_name.nil?
          @builder.append ";#{@builder.format username}" unless username.nil?
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def move
          @builder.append ' -move'
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class ShowLocalFolderMapping < CommandBase
        def initialize(underlying_builder, local_folder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " workfold #{@builder.format local_folder}"
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class ShowWorkspaceMappings < CommandBase
        def initialize(underlying_builder, workspace_name)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " workfold -workspace:#{@builder.format workspace_name}"
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class ShowServerFolderMappings < CommandBase
        def initialize(underlying_builder, server_folder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " workfold #{@builder.format server_folder}"
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class MapFolder < CommandBase
        def initialize(underlying_builder, server_folder, local_folder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " workfold -map #{@builder.format server_folder} #{@builder.format local_folder}"
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class UnmapFolder < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' workfold -unmap'
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def recursive
          @builder.append ' -recursive'
          yield @builder if block_given?
          self
        end
      end
      class CloakFolder < CommandBase
        def initialize(underlying_builder, server_folder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " workfold -cloak #{@builder.format server_folder}"
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class DecloakFolder < CommandBase
        def initialize(underlying_builder, server_folder)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " workfold -decloak #{@builder.format server_folder}"
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def workspace(workspace_name, workspace_owner=nil)
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
      class CreateWorkspace < CommandBase
        def initialize(underlying_builder, workspace_name, workspace_owner=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " workspace -new #{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
        end
        def no_prompt
          @builder.append ' -noPrompt'
          yield @builder if block_given?
          self
        end
        def template(workspace_name, workspace_owner=nil)
          @builder.append " -template:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          yield @builder if block_given?
          self
        end
        def computer(computer_name)
          @builder.append " -computer:#{@builder.format computer_name}"
          yield @builder if block_given?
          self
        end
        def comment(comment)
          @builder.append " -comment:#{@builder.format comment}"
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def permission(permission)
          @builder.append " -permission:#{@builder.format permission}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class DeleteWorkspace < CommandBase
        def initialize(underlying_builder, workspace_name, workspace_owner=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " workspace -delete #{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class ModifyWorkspace < CommandBase
        def initialize(underlying_builder, workspace_name=nil, workspace_owner=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' workspace '
          @builder.append "#{@builder.format workspace_name}" unless workspace_name.nil?
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
        end
        def computer(computer_name)
          @builder.append " -computer:#{@builder.format computer_name}"
          yield @builder if block_given?
          self
        end
        def comment(comment)
          @builder.append " -comment:#{@builder.format comment}"
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def permission(permission)
          @builder.append " -permission:#{@builder.format permission}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
        def new_name(workspace_name)
          @builder.append " -newName:#{@builder.format workspace_name}"
          yield @builder if block_given?
          self
        end
        def new_owner(owner_name)
          @builder.append " -newOwner:#{@builder.format owner_name}"
          yield @builder if block_given?
          self
        end
      end
      class Workspaces < CommandBase
        def initialize(underlying_builder, workspace_name=nil)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append ' workspaces'
          @builder.append " #{@builder.format workspace_name}" unless workspace_name.nil?
        end
        def owner(owner_name)
          @builder.append " -owner:#{@builder.format owner_name}"
          yield @builder if block_given?
          self
        end
        def computer(computer_name)
          @builder.append " -computer:#{@builder.format computer_name}"
          yield @builder if block_given?
          self
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -format:#{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def update_user_name(old_user_name)
          @builder.append " -updateUserName:#{@builder.format old_user_name}"
          yield @builder if block_given?
          self
        end
        def update_computer_name(old_computer_name)
          @builder.append " -updateComputerName:#{@builder.format old_computer_name}"
          yield @builder if block_given?
          self
        end
        def login(username, password=nil)
          @builder.append " -login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          yield @builder if block_given?
          self
        end
      end
      class RemoveWorkspace < CommandBase
        def initialize(underlying_builder, workspace_name)
          super underlying_builder
          @builder.command_name = 'tf'
          @builder.append " workspaces -remove:#{@builder.format workspace_name, ','}"
        end
        def collection(team_project_collection_url)
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          yield @builder if block_given?
          self
        end
      end
    end
  end
end
