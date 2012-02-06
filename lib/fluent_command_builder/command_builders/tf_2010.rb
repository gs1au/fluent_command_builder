require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Tf
    module V2010
      class Tf < CommandBase
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
        def configure path_of_team_project=nil
          Configure.new @builder, path_of_team_project
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
          @builder.append ' difference /configure'
          self
        end
        def dir item_spec
          Dir.new @builder, item_spec
        end
        def folder_diff target_path, source_path=nil
          FolderDiff.new @builder, target_path, source_path
        end
        def get item_spec=nil
          Get.new @builder, item_spec
        end
        def help command_name=nil
          @builder.append ' help'
          @builder.append " #{@builder.format command_name}" unless command_name.nil?
          self
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
        def local_versions item_spec
          LocalVersions.new @builder, item_spec
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
        def msdn command_name=nil
          @builder.append ' msdn'
          @builder.append " #{@builder.format command_name}" unless command_name.nil?
          self
        end
        def permission item_spec
          Permission.new @builder, item_spec
        end
        def properties item_spec
          Properties.new @builder, item_spec
        end
        def configure_proxy url
          ConfigureProxy.new @builder, url
        end
        def add_proxy_record url
          AddProxyRecord.new @builder, url
        end
        def delete_proxy_record url
          DeleteProxyRecord.new @builder, url
        end
        def list_proxy_records url
          ListProxyRecords.new @builder, url
        end
        def enable_proxy 
          @builder.append ' proxy /enabled:true'
          self
        end
        def disable_proxy 
          @builder.append ' proxy /enabled:false'
          self
        end
        def rename old_item, new_item
          Rename.new @builder, old_item, new_item
        end
        def resolve item_spec=nil
          Resolve.new @builder, item_spec
        end
        def rollback_to_version version_spec, item_spec
          RollbackToVersion.new @builder, version_spec, item_spec
        end
        def rollback_changeset changeset_from, changeset_to=nil, item_spec=nil
          RollbackChangeset.new @builder, changeset_from, changeset_to, item_spec
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
        def view item_spec
          View.new @builder, item_spec
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
      end
      class Add < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " add #{@builder.format item_spec}"
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def type file_type
          @builder.append " /type:#{@builder.format file_type}"
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Branch < CommandBase
        def initialize builder, old_item, new_item
          @builder = builder
          @builder.append " branch #{@builder.format old_item} #{@builder.format new_item}"
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def no_get 
          @builder.append ' /noGet'
          self
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def silent 
          @builder.append ' /silent'
          self
        end
        def checkin 
          @builder.append ' /checkin'
          self
        end
        def comment comment
          @builder.append " /comment:#{@builder.format comment}"
          self
        end
        def author author_name
          @builder.append " /author:#{@builder.format author_name}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Branches < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " branches #{@builder.format item_spec}"
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Changeset < CommandBase
        def initialize builder, changeset_number=nil
          @builder = builder
          @builder.append ' changeset'
          @builder.append " #{@builder.format changeset_number}" unless changeset_number.nil?
        end
        def comment comment
          @builder.append " /comment:#{@builder.format comment}"
          self
        end
        def notes notes
          @builder.append " /notes:#{@builder.format notes, ';', '='}"
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def latest 
          @builder.append ' /latest'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Checkin < CommandBase
        def initialize builder, item_spec=nil
          @builder = builder
          @builder.append ' checkin'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def author author_name
          @builder.append " /author:#{@builder.format author_name}"
          self
        end
        def comment comment
          @builder.append " /comment:#{@builder.format comment}"
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def notes notes
          @builder.append " /notes:#{@builder.format notes, ';', '='}"
          self
        end
        def override reason
          @builder.append " /override:#{@builder.format reason}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def saved 
          @builder.append ' /saved'
          self
        end
        def validate 
          @builder.append ' /validate'
          self
        end
        def bypass 
          @builder.append ' /bypass'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def force 
          @builder.append ' /force'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class CheckinShelveset < CommandBase
        def initialize builder, shelveset_name, shelveset_owner=nil
          @builder = builder
          @builder.append " checkin /shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
        end
        def bypass 
          @builder.append ' /bypass'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def author author_name
          @builder.append " /author:#{@builder.format author_name}"
          self
        end
        def force 
          @builder.append ' /force'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Checkout < CommandBase
        def initialize builder, item_spec=nil
          @builder = builder
          @builder.append ' checkout'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def type encoding
          @builder.append " /type:#{@builder.format encoding}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Configure < CommandBase
        def initialize builder, path_of_team_project=nil
          @builder = builder
          @builder.append ' configure'
          @builder.append " #{@builder.format path_of_team_project}" unless path_of_team_project.nil?
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Delete < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " delete #{@builder.format item_spec}"
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Destroy < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " destroy #{@builder.format item_spec}"
        end
        def keep_history 
          @builder.append ' /keepHistory'
          self
        end
        def stop_at version_spec
          @builder.append " /stopAt:#{@builder.format version_spec}"
          self
        end
        def preview 
          @builder.append ' /preview'
          self
        end
        def start_cleanup 
          @builder.append ' /startCleanup'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def silent 
          @builder.append ' /silent'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class CompareWithCurrentWorkspaceVersion < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " difference #{@builder.format item_spec}"
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def type file_type
          @builder.append " /type:#{@builder.format file_type}"
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def ignore_space 
          @builder.append ' /ignoreSpace'
          self
        end
        def ignore_eol 
          @builder.append ' /ignoreEol'
          self
        end
        def ignore_case 
          @builder.append ' /ignoreCase'
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def options 
          @builder.append ' /options'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Compare < CommandBase
        def initialize builder, item_spec, item_spec2
          @builder = builder
          @builder.append " difference #{@builder.format item_spec} #{@builder.format item_spec2}"
        end
        def type file_type
          @builder.append " /type:#{@builder.format file_type}"
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def ignore_space 
          @builder.append ' /ignoreSpace'
          self
        end
        def ignore_eol 
          @builder.append ' /ignoreEol'
          self
        end
        def ignore_case 
          @builder.append ' /ignoreCase'
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def options 
          @builder.append ' /options'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class CompareWithShelvesetVersion < CommandBase
        def initialize builder, shelveset_item_spec
          @builder = builder
          @builder.append " difference #{@builder.format shelveset_item_spec}"
        end
        def shelveset shelveset_name, shelveset_owner=nil
          @builder.append " /shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
          self
        end
        def type file_type
          @builder.append " /type:#{@builder.format file_type}"
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def ignore_space 
          @builder.append ' /ignoreSpace'
          self
        end
        def ignore_eol 
          @builder.append ' /ignoreEol'
          self
        end
        def ignore_case 
          @builder.append ' /ignoreCase'
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def options 
          @builder.append ' /options'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Dir < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " dir #{@builder.format item_spec}"
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def folders 
          @builder.append ' /folders'
          self
        end
        def deleted 
          @builder.append ' /deleted'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class FolderDiff < CommandBase
        def initialize builder, target_path, source_path=nil
          @builder = builder
          @builder.append ' folderDiff'
          @builder.append " #{@builder.format source_path}" unless source_path.nil?
          @builder.append " #{@builder.format target_path}"
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def filter filter
          @builder.append " /filter:#{@builder.format filter, ';'}"
          self
        end
        def filter_local_paths_only 
          @builder.append ' /filterLocalPathsOnly'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def view view
          @builder.append " /view:#{@builder.format view, ','}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Get < CommandBase
        def initialize builder, item_spec=nil
          @builder = builder
          @builder.append ' get'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def all 
          @builder.append ' /all'
          self
        end
        def overwrite 
          @builder.append ' /overwrite'
          self
        end
        def force 
          @builder.append ' /force'
          self
        end
        def preview 
          @builder.append ' /preview'
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def remap 
          @builder.append ' /remap'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class History < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " history #{@builder.format item_spec}"
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def stop_after number
          @builder.append " /stopAfter:#{@builder.format number}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def user user_name
          @builder.append " /user:#{@builder.format user_name}"
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def slot_mode 
          @builder.append ' /slotMode'
          self
        end
        def item_mode 
          @builder.append ' /itemMode'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def sort sort
          @builder.append " /sort:#{@builder.format sort}"
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Label < CommandBase
        def initialize builder, label_name, item_spec, scope=nil
          @builder = builder
          @builder.append " label #{@builder.format label_name}"
          @builder.append "@#{@builder.format scope}" unless scope.nil?
          @builder.append " #{@builder.format item_spec}"
        end
        def owner owner_name
          @builder.append " /owner:#{@builder.format owner_name}"
          self
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def comment comment
          @builder.append " /comment:#{@builder.format comment}"
          self
        end
        def child lock_type
          @builder.append " /child:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class DeleteLabel < CommandBase
        def initialize builder, label_name, item_spec, scope=nil
          @builder = builder
          @builder.append " label /delete #{@builder.format label_name}"
          @builder.append "@#{@builder.format scope}" unless scope.nil?
          @builder.append " #{@builder.format item_spec}"
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Labels < CommandBase
        def initialize builder, label_name=nil
          @builder = builder
          @builder.append ' labels'
          @builder.append " #{@builder.format label_name}" unless label_name.nil?
        end
        def owner owner_name
          @builder.append " /owner:#{@builder.format owner_name}"
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class LocalVersions < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " localVersions #{@builder.format item_spec}"
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Lock < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " lock #{@builder.format item_spec}"
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Merge < CommandBase
        def initialize builder, source, destination
          @builder = builder
          @builder.append " merge #{@builder.format source} #{@builder.format destination}"
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def force 
          @builder.append ' /force'
          self
        end
        def candidate 
          @builder.append ' /candidate'
          self
        end
        def discard 
          @builder.append ' /discard'
          self
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def preview 
          @builder.append ' /preview'
          self
        end
        def baseless 
          @builder.append ' /baseless'
          self
        end
        def no_summary 
          @builder.append ' /noSummary'
          self
        end
        def no_implicit_baseless 
          @builder.append ' /noImplicitBaseless'
          self
        end
        def conservative 
          @builder.append ' /conservative'
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Merges < CommandBase
        def initialize builder, destination, source=nil
          @builder = builder
          @builder.append ' merges'
          @builder.append " #{@builder.format source}" unless source.nil?
          @builder.append " #{@builder.format destination}"
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def extended 
          @builder.append ' /extended'
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def show_all 
          @builder.append ' /showAll'
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Permission < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " permission #{@builder.format item_spec}"
        end
        def allow permission
          @builder.append " /allow:#{@builder.format permission, ','}"
          self
        end
        def deny permission
          @builder.append " /deny:#{@builder.format permission, ','}"
          self
        end
        def remove permission
          @builder.append " /remove:#{@builder.format permission, ','}"
          self
        end
        def inherit inherit
          @builder.append " /inherit:#{@builder.format inherit}"
          self
        end
        def user user_name
          @builder.append " /user:#{@builder.format user_name, ','}"
          self
        end
        def group group_name
          @builder.append " /group:#{@builder.format group_name, ','}"
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def global 
          @builder.append ' /global'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Properties < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " properties #{@builder.format item_spec}"
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class ConfigureProxy < CommandBase
        def initialize builder, url
          @builder = builder
          @builder.append " proxy /configure #{@builder.format url}"
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class AddProxyRecord < CommandBase
        def initialize builder, url
          @builder = builder
          @builder.append " proxy /add #{@builder.format url}"
        end
        def name name
          @builder.append " /name:#{@builder.format name}"
          self
        end
        def site site_name
          @builder.append " /site:#{@builder.format site_name}"
          self
        end
        def description description
          @builder.append " /description:#{@builder.format description}"
          self
        end
        def default scope
          @builder.append " /default:#{@builder.format scope}"
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class DeleteProxyRecord < CommandBase
        def initialize builder, url
          @builder = builder
          @builder.append " proxy /delete #{@builder.format url}"
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class ListProxyRecords < CommandBase
        def initialize builder, url
          @builder = builder
          @builder.append " proxy /list #{@builder.format url, ' '}"
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Rename < CommandBase
        def initialize builder, old_item, new_item
          @builder = builder
          @builder.append " rename #{@builder.format old_item} #{@builder.format new_item}"
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Resolve < CommandBase
        def initialize builder, item_spec=nil
          @builder = builder
          @builder.append ' resolve'
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def auto resolution
          @builder.append " /auto:#{@builder.format resolution}"
          self
        end
        def preview 
          @builder.append ' /preview'
          self
        end
        def override_type override_type
          @builder.append " /overrideType:#{@builder.format override_type}"
          self
        end
        def convert_to_type convert_type
          @builder.append " /convertToType:#{@builder.format convert_type}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def new_name path
          @builder.append " /newName:#{@builder.format path}"
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class RollbackToVersion < CommandBase
        def initialize builder, version_spec, item_spec
          @builder = builder
          @builder.append " rollback /toVersion:#{@builder.format version_spec} #{@builder.format item_spec}"
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def keep_merge_history 
          @builder.append ' /keepMergeHistory'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class RollbackChangeset < CommandBase
        def initialize builder, changeset_from, changeset_to=nil, item_spec=nil
          @builder = builder
          @builder.append " rollback /changeset:#{@builder.format changeset_from}"
          @builder.append "~#{@builder.format changeset_to}" unless changeset_to.nil?
          @builder.append ''
          @builder.append " #{@builder.format item_spec}" unless item_spec.nil?
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def keep_merge_history 
          @builder.append ' /keepMergeHistory'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class ReplaceShelveset < CommandBase
        def initialize builder, shelveset_name
          @builder = builder
          @builder.append " shelve /replace #{@builder.format shelveset_name}"
        end
        def comment comment
          @builder.append " /comment:#{@builder.format comment}"
          self
        end
        def validate 
          @builder.append ' /validate'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Shelve < CommandBase
        def initialize builder, shelveset_name, item_spec
          @builder = builder
          @builder.append " shelve #{@builder.format shelveset_name} #{@builder.format item_spec}"
        end
        def move 
          @builder.append ' /move'
          self
        end
        def replace 
          @builder.append ' /replace'
          self
        end
        def comment comment
          @builder.append " /comment:#{@builder.format comment}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def validate 
          @builder.append ' /validate'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class DeleteShelveset < CommandBase
        def initialize builder, shelveset_name, shelveset_owner=nil
          @builder = builder
          @builder.append " shelve /delete #{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Shelvesets < CommandBase
        def initialize builder, shelveset_name=nil
          @builder = builder
          @builder.append ' shelvesets'
          @builder.append " #{@builder.format shelveset_name}" unless shelveset_name.nil?
        end
        def owner owner_name
          @builder.append " /owner:#{@builder.format owner_name}"
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Status < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " status #{@builder.format item_spec}"
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def shelveset shelveset_name, shelveset_owner=nil
          @builder.append " /shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def user user_name
          @builder.append " /user:#{@builder.format user_name}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Undelete < CommandBase
        def initialize builder, item_spec, deletion_id=nil
          @builder = builder
          @builder.append " undelete #{@builder.format item_spec}"
          @builder.append ";#{@builder.format deletion_id}" unless deletion_id.nil?
        end
        def no_get 
          @builder.append ' /noGet'
          self
        end
        def lock lock_type
          @builder.append " /lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Undo < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " undo #{@builder.format item_spec}"
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Unlabel < CommandBase
        def initialize builder, label_name, item_spec
          @builder = builder
          @builder.append " unlabel #{@builder.format label_name} #{@builder.format item_spec}"
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Unshelve < CommandBase
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
          @builder.append ' /move'
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class View < CommandBase
        def initialize builder, item_spec
          @builder = builder
          @builder.append " view #{@builder.format item_spec}"
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def console 
          @builder.append ' /console'
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def output local_file
          @builder.append " /output:#{@builder.format local_file}"
          self
        end
        def shelveset shelveset_name, shelveset_owner=nil
          @builder.append " /shelveset:#{@builder.format shelveset_name}"
          @builder.append ";#{@builder.format shelveset_owner}" unless shelveset_owner.nil?
          self
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def version version_spec
          @builder.append " /version:#{@builder.format version_spec}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class ShowLocalFolderMapping < CommandBase
        def initialize builder, local_folder
          @builder = builder
          @builder.append " workfold #{@builder.format local_folder}"
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class ShowWorkspaceMappings < CommandBase
        def initialize builder, workspace_name
          @builder = builder
          @builder.append " workfold /workspace:#{@builder.format workspace_name}"
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class ShowServerFolderMappings < CommandBase
        def initialize builder, server_folder
          @builder = builder
          @builder.append " workfold #{@builder.format server_folder}"
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class MapFolder < CommandBase
        def initialize builder, server_folder, local_folder
          @builder = builder
          @builder.append " workfold /map #{@builder.format server_folder} #{@builder.format local_folder}"
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class UnmapFolder < CommandBase
        def initialize builder
          @builder = builder
          @builder.append ' workfold /unmap'
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append ' /recursive'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class CloakFolder < CommandBase
        def initialize builder, server_folder
          @builder = builder
          @builder.append " workfold /cloak #{@builder.format server_folder}"
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class DecloakFolder < CommandBase
        def initialize builder, server_folder
          @builder = builder
          @builder.append " workfold /decloak #{@builder.format server_folder}"
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def workspace workspace_name, workspace_owner=nil
          @builder.append " /workspace:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class CreateWorkspace < CommandBase
        def initialize builder, workspace_name, workspace_owner=nil
          @builder = builder
          @builder.append " workspace /new #{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
        end
        def no_prompt 
          @builder.append ' /noPrompt'
          self
        end
        def template workspace_name, workspace_owner=nil
          @builder.append " /template:#{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
          self
        end
        def computer computer_name
          @builder.append " /computer:#{@builder.format computer_name}"
          self
        end
        def comment comment
          @builder.append " /comment:#{@builder.format comment}"
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def permission permission
          @builder.append " /permission:#{@builder.format permission}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class DeleteWorkspace < CommandBase
        def initialize builder, workspace_name, workspace_owner=nil
          @builder = builder
          @builder.append " workspace /delete #{@builder.format workspace_name}"
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class ModifyWorkspace < CommandBase
        def initialize builder, workspace_name=nil, workspace_owner=nil
          @builder = builder
          @builder.append ' workspace '
          @builder.append "#{@builder.format workspace_name}" unless workspace_name.nil?
          @builder.append ''
          @builder.append ";#{@builder.format workspace_owner}" unless workspace_owner.nil?
        end
        def computer computer_name
          @builder.append " /computer:#{@builder.format computer_name}"
          self
        end
        def comment comment
          @builder.append " /comment:#{@builder.format comment}"
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def permission permission
          @builder.append " /permission:#{@builder.format permission}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def new_name workspace_name
          @builder.append " /newName:#{@builder.format workspace_name}"
          self
        end
        def new_owner owner_name
          @builder.append " /newOwner:#{@builder.format owner_name}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Workspaces < CommandBase
        def initialize builder, workspace_name=nil
          @builder = builder
          @builder.append ' workspaces'
          @builder.append " #{@builder.format workspace_name}" unless workspace_name.nil?
        end
        def owner owner_name
          @builder.append " /owner:#{@builder.format owner_name}"
          self
        end
        def computer computer_name
          @builder.append " /computer:#{@builder.format computer_name}"
          self
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def format format
          @builder.append " /format:#{@builder.format format}"
          self
        end
        def update_user_name old_user_name
          @builder.append " /updateUserName:#{@builder.format old_user_name}"
          self
        end
        def update_computer_name old_computer_name
          @builder.append " /updateComputerName:#{@builder.format old_computer_name}"
          self
        end
        def login username, password=nil
          @builder.append " /login:#{@builder.format username}"
          @builder.append ",#{@builder.format password}" unless password.nil?
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class RemoveWorkspace < CommandBase
        def initialize builder, workspace_name
          @builder = builder
          @builder.append " workspaces /remove:#{@builder.format workspace_name, ','}"
        end
        def collection team_project_collection_url
          @builder.append " /collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      def tf 
        Tf.new CommandBuilder.new
      end
    end
  end
  def tf_2010 
    Tf::V2010::Tf.new CommandBuilder.new
  end
end
