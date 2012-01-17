require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Tf
    module V2010
      class Tf
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'tf'
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
        
        def folderdiff
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
        
        def localversions
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
          @builder.to_s
        end
        
      end
      
      class Add
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'add'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def lock lock_type
          @builder.append "/lock:#{lock_type}"
          self
        end
        
        def type file_type
          @builder.append "/type:#{file_type}"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Branch
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'branch'
          self
        end
        
        def old_item old_item
          @builder.append "#{old_item}"
          self
        end
        
        def new_item new_item
          @builder.append "#{new_item}"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def no_get 
          @builder.append "/noGet"
          self
        end
        
        def lock lock_type
          @builder.append "/lock:#{lock_type}"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def silent 
          @builder.append "/silent"
          self
        end
        
        def checkin 
          @builder.append "/checkin"
          self
        end
        
        def comment comment
          @builder.append "/comment:#{comment}"
          self
        end
        
        def author author_name
          @builder.append "/author:#{author_name}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Branches
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'branches'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Changeset
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'changeset'
          self
        end
        
        def comment comment
          @builder.append "/comment:#{comment}"
          self
        end
        
        def notes notes
          @builder.append "/notes:#{notes}"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def changeset_number changeset_number
          @builder.append "#{changeset_number}"
          self
        end
        
        def latest 
          @builder.append "/latest"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Checkin
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'checkin'
          self
        end
        
        def author author_name
          @builder.append "/author:#{author_name}"
          self
        end
        
        def comment comment
          @builder.append "/comment:#{comment}"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def notes notes
          @builder.append "/notes:#{notes}"
          self
        end
        
        def override reason
          @builder.append "/override:#{reason}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def saved 
          @builder.append "/saved"
          self
        end
        
        def validate 
          @builder.append "/validate"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def bypass 
          @builder.append "/bypass"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def shelveset shelveset_name
          @builder.append "/shelveset:#{shelveset_name}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def force 
          @builder.append "/force"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Checkout
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'checkout'
          self
        end
        
        def lock lock_type
          @builder.append "/lock:#{lock_type}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def type encoding
          @builder.append "/type:#{encoding}"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Configure
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'configure'
          self
        end
        
        def path_of_team_project path_of_team_project
          @builder.append "#{path_of_team_project}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Delete
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'delete'
          self
        end
        
        def lock lock_type
          @builder.append "/lock:#{lock_type}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Destroy
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'destroy'
          self
        end
        
        def t_o_d_o 
          @builder.append "/TODO"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Diff
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'diff'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def item_spec2 item_spec2
          @builder.append "#{item_spec2}"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def type file_type
          @builder.append "/type:#{file_type}"
          self
        end
        
        def format format
          @builder.append "/format:#{format}"
          self
        end
        
        def ignore_space 
          @builder.append "/ignoreSpace"
          self
        end
        
        def ignore_eol 
          @builder.append "/ignoreEol"
          self
        end
        
        def ignore_case 
          @builder.append "/ignoreCase"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def options 
          @builder.append "/options"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def shelveset shelveset_name
          @builder.append "/shelveset:#{shelveset_name}"
          self
        end
        
        def shelveset_itemspec shelveset_itemspec
          @builder.append "#{shelveset_itemspec}"
          self
        end
        
        def configure 
          @builder.append "/configure"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Dir
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'dir'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def folders 
          @builder.append "/folders"
          self
        end
        
        def deleted 
          @builder.append "/deleted"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class FolderDiff
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'folderDiff'
          self
        end
        
        def source_path source_path
          @builder.append "#{source_path}"
          self
        end
        
        def target_path target_path
          @builder.append "#{target_path}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def filter filter
          @builder.append "/filter:#{filter}"
          self
        end
        
        def filter_local_paths_only 
          @builder.append "/filterLocalPathsOnly"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def view view
          @builder.append "/view:#{view}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Get
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'get'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def all 
          @builder.append "/all"
          self
        end
        
        def overwrite 
          @builder.append "/overwrite"
          self
        end
        
        def force 
          @builder.append "/force"
          self
        end
        
        def preview 
          @builder.append "/preview"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def remap 
          @builder.append "/remap"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class History
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'history'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def stop_after number
          @builder.append "/stopAfter:#{number}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def user user_name
          @builder.append "/user:#{user_name}"
          self
        end
        
        def format format
          @builder.append "/format:#{format}"
          self
        end
        
        def slot_mode 
          @builder.append "/slotMode"
          self
        end
        
        def item_mode 
          @builder.append "/itemMode"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def sort sort
          @builder.append "/sort:#{sort}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Label
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'label'
          self
        end
        
        def label_name label_name
          @builder.append "#{label_name}"
          self
        end
        
        def owner owner_name
          @builder.append "/owner:#{owner_name}"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def comment comment
          @builder.append "/comment:#{comment}"
          self
        end
        
        def child lock_type
          @builder.append "/child:#{lock_type}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def delete 
          @builder.append "/delete"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Labels
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'labels'
          self
        end
        
        def owner owner_name
          @builder.append "/owner:#{owner_name}"
          self
        end
        
        def format format
          @builder.append "/format:#{format}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def label_name label_name
          @builder.append "#{label_name}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class LocalVersions
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'localVersions'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def format format
          @builder.append "/format:#{format}"
          self
        end
        
        def workspace workspace_name
          @builder.append "/workspace:#{workspace_name}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Lock
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'lock'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def lock lock_type
          @builder.append "/lock:#{lock_type}"
          self
        end
        
        def workspace workspace_name
          @builder.append "/workspace:#{workspace_name}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Merge
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'merge'
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def force 
          @builder.append "/force"
          self
        end
        
        def candidate 
          @builder.append "/candidate"
          self
        end
        
        def discard 
          @builder.append "/discard"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def lock lock_type
          @builder.append "/lock:#{lock_type}"
          self
        end
        
        def preview 
          @builder.append "/preview"
          self
        end
        
        def baseless 
          @builder.append "/baseless"
          self
        end
        
        def no_summary 
          @builder.append "/noSummary"
          self
        end
        
        def no_implicit_baseless 
          @builder.append "/noImplicitBaseless"
          self
        end
        
        def conservative 
          @builder.append "/conservative"
          self
        end
        
        def format format
          @builder.append "/format:#{format}"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def source source
          @builder.append "#{source}"
          self
        end
        
        def destination destination
          @builder.append "#{destination}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Merges
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'merges'
          self
        end
        
        def source source
          @builder.append "#{source}"
          self
        end
        
        def destination destination
          @builder.append "#{destination}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def extended 
          @builder.append "/extended"
          self
        end
        
        def format format
          @builder.append "/format:#{format}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def show_all 
          @builder.append "/showAll"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Permissions
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'permissions'
          self
        end
        
        def allow permission
          @builder.append "/allow:#{permission}"
          self
        end
        
        def deny permission
          @builder.append "/deny:#{permission}"
          self
        end
        
        def remove permission
          @builder.append "/remove:#{permission}"
          self
        end
        
        def inherit inherit
          @builder.append "/inherit:#{inherit}"
          self
        end
        
        def user user_name
          @builder.append "/user:#{user_name}"
          self
        end
        
        def group group_name
          @builder.append "/group:#{group_name}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def global 
          @builder.append "/global"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Properties
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'properties'
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def workspace 
          @builder.append "/workspace"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Rename
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'rename'
          self
        end
        
        def lock lock_type
          @builder.append "/lock:#{lock_type}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def old_item old_item
          @builder.append "#{old_item}"
          self
        end
        
        def new_item new_item
          @builder.append "#{new_item}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Resolve
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'resolve'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def auto resolution
          @builder.append "/auto:#{resolution}"
          self
        end
        
        def preview 
          @builder.append "/preview"
          self
        end
        
        def override_type override_type
          @builder.append "/overrideType:#{override_type}"
          self
        end
        
        def convert_to_type convert_type
          @builder.append "/convertToType:#{convert_type}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def new_name path
          @builder.append "/newName:#{path}"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Rollback
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'rollback'
          self
        end
        
        def to_version version_spec
          @builder.append "/toVersion:#{version_spec}"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def lock lock_type
          @builder.append "/lock:#{lock_type}"
          self
        end
        
        def version version_spec
          @builder.append "/version:#{version_spec}"
          self
        end
        
        def keep_merge_history 
          @builder.append "/keepMergeHistory"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def changeset changeset
          @builder.append "/changeset:#{changeset}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Shelve
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'shelve'
          self
        end
        
        def replace 
          @builder.append "/replace"
          self
        end
        
        def comment comment
          @builder.append "/comment:#{comment}"
          self
        end
        
        def shelveset_name shelveset_name
          @builder.append "#{shelveset_name}"
          self
        end
        
        def validate 
          @builder.append "/validate"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def move 
          @builder.append "/move"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def delete 
          @builder.append "/delete"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Shelvesets
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'shelvesets'
          self
        end
        
        def owner owner_name
          @builder.append "/owner:#{owner_name}"
          self
        end
        
        def format format
          @builder.append "/format:#{format}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def shelveset_name shelveset_name
          @builder.append "#{shelveset_name}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Status
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'status'
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def workspace workspace_name
          @builder.append "/workspace:#{workspace_name}"
          self
        end
        
        def shelveset shelveset_name
          @builder.append "/shelveset:#{shelveset_name}"
          self
        end
        
        def format format
          @builder.append "/format:#{format}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def user user_name
          @builder.append "/user:#{user_name}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Undelete
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'undelete'
          self
        end
        
        def no_get 
          @builder.append "/noGet"
          self
        end
        
        def lock lock_type
          @builder.append "/lock:#{lock_type}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Undo
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'undo'
          self
        end
        
        def workspace workspace_name
          @builder.append "/workspace:#{workspace_name}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Unlabel
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'unlabel'
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def label_name label_name
          @builder.append "#{label_name}"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Unshelve
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'unshelve'
          self
        end
        
        def move 
          @builder.append "/move"
          self
        end
        
        def shelveset_name shelveset_name
          @builder.append "#{shelveset_name}"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class View
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'view'
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def console 
          @builder.append "/console"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def output local_file
          @builder.append "/output:#{local_file}"
          self
        end
        
        def shelveset shelveset_name
          @builder.append "/shelveset:#{shelveset_name}"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def item_spec item_spec
          @builder.append "#{item_spec}"
          self
        end
        
        def version 
          @builder.append "/version:versionSpec"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Workfold
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'workfold'
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def workspace workspace_name
          @builder.append "/workspace:#{workspace_name}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def map 
          @builder.append "/map"
          self
        end
        
        def server_folder server_folder
          @builder.append "#{server_folder}"
          self
        end
        
        def local_folder local_folder
          @builder.append "#{local_folder}"
          self
        end
        
        def unmap 
          @builder.append "/unmap"
          self
        end
        
        def recursive 
          @builder.append "/recursive"
          self
        end
        
        def cloak 
          @builder.append "/cloak"
          self
        end
        
        def decloak 
          @builder.append "/decloak"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Workspace
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'workspace'
          self
        end
        
        def new 
          @builder.append "/new"
          self
        end
        
        def no_prompt 
          @builder.append "/noPrompt"
          self
        end
        
        def template workspace_name
          @builder.append "/template:#{workspace_name}"
          self
        end
        
        def computer computer_name
          @builder.append "/computer:#{computer_name}"
          self
        end
        
        def comment comment
          @builder.append "/comment:#{comment}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def permission permission
          @builder.append "/permission:#{permission}"
          self
        end
        
        def workspace_name workspace_name
          @builder.append "#{workspace_name}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def delete 
          @builder.append "/delete"
          self
        end
        
        def new_name workspace_name
          @builder.append "/newName:#{workspace_name}"
          self
        end
        
        def new_owner owner_name
          @builder.append "/newOwner:#{owner_name}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
      class Workspaces
        def initialize command=nil
          @builder = CommandBuilder.new command
          @builder.append 'workspaces'
          self
        end
        
        def owner owner_name
          @builder.append "/owner:#{owner_name}"
          self
        end
        
        def computer computer_name
          @builder.append "/computer:#{computer_name}"
          self
        end
        
        def collection team_project_collection_url
          @builder.append "/collection:#{team_project_collection_url}"
          self
        end
        
        def format format
          @builder.append "/format:#{format}"
          self
        end
        
        def update_user_name old_user_name
          @builder.append "/updateUserName:#{old_user_name}"
          self
        end
        
        def update_computer_name old_computer_name
          @builder.append "/updateComputerName:#{old_computer_name}"
          self
        end
        
        def workspace_name workspace_name
          @builder.append "#{workspace_name}"
          self
        end
        
        def login credentials
          @builder.append "/login:#{credentials}"
          self
        end
        
        def remove workspace_name
          @builder.append "/remove:#{workspace_name}"
          self
        end
        
        def to_s
          @builder.to_s
        end
        
      end
      
    end
    
  end
  
  def tf2010
    Tf::V2010::Tf.new
  end
  
end

