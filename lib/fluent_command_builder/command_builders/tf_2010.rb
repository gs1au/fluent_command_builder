require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Tf
    module V2010
      class Tf
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'tf'
          self
        end
        
        def add 
          Add.new self
        end
        
        def branch 
          Branch.new self
        end
        
        def branches 
          Branches.new self
        end
        
        def changeset 
          Changeset.new self
        end
        
        def checkin 
          Checkin.new self
        end
        
        def checkout 
          Checkout.new self
        end
        
        def configure 
          Configure.new self
        end
        
        def delete 
          Delete.new self
        end
        
        def destroy 
          Destroy.new self
        end
        
        def diff 
          Diff.new self
        end
        
        def dir 
          Dir.new self
        end
        
        def folder_diff 
          FolderDiff.new self
        end
        
        def get 
          Get.new self
        end
        
        def history 
          History.new self
        end
        
        def label 
          Label.new self
        end
        
        def labels 
          Labels.new self
        end
        
        def local_versions 
          LocalVersions.new self
        end
        
        def lock 
          Lock.new self
        end
        
        def merge 
          Merge.new self
        end
        
        def merges 
          Merges.new self
        end
        
        def permissions 
          Permissions.new self
        end
        
        def properties 
          Properties.new self
        end
        
        def rename 
          Rename.new self
        end
        
        def resolve 
          Resolve.new self
        end
        
        def rollback 
          Rollback.new self
        end
        
        def shelve 
          Shelve.new self
        end
        
        def shelvesets 
          Shelvesets.new self
        end
        
        def status 
          Status.new self
        end
        
        def undelete 
          Undelete.new self
        end
        
        def undo 
          Undo.new self
        end
        
        def unlabel 
          Unlabel.new self
        end
        
        def unshelve 
          Unshelve.new self
        end
        
        def view 
          View.new self
        end
        
        def workfold 
          Workfold.new self
        end
        
        def workspace 
          Workspace.new self
        end
        
        def workspaces 
          Workspaces.new self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Add
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'add'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def lock lock_type
          @b.append "/lock:#{@b.format lock_type}"
          self
        end
        
        def type file_type
          @b.append "/type:#{@b.format file_type}"
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Branch
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'branch'
          self
        end
        
        def old_item old_item
          @b.append "#{@b.format old_item}"
          self
        end
        
        def new_item new_item
          @b.append "#{@b.format new_item}"
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def no_get 
          @b.append '/noGet'
          self
        end
        
        def lock lock_type
          @b.append "/lock:#{@b.format lock_type}"
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def silent 
          @b.append '/silent'
          self
        end
        
        def checkin 
          @b.append '/checkin'
          self
        end
        
        def comment comment
          @b.append "/comment:#{@b.format comment}"
          self
        end
        
        def author author_name
          @b.append "/author:#{@b.format author_name}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Branches
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'branches'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Changeset
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'changeset'
          self
        end
        
        def comment comment
          @b.append "/comment:#{@b.format comment}"
          self
        end
        
        def notes notes
          @b.append "/notes:#{@b.format notes}"
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def changeset_number changeset_number
          @b.append "#{@b.format changeset_number}"
          self
        end
        
        def latest 
          @b.append '/latest'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Checkin
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'checkin'
          self
        end
        
        def author author_name
          @b.append "/author:#{@b.format author_name}"
          self
        end
        
        def comment comment
          @b.append "/comment:#{@b.format comment}"
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def notes notes
          @b.append "/notes:#{@b.format notes}"
          self
        end
        
        def override reason
          @b.append "/override:#{@b.format reason}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def saved 
          @b.append '/saved'
          self
        end
        
        def validate 
          @b.append '/validate'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def bypass 
          @b.append '/bypass'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def shelveset shelveset_name
          @b.append "/shelveset:#{@b.format shelveset_name}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def force 
          @b.append '/force'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Checkout
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'checkout'
          self
        end
        
        def lock lock_type
          @b.append "/lock:#{@b.format lock_type}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def type encoding
          @b.append "/type:#{@b.format encoding}"
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Configure
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'configure'
          self
        end
        
        def path_of_team_project path_of_team_project
          @b.append "#{@b.format path_of_team_project}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Delete
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'delete'
          self
        end
        
        def lock lock_type
          @b.append "/lock:#{@b.format lock_type}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Destroy
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'destroy'
          self
        end
        
        def t_o_d_o 
          @b.append '/TODO'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Diff
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'diff'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def item_spec2 item_spec2
          @b.append "#{@b.format item_spec2}"
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def type file_type
          @b.append "/type:#{@b.format file_type}"
          self
        end
        
        def format format
          @b.append "/format:#{@b.format format}"
          self
        end
        
        def ignore_space 
          @b.append '/ignoreSpace'
          self
        end
        
        def ignore_eol 
          @b.append '/ignoreEol'
          self
        end
        
        def ignore_case 
          @b.append '/ignoreCase'
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def options 
          @b.append '/options'
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def shelveset shelveset_name
          @b.append "/shelveset:#{@b.format shelveset_name}"
          self
        end
        
        def shelveset_itemspec shelveset_itemspec
          @b.append "#{@b.format shelveset_itemspec}"
          self
        end
        
        def configure 
          @b.append '/configure'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Dir
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'dir'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def folders 
          @b.append '/folders'
          self
        end
        
        def deleted 
          @b.append '/deleted'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class FolderDiff
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'folderDiff'
          self
        end
        
        def source_path source_path
          @b.append "#{@b.format source_path}"
          self
        end
        
        def target_path target_path
          @b.append "#{@b.format target_path}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def filter filter
          @b.append "/filter:#{@b.format filter}"
          self
        end
        
        def filter_local_paths_only 
          @b.append '/filterLocalPathsOnly'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def view view
          @b.append "/view:#{@b.format view}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Get
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'get'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def all 
          @b.append '/all'
          self
        end
        
        def overwrite 
          @b.append '/overwrite'
          self
        end
        
        def force 
          @b.append '/force'
          self
        end
        
        def preview 
          @b.append '/preview'
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def remap 
          @b.append '/remap'
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class History
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'history'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def stop_after number
          @b.append "/stopAfter:#{@b.format number}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def user user_name
          @b.append "/user:#{@b.format user_name}"
          self
        end
        
        def format format
          @b.append "/format:#{@b.format format}"
          self
        end
        
        def slot_mode 
          @b.append '/slotMode'
          self
        end
        
        def item_mode 
          @b.append '/itemMode'
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def sort sort
          @b.append "/sort:#{@b.format sort}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Label
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'label'
          self
        end
        
        def label_name label_name
          @b.append "#{@b.format label_name}"
          self
        end
        
        def owner owner_name
          @b.append "/owner:#{@b.format owner_name}"
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def comment comment
          @b.append "/comment:#{@b.format comment}"
          self
        end
        
        def child lock_type
          @b.append "/child:#{@b.format lock_type}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def delete 
          @b.append '/delete'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Labels
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'labels'
          self
        end
        
        def owner owner_name
          @b.append "/owner:#{@b.format owner_name}"
          self
        end
        
        def format format
          @b.append "/format:#{@b.format format}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def label_name label_name
          @b.append "#{@b.format label_name}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class LocalVersions
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'localVersions'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def format format
          @b.append "/format:#{@b.format format}"
          self
        end
        
        def workspace workspace_name
          @b.append "/workspace:#{@b.format workspace_name}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Lock
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'lock'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def lock lock_type
          @b.append "/lock:#{@b.format lock_type}"
          self
        end
        
        def workspace workspace_name
          @b.append "/workspace:#{@b.format workspace_name}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Merge
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'merge'
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def force 
          @b.append '/force'
          self
        end
        
        def candidate 
          @b.append '/candidate'
          self
        end
        
        def discard 
          @b.append '/discard'
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def lock lock_type
          @b.append "/lock:#{@b.format lock_type}"
          self
        end
        
        def preview 
          @b.append '/preview'
          self
        end
        
        def baseless 
          @b.append '/baseless'
          self
        end
        
        def no_summary 
          @b.append '/noSummary'
          self
        end
        
        def no_implicit_baseless 
          @b.append '/noImplicitBaseless'
          self
        end
        
        def conservative 
          @b.append '/conservative'
          self
        end
        
        def format format
          @b.append "/format:#{@b.format format}"
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def source source
          @b.append "#{@b.format source}"
          self
        end
        
        def destination destination
          @b.append "#{@b.format destination}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Merges
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'merges'
          self
        end
        
        def source source
          @b.append "#{@b.format source}"
          self
        end
        
        def destination destination
          @b.append "#{@b.format destination}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def extended 
          @b.append '/extended'
          self
        end
        
        def format format
          @b.append "/format:#{@b.format format}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def show_all 
          @b.append '/showAll'
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Permissions
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'permissions'
          self
        end
        
        def allow permission
          @b.append "/allow:#{@b.format permission}"
          self
        end
        
        def deny permission
          @b.append "/deny:#{@b.format permission}"
          self
        end
        
        def remove permission
          @b.append "/remove:#{@b.format permission}"
          self
        end
        
        def inherit inherit
          @b.append "/inherit:#{@b.format inherit}"
          self
        end
        
        def user user_name
          @b.append "/user:#{@b.format user_name}"
          self
        end
        
        def group group_name
          @b.append "/group:#{@b.format group_name}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def global 
          @b.append '/global'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Properties
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'properties'
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def workspace 
          @b.append '/workspace'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Rename
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'rename'
          self
        end
        
        def lock lock_type
          @b.append "/lock:#{@b.format lock_type}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def old_item old_item
          @b.append "#{@b.format old_item}"
          self
        end
        
        def new_item new_item
          @b.append "#{@b.format new_item}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Resolve
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'resolve'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def auto resolution
          @b.append "/auto:#{@b.format resolution}"
          self
        end
        
        def preview 
          @b.append '/preview'
          self
        end
        
        def override_type override_type
          @b.append "/overrideType:#{@b.format override_type}"
          self
        end
        
        def convert_to_type convert_type
          @b.append "/convertToType:#{@b.format convert_type}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def new_name path
          @b.append "/newName:#{@b.format path}"
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Rollback
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'rollback'
          self
        end
        
        def to_version version_spec
          @b.append "/toVersion:#{@b.format version_spec}"
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def lock lock_type
          @b.append "/lock:#{@b.format lock_type}"
          self
        end
        
        def version version_spec
          @b.append "/version:#{@b.format version_spec}"
          self
        end
        
        def keep_merge_history 
          @b.append '/keepMergeHistory'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def changeset changeset
          @b.append "/changeset:#{@b.format changeset}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Shelve
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'shelve'
          self
        end
        
        def replace 
          @b.append '/replace'
          self
        end
        
        def comment comment
          @b.append "/comment:#{@b.format comment}"
          self
        end
        
        def shelveset_name shelveset_name
          @b.append "#{@b.format shelveset_name}"
          self
        end
        
        def validate 
          @b.append '/validate'
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def move 
          @b.append '/move'
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def delete 
          @b.append '/delete'
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Shelvesets
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'shelvesets'
          self
        end
        
        def owner owner_name
          @b.append "/owner:#{@b.format owner_name}"
          self
        end
        
        def format format
          @b.append "/format:#{@b.format format}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def shelveset_name shelveset_name
          @b.append "#{@b.format shelveset_name}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Status
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'status'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def workspace workspace_name
          @b.append "/workspace:#{@b.format workspace_name}"
          self
        end
        
        def shelveset shelveset_name
          @b.append "/shelveset:#{@b.format shelveset_name}"
          self
        end
        
        def format format
          @b.append "/format:#{@b.format format}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def user user_name
          @b.append "/user:#{@b.format user_name}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Undelete
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'undelete'
          self
        end
        
        def no_get 
          @b.append '/noGet'
          self
        end
        
        def lock lock_type
          @b.append "/lock:#{@b.format lock_type}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Undo
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'undo'
          self
        end
        
        def workspace workspace_name
          @b.append "/workspace:#{@b.format workspace_name}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Unlabel
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'unlabel'
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def label_name label_name
          @b.append "#{@b.format label_name}"
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Unshelve
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'unshelve'
          self
        end
        
        def move 
          @b.append '/move'
          self
        end
        
        def shelveset_name shelveset_name
          @b.append "#{@b.format shelveset_name}"
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class View
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'view'
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def console 
          @b.append '/console'
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def output local_file
          @b.append "/output:#{@b.format local_file}"
          self
        end
        
        def shelveset shelveset_name
          @b.append "/shelveset:#{@b.format shelveset_name}"
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def item_spec item_spec
          @b.append "#{@b.format item_spec}"
          self
        end
        
        def version 
          @b.append '/version:versionSpec'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Workfold
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'workfold'
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def workspace workspace_name
          @b.append "/workspace:#{@b.format workspace_name}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def map 
          @b.append '/map'
          self
        end
        
        def server_folder server_folder
          @b.append "#{@b.format server_folder}"
          self
        end
        
        def local_folder local_folder
          @b.append "#{@b.format local_folder}"
          self
        end
        
        def unmap 
          @b.append '/unmap'
          self
        end
        
        def recursive 
          @b.append '/recursive'
          self
        end
        
        def cloak 
          @b.append '/cloak'
          self
        end
        
        def decloak 
          @b.append '/decloak'
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Workspace
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'workspace'
          self
        end
        
        def new 
          @b.append '/new'
          self
        end
        
        def no_prompt 
          @b.append '/noPrompt'
          self
        end
        
        def template workspace_name
          @b.append "/template:#{@b.format workspace_name}"
          self
        end
        
        def computer computer_name
          @b.append "/computer:#{@b.format computer_name}"
          self
        end
        
        def comment comment
          @b.append "/comment:#{@b.format comment}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def permission permission
          @b.append "/permission:#{@b.format permission}"
          self
        end
        
        def workspace_name workspace_name
          @b.append "#{@b.format workspace_name}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def delete 
          @b.append '/delete'
          self
        end
        
        def new_name workspace_name
          @b.append "/newName:#{@b.format workspace_name}"
          self
        end
        
        def new_owner owner_name
          @b.append "/newOwner:#{@b.format owner_name}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      class Workspaces
        def initialize command=nil
          @b = CommandBuilder.new command
          @b.append 'workspaces'
          self
        end
        
        def owner owner_name
          @b.append "/owner:#{@b.format owner_name}"
          self
        end
        
        def computer computer_name
          @b.append "/computer:#{@b.format computer_name}"
          self
        end
        
        def collection team_project_collection_url
          @b.append "/collection:#{@b.format team_project_collection_url}"
          self
        end
        
        def format format
          @b.append "/format:#{@b.format format}"
          self
        end
        
        def update_user_name old_user_name
          @b.append "/updateUserName:#{@b.format old_user_name}"
          self
        end
        
        def update_computer_name old_computer_name
          @b.append "/updateComputerName:#{@b.format old_computer_name}"
          self
        end
        
        def workspace_name workspace_name
          @b.append "#{@b.format workspace_name}"
          self
        end
        
        def login credentials
          @b.append "/login:#{@b.format credentials}"
          self
        end
        
        def remove workspace_name
          @b.append "/remove:#{@b.format workspace_name}"
          self
        end
        
        def to_s
          @b.to_s
        end
        
      end
      
      def tf
        Tf.new
      end
      
    end
    
  end
  
  def tf_2010
    Tf::V2010::Tf.new
  end
  
end

