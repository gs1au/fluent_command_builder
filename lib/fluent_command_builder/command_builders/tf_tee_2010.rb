require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Tf
    module TEE_2010
      class Tf
        def initialize builder
          @builder = builder
          @builder.append 'tf'
        end
        def add item_spec
          Add.new @builder, item_spec
        end
        def branch old_item, new_item
          Branch.new @builder, old_item, new_item
        end
        def branches item_spec
          Branches.new @builder, item_spec
        end
        def changeset changeset_number=nil
          Changeset.new @builder, changeset_number
        end
        def checkin item_spec=nil
          Checkin.new @builder, item_spec
        end
        def checkin_shelveset shelveset_name, shelveset_owner=nil
          CheckinShelveset.new @builder, shelveset_name, shelveset_owner
        end
        def checkout item_spec=nil
          Checkout.new @builder, item_spec
        end
        def delete item_spec
          Delete.new @builder, item_spec
        end
        def destroy item_spec
          Destroy.new @builder, item_spec
        end
        def compare_with_current_workspace_version item_spec
          CompareWithCurrentWorkspaceVersion.new @builder, item_spec
        end
        def compare item_spec, item_spec2
          Compare.new @builder, item_spec, item_spec2
        end
        def compare_with_shelveset_version shelveset_item_spec
          CompareWithShelvesetVersion.new @builder, shelveset_item_spec
        end
        def configure_compare_tool 
          @builder.append ' difference -configure'
          self
        end
        def dir item_spec
          Dir.new @builder, item_spec
        end
        def eula 
          Eula.new @builder
        end
        def get item_spec=nil
          Get.new @builder, item_spec
        end
        def getcs 
          Getcs.new @builder
        end
        def history item_spec
          History.new @builder, item_spec
        end
        def label label_name, item_spec, scope=nil
          Label.new @builder, label_name, item_spec, scope
        end
        def delete_label label_name, item_spec, scope=nil
          DeleteLabel.new @builder, label_name, item_spec, scope
        end
        def labels label_name=nil
          Labels.new @builder, label_name
        end
        def lock item_spec
          Lock.new @builder, item_spec
        end
        def merge source, destination
          Merge.new @builder, source, destination
        end
        def merges destination, source=nil
          Merges.new @builder, destination, source
        end
        def print item_spec
          Print.new @builder, item_spec
        end
        def product_key 
          ProductKey.new @builder
        end
        def copy_profile existing_profile_name, new_profile_name
          @builder.append " profile -copy #{@builder.format existing_profile_name} #{@builder.format new_profile_name}"
          self
        end
        def delete_profile profile_name
          @builder.append " profile -delete #{@builder.format profile_name}"
          self
        end
        def edit_profile existing_profile_name
          EditProfile.new @builder, existing_profile_name
        end
        def new_profile new_profile_name
          NewProfile.new @builder, new_profile_name
        end
        def profiles 
          Profiles.new @builder
        end
        def properties item_spec
          Properties.new @builder, item_spec
        end
        def reconcile 
          Reconcile.new @builder
        end
        def reconcile_build build_name, item_spec=nil
          ReconcileBuild.new @builder, build_name, item_spec
        end
        def reconcile_changeset changeset_name, item_spec=nil
          ReconcileChangeset.new @builder, changeset_name, item_spec
        end
        def reconcile_forget_build build_name, item_spec=nil
          ReconcileForgetBuild.new @builder, build_name, item_spec
        end
        def rename old_item, new_item
          Rename.new @builder, old_item, new_item
        end
        def resolve item_spec=nil
          Resolve.new @builder, item_spec
        end
        def replace_shelveset shelveset_name
          ReplaceShelveset.new @builder, shelveset_name
        end
        def shelve shelveset_name, item_spec
          Shelve.new @builder, shelveset_name, item_spec
        end
        def delete_shelveset shelveset_name, shelveset_owner=nil
          DeleteShelveset.new @builder, shelveset_name, shelveset_owner
        end
        def shelvesets shelveset_name=nil
          Shelvesets.new @builder, shelveset_name
        end
        def status item_spec
          Status.new @builder, item_spec
        end
        def undelete item_spec, deletion_id=nil
          Undelete.new @builder, item_spec, deletion_id
        end
        def undo item_spec
          Undo.new @builder, item_spec
        end
        def unlabel label_name, item_spec
          Unlabel.new @builder, label_name, item_spec
        end
        def unshelve shelveset_name=nil, username=nil, item_spec=nil
          Unshelve.new @builder, shelveset_name, username, item_spec
        end
        def show_local_folder_mapping local_folder
          ShowLocalFolderMapping.new @builder, local_folder
        end
        def show_workspace_mappings workspace_name
          ShowWorkspaceMappings.new @builder, workspace_name
        end
        def show_server_folder_mappings server_folder
          ShowServerFolderMappings.new @builder, server_folder
        end
        def map_folder server_folder, local_folder
          MapFolder.new @builder, server_folder, local_folder
        end
        def unmap_folder 
          UnmapFolder.new @builder
        end
        def cloak_folder server_folder
          CloakFolder.new @builder, server_folder
        end
        def decloak_folder server_folder
          DecloakFolder.new @builder, server_folder
        end
        def create_workspace workspace_name, workspace_owner=nil
          CreateWorkspace.new @builder, workspace_name, workspace_owner
        end
        def delete_workspace workspace_name, workspace_owner=nil
          DeleteWorkspace.new @builder, workspace_name, workspace_owner
        end
        def modify_workspace workspace_name=nil, workspace_owner=nil
          ModifyWorkspace.new @builder, workspace_name, workspace_owner
        end
        def workspaces workspace_name=nil
          Workspaces.new @builder, workspace_name
        end
        def remove_workspace workspace_name
          RemoveWorkspace.new @builder, workspace_name
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Add
        def initialize builder, item_spec
          @builder = builder
          @builder.append " add #{@builder.format item_spec}"
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def type file_type
          @builder.append " -type:#{@builder.format file_type}"
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Branch
        def initialize builder, old_item, new_item
          @builder = builder
          @builder.append " branch #{@builder.format old_item} #{@builder.format new_item}"
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def no_get 
          @builder.append ' -noGet'
          self
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def silent 
          @builder.append ' -silent'
          self
        end
        def checkin 
          @builder.append ' -checkin'
          self
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def author author_name
          @builder.append " -author:#{@builder.format author_name}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Branches
        def initialize builder, item_spec
          @builder = builder
          @builder.append " branches #{@builder.format item_spec}"
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Changeset
        def initialize builder, changeset_number=nil
          @builder = builder
          @builder.append ' changeset'
          @builder.append " #{@builder.format changeset_number}" unless changeset_number.nil?
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def notes notes
          @builder.append " -notes:#{@builder.format notes, ';', '='}"
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def latest 
          @builder.append ' -latest'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Checkin
        def initialize builder, item_spec=nil
          @builder = builder
          @builder.append ' checkin'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def author author_name
          @builder.append " -author:#{@builder.format author_name}"
          self
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def notes notes
          @builder.append " -notes:#{@builder.format notes, ';', '='}"
          self
        end
        def override reason
          @builder.append " -override:#{@builder.format reason}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def saved 
          @builder.append ' -saved'
          self
        end
        def validate 
          @builder.append ' -validate'
          self
        end
        def bypass 
          @builder.append ' -bypass'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def force 
          @builder.append ' -force'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class CheckinShelveset
        def initialize builder, shelveset_name, shelveset_owner=nil
          @builder = builder
          @builder.append " checkin -shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
        end
        def bypass 
          @builder.append ' -bypass'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def author author_name
          @builder.append " -author:#{@builder.format author_name}"
          self
        end
        def force 
          @builder.append ' -force'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Checkout
        def initialize builder, item_spec=nil
          @builder = builder
          @builder.append ' checkout'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def type encoding
          @builder.append " -type:#{@builder.format encoding}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Delete
        def initialize builder, item_spec
          @builder = builder
          @builder.append " delete #{@builder.format item_spec}"
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Destroy
        def initialize builder, item_spec
          @builder = builder
          @builder.append " destroy #{@builder.format item_spec}"
        end
        def keep_history 
          @builder.append ' -keepHistory'
          self
        end
        def stop_at version_spec
          @builder.append " -stopAt:#{@builder.format version_spec}"
          self
        end
        def preview 
          @builder.append ' -preview'
          self
        end
        def start_cleanup 
          @builder.append ' -startCleanup'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def silent 
          @builder.append ' -silent'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class CompareWithCurrentWorkspaceVersion
        def initialize builder, item_spec
          @builder = builder
          @builder.append " difference #{@builder.format item_spec}"
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def type file_type
          @builder.append " -type:#{@builder.format file_type}"
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def ignore_space 
          @builder.append ' -ignoreSpace'
          self
        end
        def ignore_eol 
          @builder.append ' -ignoreEol'
          self
        end
        def ignore_case 
          @builder.append ' -ignoreCase'
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def options 
          @builder.append ' -options'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Compare
        def initialize builder, item_spec, item_spec2
          @builder = builder
          @builder.append " difference #{@builder.format item_spec} #{@builder.format item_spec2}"
        end
        def type file_type
          @builder.append " -type:#{@builder.format file_type}"
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def ignore_space 
          @builder.append ' -ignoreSpace'
          self
        end
        def ignore_eol 
          @builder.append ' -ignoreEol'
          self
        end
        def ignore_case 
          @builder.append ' -ignoreCase'
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def options 
          @builder.append ' -options'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class CompareWithShelvesetVersion
        def initialize builder, shelveset_item_spec
          @builder = builder
          @builder.append " difference #{@builder.format shelveset_item_spec}"
        end
        def shelveset shelveset_name, shelveset_owner=nil
          @builder.append " -shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
          self
        end
        def type file_type
          @builder.append " -type:#{@builder.format file_type}"
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def ignore_space 
          @builder.append ' -ignoreSpace'
          self
        end
        def ignore_eol 
          @builder.append ' -ignoreEol'
          self
        end
        def ignore_case 
          @builder.append ' -ignoreCase'
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def options 
          @builder.append ' -options'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Dir
        def initialize builder, item_spec
          @builder = builder
          @builder.append " dir #{@builder.format item_spec}"
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def folders 
          @builder.append ' -folders'
          self
        end
        def deleted 
          @builder.append ' -deleted'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Eula
        def initialize builder
          @builder = builder
          @builder.append ' eula'
        end
        def accept 
          @builder.append ' -accept'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Get
        def initialize builder, item_spec=nil
          @builder = builder
          @builder.append ' get'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def all 
          @builder.append ' -all'
          self
        end
        def overwrite 
          @builder.append ' -overwrite'
          self
        end
        def force 
          @builder.append ' -force'
          self
        end
        def preview 
          @builder.append ' -preview'
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def remap 
          @builder.append ' -remap'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Getcs
        def initialize builder
          @builder = builder
          @builder.append ' getcs'
        end
        def changeset changeset_number
          @builder.append " -changeset:#{@builder.format changeset_number}"
          self
        end
        def latest 
          @builder.append ' -latest'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class History
        def initialize builder, item_spec
          @builder = builder
          @builder.append " history #{@builder.format item_spec}"
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def stop_after number
          @builder.append " -stopAfter:#{@builder.format number}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def user user_name
          @builder.append " -user:#{@builder.format user_name}"
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def slot_mode 
          @builder.append ' -slotMode'
          self
        end
        def item_mode 
          @builder.append ' -itemMode'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def sort sort
          @builder.append " -sort:#{@builder.format sort}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Label
        def initialize builder, label_name, item_spec, scope=nil
          @builder = builder
          @builder.append " label #{@builder.format label_name}"
          @builder.append "@#{@builder.format scope}" unless scope.nil?
          @builder.append " #{@builder.format item_spec}"
        end
        def owner owner_name
          @builder.append " -owner:#{@builder.format owner_name}"
          self
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def child lock_type
          @builder.append " -child:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class DeleteLabel
        def initialize builder, label_name, item_spec, scope=nil
          @builder = builder
          @builder.append " label -delete #{@builder.format label_name}"
          @builder.append "@#{@builder.format scope}" unless scope.nil?
          @builder.append " #{@builder.format item_spec}"
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Labels
        def initialize builder, label_name=nil
          @builder = builder
          @builder.append ' labels'
          @builder.append " #{@builder.format label_name}" unless label_name.nil?
        end
        def owner owner_name
          @builder.append " -owner:#{@builder.format owner_name}"
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Lock
        def initialize builder, item_spec
          @builder = builder
          @builder.append " lock #{@builder.format item_spec}"
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Merge
        def initialize builder, source, destination
          @builder = builder
          @builder.append " merge #{@builder.format source} #{@builder.format destination}"
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def force 
          @builder.append ' -force'
          self
        end
        def candidate 
          @builder.append ' -candidate'
          self
        end
        def discard 
          @builder.append ' -discard'
          self
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def preview 
          @builder.append ' -preview'
          self
        end
        def baseless 
          @builder.append ' -baseless'
          self
        end
        def no_summary 
          @builder.append ' -noSummary'
          self
        end
        def no_implicit_baseless 
          @builder.append ' -noImplicitBaseless'
          self
        end
        def conservative 
          @builder.append ' -conservative'
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Merges
        def initialize builder, destination, source=nil
          @builder = builder
          @builder.append ' merges'
          @builder.append " #{@builder.format source}" unless source.nil?
          @builder.append " #{@builder.format destination}"
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def extended 
          @builder.append ' -extended'
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def show_all 
          @builder.append ' -showAll'
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Print
        def initialize builder, item_spec
          @builder = builder
          @builder.append " print #{@builder.format item_spec}"
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ProductKey
        def initialize builder
          @builder = builder
          @builder.append ' productKey'
        end
        def set my_product_key
          @builder.append " -set:#{@builder.format my_product_key}"
          self
        end
        def trial 
          @builder.append ' -trial'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class EditProfile
        def initialize builder, existing_profile_name
          @builder = builder
          @builder.append " profile -edit #{@builder.format existing_profile_name}"
        end
        def string property_name, value
          @builder.append " -string:#{@builder.format property_name}=#{@builder.format value}"
          self
        end
        def boolean property_name, value
          @builder.append " -boolean:#{@builder.format property_name}=#{@builder.format value}"
          self
        end
        def number property_name, value
          @builder.append " -number:#{@builder.format property_name}=#{@builder.format value}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class NewProfile
        def initialize builder, new_profile_name
          @builder = builder
          @builder.append " profile -new #{@builder.format new_profile_name}"
        end
        def string property_name, value
          @builder.append " -string:#{@builder.format property_name}=#{@builder.format value}"
          self
        end
        def boolean property_name, value
          @builder.append " -boolean:#{@builder.format property_name}=#{@builder.format value}"
          self
        end
        def number property_name, value
          @builder.append " -number:#{@builder.format property_name}=#{@builder.format value}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Profiles
        def initialize builder
          @builder = builder
          @builder.append ' profiles'
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Properties
        def initialize builder, item_spec
          @builder = builder
          @builder.append " properties #{@builder.format item_spec}"
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Reconcile
        def initialize builder
          @builder = builder
          @builder.append ' reconcile'
        end
        def team_project team_project_name
          @builder.append " -teamProject:#{@builder.format team_project_name}"
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ReconcileBuild
        def initialize builder, build_name, item_spec=nil
          @builder = builder
          @builder.append " reconcile -buildName:#{@builder.format build_name}"
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def team_project team_project_name
          @builder.append " -teamProject:#{@builder.format team_project_name}"
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ReconcileChangeset
        def initialize builder, changeset_name, item_spec=nil
          @builder = builder
          @builder.append " reconcile -changeset:#{@builder.format changeset_name}"
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def team_project team_project_name
          @builder.append " -teamProject:#{@builder.format team_project_name}"
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ReconcileForgetBuild
        def initialize builder, build_name, item_spec=nil
          @builder = builder
          @builder.append " reconcile -forgetBuild:#{@builder.format build_name}"
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def team_project team_project_name
          @builder.append " -teamProject:#{@builder.format team_project_name}"
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Rename
        def initialize builder, old_item, new_item
          @builder = builder
          @builder.append " rename #{@builder.format old_item} #{@builder.format new_item}"
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Resolve
        def initialize builder, item_spec=nil
          @builder = builder
          @builder.append ' resolve'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def auto resolution
          @builder.append " -auto:#{@builder.format resolution}"
          self
        end
        def preview 
          @builder.append ' -preview'
          self
        end
        def override_type override_type
          @builder.append " -overrideType:#{@builder.format override_type}"
          self
        end
        def convert_to_type convert_type
          @builder.append " -convertToType:#{@builder.format convert_type}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def new_name path
          @builder.append " -newName:#{@builder.format path}"
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ReplaceShelveset
        def initialize builder, shelveset_name
          @builder = builder
          @builder.append " shelve -replace #{@builder.format shelveset_name}"
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def validate 
          @builder.append ' -validate'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Shelve
        def initialize builder, shelveset_name, item_spec
          @builder = builder
          @builder.append " shelve #{@builder.format shelveset_name} #{@builder.format item_spec}"
        end
        def move 
          @builder.append ' -move'
          self
        end
        def replace 
          @builder.append ' -replace'
          self
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def validate 
          @builder.append ' -validate'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class DeleteShelveset
        def initialize builder, shelveset_name, shelveset_owner=nil
          @builder = builder
          @builder.append " shelve -delete #{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Shelvesets
        def initialize builder, shelveset_name=nil
          @builder = builder
          @builder.append ' shelvesets'
          @builder.append " #{@builder.format shelveset_name}" unless shelveset_name.nil?
        end
        def owner owner_name
          @builder.append " -owner:#{@builder.format owner_name}"
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Status
        def initialize builder, item_spec
          @builder = builder
          @builder.append " status #{@builder.format item_spec}"
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def shelveset shelveset_name, shelveset_owner=nil
          @builder.append " -shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def user user_name
          @builder.append " -user:#{@builder.format user_name}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Undelete
        def initialize builder, item_spec, deletion_id=nil
          @builder = builder
          @builder.append " undelete #{@builder.format item_spec}"
          @builder.append ";#{@builder.format deletion_id}" unless deletion_id.nil?
        end
        def no_get 
          @builder.append ' -noGet'
          self
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Undo
        def initialize builder, item_spec
          @builder = builder
          @builder.append " undo #{@builder.format item_spec}"
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Unlabel
        def initialize builder, label_name, item_spec
          @builder = builder
          @builder.append " unlabel #{@builder.format label_name} #{@builder.format item_spec}"
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Unshelve
        def initialize builder, shelveset_name=nil, username=nil, item_spec=nil
          @builder = builder
          @builder.append ' unshelve'
          @builder.append " #{@builder.format shelveset_name}" unless shelveset_name.nil?
          @builder.append ''
          @builder.append ";#{@builder.format username}" unless username.nil?
          @builder.append ''
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def move 
          @builder.append ' -move'
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ShowLocalFolderMapping
        def initialize builder, local_folder
          @builder = builder
          @builder.append " workfold #{@builder.format local_folder}"
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ShowWorkspaceMappings
        def initialize builder, workspace_name
          @builder = builder
          @builder.append " workfold -workspace:#{@builder.format workspace_name}"
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ShowServerFolderMappings
        def initialize builder, server_folder
          @builder = builder
          @builder.append " workfold #{@builder.format server_folder}"
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class MapFolder
        def initialize builder, server_folder, local_folder
          @builder = builder
          @builder.append " workfold -map #{@builder.format server_folder} #{@builder.format local_folder}"
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class UnmapFolder
        def initialize builder
          @builder = builder
          @builder.append ' workfold -unmap'
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class CloakFolder
        def initialize builder, server_folder
          @builder = builder
          @builder.append " workfold -cloak #{@builder.format server_folder}"
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class DecloakFolder
        def initialize builder, server_folder
          @builder = builder
          @builder.append " workfold -decloak #{@builder.format server_folder}"
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " -workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class CreateWorkspace
        def initialize builder, workspace_name, workspace_owner=nil
          @builder = builder
          @builder.append " workspace -new #{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def template workspace_name, workspace_owner=nil
          @builder.append " -template:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def computer computer_name
          @builder.append " -computer:#{@builder.format computer_name}"
          self
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def permission permission
          @builder.append " -permission:#{@builder.format permission}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class DeleteWorkspace
        def initialize builder, workspace_name, workspace_owner=nil
          @builder = builder
          @builder.append " workspace -delete #{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class ModifyWorkspace
        def initialize builder, workspace_name=nil, workspace_owner=nil
          @builder = builder
          @builder.append ' workspace '
          @builder.append "#{@builder.format workspace_name}" unless workspace_name.nil?
          @builder.append ''
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
        end
        def computer computer_name
          @builder.append " -computer:#{@builder.format computer_name}"
          self
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def permission permission
          @builder.append " -permission:#{@builder.format permission}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def new_name workspace_name
          @builder.append " -newName:#{@builder.format workspace_name}"
          self
        end
        def new_owner owner_name
          @builder.append " /newOwner:#{@builder.format owner_name}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class Workspaces
        def initialize builder, workspace_name=nil
          @builder = builder
          @builder.append ' workspaces'
          @builder.append " #{@builder.format workspace_name}" unless workspace_name.nil?
        end
        def owner owner_name
          @builder.append " -owner:#{@builder.format owner_name}"
          self
        end
        def computer computer_name
          @builder.append " -computer:#{@builder.format computer_name}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def format format
          @builder.append " -format:#{@builder.format format}"
          self
        end
        def update_user_name old_user_name
          @builder.append " -updateUserName:#{@builder.format old_user_name}"
          self
        end
        def update_computer_name old_computer_name
          @builder.append " -updateComputerName:#{@builder.format old_computer_name}"
          self
        end
        def login username, domain=nil, password=nil
          @builder.append " -login:#{@builder.format username}"
          @builder.append "@#{@builder.format domain}" unless domain.nil?
          @builder.append ''
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      class RemoveWorkspace
        def initialize builder, workspace_name
          @builder = builder
          @builder.append " workspaces -remove:#{@builder.format workspace_name, ','}"
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
        def execute 
          begin
            require 'rake'
            sh to_s
          rescue LoadError
            system to_s
          end
        end
      end
      def tf 
        Tf.new CommandBuilder.new
      end
    end
  end
  def tf_tee_2010 
    Tf::TEE_2010::Tf.new CommandBuilder.new
  end
end
