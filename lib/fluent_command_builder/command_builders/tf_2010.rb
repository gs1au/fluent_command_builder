require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Tf
    module V2010
      class Tf
        def initialize builder
          @builder = builder
          @builder.append 'tf'
        end
        def add 
          Add.new @builder
        end
        def branch 
          Branch.new @builder
        end
        def branches 
          Branches.new @builder
        end
        def changeset 
          Changeset.new @builder
        end
        def checkin 
          Checkin.new @builder
        end
        def checkout 
          Checkout.new @builder
        end
        def configure 
          Configure.new @builder
        end
        def delete 
          Delete.new @builder
        end
        def destroy 
          @builder.append 'destroy'
          self
        end
        def diff 
          Diff.new @builder
        end
        def dir 
          Dir.new @builder
        end
        def folder_diff 
          FolderDiff.new @builder
        end
        def get 
          Get.new @builder
        end
        def history 
          History.new @builder
        end
        def label 
          Label.new @builder
        end
        def labels 
          Labels.new @builder
        end
        def local_versions 
          LocalVersions.new @builder
        end
        def lock 
          Lock.new @builder
        end
        def merge 
          Merge.new @builder
        end
        def merges 
          Merges.new @builder
        end
        def permissions 
          Permissions.new @builder
        end
        def properties 
          Properties.new @builder
        end
        def rename 
          Rename.new @builder
        end
        def resolve 
          Resolve.new @builder
        end
        def rollback 
          Rollback.new @builder
        end
        def shelve 
          Shelve.new @builder
        end
        def shelvesets 
          Shelvesets.new @builder
        end
        def status 
          Status.new @builder
        end
        def undelete 
          Undelete.new @builder
        end
        def undo 
          Undo.new @builder
        end
        def unlabel 
          Unlabel.new @builder
        end
        def unshelve 
          Unshelve.new @builder
        end
        def view 
          View.new @builder
        end
        def workfold 
          Workfold.new @builder
        end
        def workspace 
          Workspace.new @builder
        end
        def workspaces 
          Workspaces.new @builder
        end
        def to_s 
          @builder.to_s
        end
      end
      class Add
        def initialize builder
          @builder = builder
          @builder.append 'add'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def lock lock_type=nil
          @builder.append "/lock:#{@builder.format lock_type}"
          self
        end
        def type file_type=nil
          @builder.append "/type:#{@builder.format file_type}"
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Branch
        def initialize builder
          @builder = builder
          @builder.append 'branch'
        end
        def old_item old_item=nil
          @builder.append "#{@builder.format old_item}"
          self
        end
        def new_item new_item=nil
          @builder.append "#{@builder.format new_item}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def no_get 
          @builder.append '/noGet'
          self
        end
        def lock lock_type=nil
          @builder.append "/lock:#{@builder.format lock_type}"
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def silent 
          @builder.append '/silent'
          self
        end
        def checkin 
          @builder.append '/checkin'
          self
        end
        def comment comment=nil
          @builder.append "/comment:#{@builder.format comment}"
          self
        end
        def author author_name=nil
          @builder.append "/author:#{@builder.format author_name}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Branches
        def initialize builder
          @builder = builder
          @builder.append 'branches'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Changeset
        def initialize builder
          @builder = builder
          @builder.append 'changeset'
        end
        def comment comment=nil
          @builder.append "/comment:#{@builder.format comment}"
          self
        end
        def notes notes=nil
          @builder.append "/notes:#{@builder.format notes}"
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def changeset_number changeset_number=nil
          @builder.append "#{@builder.format changeset_number}"
          self
        end
        def latest 
          @builder.append '/latest'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Checkin
        def initialize builder
          @builder = builder
          @builder.append 'checkin'
        end
        def author author_name=nil
          @builder.append "/author:#{@builder.format author_name}"
          self
        end
        def comment comment=nil
          @builder.append "/comment:#{@builder.format comment}"
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def notes notes=nil
          @builder.append "/notes:#{@builder.format notes}"
          self
        end
        def override reason=nil
          @builder.append "/override:#{@builder.format reason}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def saved 
          @builder.append '/saved'
          self
        end
        def validate 
          @builder.append '/validate'
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def bypass 
          @builder.append '/bypass'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def shelveset shelveset_name=nil
          @builder.append "/shelveset:#{@builder.format shelveset_name}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def force 
          @builder.append '/force'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Checkout
        def initialize builder
          @builder = builder
          @builder.append 'checkout'
        end
        def lock lock_type=nil
          @builder.append "/lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def type encoding=nil
          @builder.append "/type:#{@builder.format encoding}"
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Configure
        def initialize builder
          @builder = builder
          @builder.append 'configure'
        end
        def path_of_team_project path_of_team_project=nil
          @builder.append "#{@builder.format path_of_team_project}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Delete
        def initialize builder
          @builder = builder
          @builder.append 'delete'
        end
        def lock lock_type=nil
          @builder.append "/lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Diff
        def initialize builder
          @builder = builder
          @builder.append 'diff'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def item_spec2 item_spec2=nil
          @builder.append "#{@builder.format item_spec2}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def type file_type=nil
          @builder.append "/type:#{@builder.format file_type}"
          self
        end
        def format format=nil
          @builder.append "/format:#{@builder.format format}"
          self
        end
        def ignore_space 
          @builder.append '/ignoreSpace'
          self
        end
        def ignore_eol 
          @builder.append '/ignoreEol'
          self
        end
        def ignore_case 
          @builder.append '/ignoreCase'
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def options 
          @builder.append '/options'
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def shelveset shelveset_name=nil
          @builder.append "/shelveset:#{@builder.format shelveset_name}"
          self
        end
        def shelveset_itemspec shelveset_itemspec=nil
          @builder.append "#{@builder.format shelveset_itemspec}"
          self
        end
        def configure 
          @builder.append '/configure'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Dir
        def initialize builder
          @builder = builder
          @builder.append 'dir'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def folders 
          @builder.append '/folders'
          self
        end
        def deleted 
          @builder.append '/deleted'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class FolderDiff
        def initialize builder
          @builder = builder
          @builder.append 'folderDiff'
        end
        def source_path source_path=nil
          @builder.append "#{@builder.format source_path}"
          self
        end
        def target_path target_path=nil
          @builder.append "#{@builder.format target_path}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def filter filter=nil
          @builder.append "/filter:#{@builder.format filter}"
          self
        end
        def filter_local_paths_only 
          @builder.append '/filterLocalPathsOnly'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def view view=nil
          @builder.append "/view:#{@builder.format view}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Get
        def initialize builder
          @builder = builder
          @builder.append 'get'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def all 
          @builder.append '/all'
          self
        end
        def overwrite 
          @builder.append '/overwrite'
          self
        end
        def force 
          @builder.append '/force'
          self
        end
        def preview 
          @builder.append '/preview'
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def remap 
          @builder.append '/remap'
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class History
        def initialize builder
          @builder = builder
          @builder.append 'history'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def stop_after number=nil
          @builder.append "/stopAfter:#{@builder.format number}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def user user_name=nil
          @builder.append "/user:#{@builder.format user_name}"
          self
        end
        def format format=nil
          @builder.append "/format:#{@builder.format format}"
          self
        end
        def slot_mode 
          @builder.append '/slotMode'
          self
        end
        def item_mode 
          @builder.append '/itemMode'
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def sort sort=nil
          @builder.append "/sort:#{@builder.format sort}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Label
        def initialize builder
          @builder = builder
          @builder.append 'label'
        end
        def label_name label_name=nil
          @builder.append "#{@builder.format label_name}"
          self
        end
        def owner owner_name=nil
          @builder.append "/owner:#{@builder.format owner_name}"
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def comment comment=nil
          @builder.append "/comment:#{@builder.format comment}"
          self
        end
        def child lock_type=nil
          @builder.append "/child:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def delete 
          @builder.append '/delete'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Labels
        def initialize builder
          @builder = builder
          @builder.append 'labels'
        end
        def owner owner_name=nil
          @builder.append "/owner:#{@builder.format owner_name}"
          self
        end
        def format format=nil
          @builder.append "/format:#{@builder.format format}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def label_name label_name=nil
          @builder.append "#{@builder.format label_name}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class LocalVersions
        def initialize builder
          @builder = builder
          @builder.append 'localVersions'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def format format=nil
          @builder.append "/format:#{@builder.format format}"
          self
        end
        def workspace workspace_name=nil
          @builder.append "/workspace:#{@builder.format workspace_name}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Lock
        def initialize builder
          @builder = builder
          @builder.append 'lock'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def lock lock_type=nil
          @builder.append "/lock:#{@builder.format lock_type}"
          self
        end
        def workspace workspace_name=nil
          @builder.append "/workspace:#{@builder.format workspace_name}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Merge
        def initialize builder
          @builder = builder
          @builder.append 'merge'
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def force 
          @builder.append '/force'
          self
        end
        def candidate 
          @builder.append '/candidate'
          self
        end
        def discard 
          @builder.append '/discard'
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def lock lock_type=nil
          @builder.append "/lock:#{@builder.format lock_type}"
          self
        end
        def preview 
          @builder.append '/preview'
          self
        end
        def baseless 
          @builder.append '/baseless'
          self
        end
        def no_summary 
          @builder.append '/noSummary'
          self
        end
        def no_implicit_baseless 
          @builder.append '/noImplicitBaseless'
          self
        end
        def conservative 
          @builder.append '/conservative'
          self
        end
        def format format=nil
          @builder.append "/format:#{@builder.format format}"
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def source source=nil
          @builder.append "#{@builder.format source}"
          self
        end
        def destination destination=nil
          @builder.append "#{@builder.format destination}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Merges
        def initialize builder
          @builder = builder
          @builder.append 'merges'
        end
        def source source=nil
          @builder.append "#{@builder.format source}"
          self
        end
        def destination destination=nil
          @builder.append "#{@builder.format destination}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def extended 
          @builder.append '/extended'
          self
        end
        def format format=nil
          @builder.append "/format:#{@builder.format format}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def show_all 
          @builder.append '/showAll'
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Permissions
        def initialize builder
          @builder = builder
          @builder.append 'permissions'
        end
        def allow permission=nil
          @builder.append "/allow:#{@builder.format permission}"
          self
        end
        def deny permission=nil
          @builder.append "/deny:#{@builder.format permission}"
          self
        end
        def remove permission=nil
          @builder.append "/remove:#{@builder.format permission}"
          self
        end
        def inherit inherit=nil
          @builder.append "/inherit:#{@builder.format inherit}"
          self
        end
        def user user_name=nil
          @builder.append "/user:#{@builder.format user_name}"
          self
        end
        def group group_name=nil
          @builder.append "/group:#{@builder.format group_name}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def global 
          @builder.append '/global'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Properties
        def initialize builder
          @builder = builder
          @builder.append 'properties'
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def workspace 
          @builder.append '/workspace'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Rename
        def initialize builder
          @builder = builder
          @builder.append 'rename'
        end
        def lock lock_type=nil
          @builder.append "/lock:#{@builder.format lock_type}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def old_item old_item=nil
          @builder.append "#{@builder.format old_item}"
          self
        end
        def new_item new_item=nil
          @builder.append "#{@builder.format new_item}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Resolve
        def initialize builder
          @builder = builder
          @builder.append 'resolve'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def auto resolution=nil
          @builder.append "/auto:#{@builder.format resolution}"
          self
        end
        def preview 
          @builder.append '/preview'
          self
        end
        def override_type override_type=nil
          @builder.append "/overrideType:#{@builder.format override_type}"
          self
        end
        def convert_to_type convert_type=nil
          @builder.append "/convertToType:#{@builder.format convert_type}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def new_name path=nil
          @builder.append "/newName:#{@builder.format path}"
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Rollback
        def initialize builder
          @builder = builder
          @builder.append 'rollback'
        end
        def to_version version_spec=nil
          @builder.append "/toVersion:#{@builder.format version_spec}"
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def lock lock_type=nil
          @builder.append "/lock:#{@builder.format lock_type}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def keep_merge_history 
          @builder.append '/keepMergeHistory'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def changeset changeset=nil
          @builder.append "/changeset:#{@builder.format changeset}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Shelve
        def initialize builder
          @builder = builder
          @builder.append 'shelve'
        end
        def replace 
          @builder.append '/replace'
          self
        end
        def comment comment=nil
          @builder.append "/comment:#{@builder.format comment}"
          self
        end
        def shelveset_name shelveset_name=nil
          @builder.append "#{@builder.format shelveset_name}"
          self
        end
        def validate 
          @builder.append '/validate'
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def move 
          @builder.append '/move'
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def delete 
          @builder.append '/delete'
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Shelvesets
        def initialize builder
          @builder = builder
          @builder.append 'shelvesets'
        end
        def owner owner_name=nil
          @builder.append "/owner:#{@builder.format owner_name}"
          self
        end
        def format format=nil
          @builder.append "/format:#{@builder.format format}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def shelveset_name shelveset_name=nil
          @builder.append "#{@builder.format shelveset_name}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Status
        def initialize builder
          @builder = builder
          @builder.append 'status'
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def workspace workspace_name=nil
          @builder.append "/workspace:#{@builder.format workspace_name}"
          self
        end
        def shelveset shelveset_name=nil
          @builder.append "/shelveset:#{@builder.format shelveset_name}"
          self
        end
        def format format=nil
          @builder.append "/format:#{@builder.format format}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def user user_name=nil
          @builder.append "/user:#{@builder.format user_name}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Undelete
        def initialize builder
          @builder = builder
          @builder.append 'undelete'
        end
        def no_get 
          @builder.append '/noGet'
          self
        end
        def lock lock_type=nil
          @builder.append "/lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Undo
        def initialize builder
          @builder = builder
          @builder.append 'undo'
        end
        def workspace workspace_name=nil
          @builder.append "/workspace:#{@builder.format workspace_name}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Unlabel
        def initialize builder
          @builder = builder
          @builder.append 'unlabel'
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def label_name label_name=nil
          @builder.append "#{@builder.format label_name}"
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Unshelve
        def initialize builder
          @builder = builder
          @builder.append 'unshelve'
        end
        def move 
          @builder.append '/move'
          self
        end
        def shelveset_name shelveset_name=nil
          @builder.append "#{@builder.format shelveset_name}"
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class View
        def initialize builder
          @builder = builder
          @builder.append 'view'
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def console 
          @builder.append '/console'
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def output local_file=nil
          @builder.append "/output:#{@builder.format local_file}"
          self
        end
        def shelveset shelveset_name=nil
          @builder.append "/shelveset:#{@builder.format shelveset_name}"
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def item_spec item_spec=nil
          @builder.append "#{@builder.format item_spec}"
          self
        end
        def version version_spec=nil
          @builder.append "/version:#{@builder.format version_spec}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Workfold
        def initialize builder
          @builder = builder
          @builder.append 'workfold'
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def workspace workspace_name=nil
          @builder.append "/workspace:#{@builder.format workspace_name}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def map 
          @builder.append '/map'
          self
        end
        def server_folder server_folder=nil
          @builder.append "#{@builder.format server_folder}"
          self
        end
        def local_folder local_folder=nil
          @builder.append "#{@builder.format local_folder}"
          self
        end
        def unmap 
          @builder.append '/unmap'
          self
        end
        def recursive 
          @builder.append '/recursive'
          self
        end
        def cloak 
          @builder.append '/cloak'
          self
        end
        def decloak 
          @builder.append '/decloak'
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Workspace
        def initialize builder
          @builder = builder
          @builder.append 'workspace'
        end
        def new 
          @builder.append '/new'
          self
        end
        def no_prompt 
          @builder.append '/noPrompt'
          self
        end
        def template workspace_name=nil
          @builder.append "/template:#{@builder.format workspace_name}"
          self
        end
        def computer computer_name=nil
          @builder.append "/computer:#{@builder.format computer_name}"
          self
        end
        def comment comment=nil
          @builder.append "/comment:#{@builder.format comment}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def permission permission=nil
          @builder.append "/permission:#{@builder.format permission}"
          self
        end
        def workspace_name workspace_name=nil
          @builder.append "#{@builder.format workspace_name}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def delete 
          @builder.append '/delete'
          self
        end
        def new_name workspace_name=nil
          @builder.append "/newName:#{@builder.format workspace_name}"
          self
        end
        def new_owner owner_name=nil
          @builder.append "/newOwner:#{@builder.format owner_name}"
          self
        end
        def to_s 
          @builder.to_s
        end
      end
      class Workspaces
        def initialize builder
          @builder = builder
          @builder.append 'workspaces'
        end
        def owner owner_name=nil
          @builder.append "/owner:#{@builder.format owner_name}"
          self
        end
        def computer computer_name=nil
          @builder.append "/computer:#{@builder.format computer_name}"
          self
        end
        def collection team_project_collection_url=nil
          @builder.append "/collection:#{@builder.format team_project_collection_url}"
          self
        end
        def format format=nil
          @builder.append "/format:#{@builder.format format}"
          self
        end
        def update_user_name old_user_name=nil
          @builder.append "/updateUserName:#{@builder.format old_user_name}"
          self
        end
        def update_computer_name old_computer_name=nil
          @builder.append "/updateComputerName:#{@builder.format old_computer_name}"
          self
        end
        def workspace_name workspace_name=nil
          @builder.append "#{@builder.format workspace_name}"
          self
        end
        def login credentials=nil
          @builder.append "/login:#{@builder.format credentials}"
          self
        end
        def remove workspace_name=nil
          @builder.append "/remove:#{@builder.format workspace_name}"
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
