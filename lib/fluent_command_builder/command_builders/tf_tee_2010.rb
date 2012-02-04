require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Tf
    module TEE_2010
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
        def delete 
          Delete.new @builder
        end
        def destroy 
          @builder.append ' destroy'
          self
        end
        def diff 
          Diff.new @builder
        end
        def dir 
          Dir.new @builder
        end
        def eula 
          Eula.new @builder
        end
        def get 
          Get.new @builder
        end
        def getcs 
          Getcs.new @builder
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
        def lock 
          Lock.new @builder
        end
        def merge 
          Merge.new @builder
        end
        def merges 
          Merges.new @builder
        end
        def print 
          Print.new @builder
        end
        def product_key 
          ProductKey.new @builder
        end
        def profile 
          Profile.new @builder
        end
        def profiles 
          Profiles.new @builder
        end
        def properties 
          Properties.new @builder
        end
        def reconcile 
          Reconcile.new @builder
        end
        def rename 
          Rename.new @builder
        end
        def resolve 
          Resolve.new @builder
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
        def initialize builder
          @builder = builder
          @builder.append ' add'
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' branch'
        end
        def old_item old_item
          @builder.append " #{@builder.format old_item}"
          self
        end
        def new_item new_item
          @builder.append " #{@builder.format new_item}"
          self
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' branches'
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' changeset'
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def notes notes
          @builder.append " -notes:#{@builder.format notes}"
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
        def changeset_number changeset_number
          @builder.append " #{@builder.format changeset_number}"
          self
        end
        def latest 
          @builder.append ' -latest'
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' checkin'
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
          @builder.append " -notes:#{@builder.format notes}"
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
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def bypass 
          @builder.append ' -bypass'
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def shelveset shelveset_name
          @builder.append " -shelveset:#{@builder.format shelveset_name}"
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
      class Checkout
        def initialize builder
          @builder = builder
          @builder.append ' checkout'
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
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' delete'
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
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
      class Diff
        def initialize builder
          @builder = builder
          @builder.append ' diff'
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def item_spec2 item_spec2
          @builder.append " #{@builder.format item_spec2}"
          self
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def shelveset shelveset_name
          @builder.append " -shelveset:#{@builder.format shelveset_name}"
          self
        end
        def shelveset_itemspec shelveset_itemspec
          @builder.append " #{@builder.format shelveset_itemspec}"
          self
        end
        def configure 
          @builder.append ' -configure'
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
        def initialize builder
          @builder = builder
          @builder.append ' dir'
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' get'
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' history'
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' label'
        end
        def label_name label_name
          @builder.append " #{@builder.format label_name}"
          self
        end
        def owner owner_name
          @builder.append " -owner:#{@builder.format owner_name}"
          self
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def delete 
          @builder.append ' -delete'
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
        def initialize builder
          @builder = builder
          @builder.append ' labels'
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
        def label_name label_name
          @builder.append " #{@builder.format label_name}"
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' lock'
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def workspace workspace_name
          @builder.append " -workspace:#{@builder.format workspace_name}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' merge'
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def source source
          @builder.append " #{@builder.format source}"
          self
        end
        def destination destination
          @builder.append " #{@builder.format destination}"
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
        def initialize builder
          @builder = builder
          @builder.append ' merges'
        end
        def source source
          @builder.append " #{@builder.format source}"
          self
        end
        def destination destination
          @builder.append " #{@builder.format destination}"
          self
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' print'
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
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
      class Profile
        def initialize builder
          @builder = builder
          @builder.append ' profile'
        end
        def copy existing_profile_name, new_profile_name
          @builder.append " -copy #{@builder.format existing_profile_name} #{@builder.format new_profile_name}"
          self
        end
        def delete profile_name
          @builder.append " -delete #{@builder.format profile_name}"
          self
        end
        def edit existing_profile_name
          @builder.append " -edit #{@builder.format existing_profile_name}"
          self
        end
        def new new_profile_name
          @builder.append " -new #{@builder.format new_profile_name}"
          self
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
        def initialize builder
          @builder = builder
          @builder.append ' properties'
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def version version_spec
          @builder.append " -version:#{@builder.format version_spec}"
          self
        end
        def workspace 
          @builder.append ' -workspace'
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
        def build_name build_name
          @builder.append " -buildName:#{@builder.format build_name}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def changeset changeset_name
          @builder.append " -changeset:#{@builder.format changeset_name}"
          self
        end
        def forget_build build_name
          @builder.append " -forgetBuild:#{@builder.format build_name}"
          self
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
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
        def initialize builder
          @builder = builder
          @builder.append ' rename'
        end
        def lock lock_type
          @builder.append " -lock:#{@builder.format lock_type}"
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def old_item old_item
          @builder.append " #{@builder.format old_item}"
          self
        end
        def new_item new_item
          @builder.append " #{@builder.format new_item}"
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
        def initialize builder
          @builder = builder
          @builder.append ' resolve'
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' shelve'
        end
        def replace 
          @builder.append ' -replace'
          self
        end
        def comment comment
          @builder.append " -comment:#{@builder.format comment}"
          self
        end
        def shelveset_name shelveset_name
          @builder.append " #{@builder.format shelveset_name}"
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def move 
          @builder.append ' -move'
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def delete 
          @builder.append ' -delete'
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
        def initialize builder
          @builder = builder
          @builder.append ' shelvesets'
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def shelveset_name shelveset_name
          @builder.append " #{@builder.format shelveset_name}"
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
        def initialize builder
          @builder = builder
          @builder.append ' status'
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def workspace workspace_name
          @builder.append " -workspace:#{@builder.format workspace_name}"
          self
        end
        def shelveset shelveset_name
          @builder.append " -shelveset:#{@builder.format shelveset_name}"
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
        def initialize builder
          @builder = builder
          @builder.append ' undelete'
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
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' undo'
        end
        def workspace workspace_name
          @builder.append " -workspace:#{@builder.format workspace_name}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
        def initialize builder
          @builder = builder
          @builder.append ' unlabel'
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def label_name label_name
          @builder.append " #{@builder.format label_name}"
          self
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
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
        def initialize builder
          @builder = builder
          @builder.append ' unshelve'
        end
        def move 
          @builder.append ' -move'
          self
        end
        def shelveset_name shelveset_name
          @builder.append " #{@builder.format shelveset_name}"
          self
        end
        def item_spec item_spec
          @builder.append " #{@builder.format item_spec}"
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
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
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
      class Workfold
        def initialize builder
          @builder = builder
          @builder.append ' workfold'
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def workspace workspace_name
          @builder.append " -workspace:#{@builder.format workspace_name}"
          self
        end
        def collection team_project_collection_url
          @builder.append " -collection:#{@builder.format team_project_collection_url}"
          self
        end
        def map 
          @builder.append ' -map'
          self
        end
        def server_folder server_folder
          @builder.append " #{@builder.format server_folder}"
          self
        end
        def local_folder local_folder
          @builder.append " #{@builder.format local_folder}"
          self
        end
        def unmap 
          @builder.append ' -unmap'
          self
        end
        def recursive 
          @builder.append ' -recursive'
          self
        end
        def cloak 
          @builder.append ' -cloak'
          self
        end
        def decloak 
          @builder.append ' -decloak'
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
      class Workspace
        def initialize builder
          @builder = builder
          @builder.append ' workspace'
        end
        def new 
          @builder.append ' -new'
          self
        end
        def no_prompt 
          @builder.append ' -noPrompt'
          self
        end
        def template workspace_name
          @builder.append " -template:#{@builder.format workspace_name}"
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
        def workspace_name workspace_name
          @builder.append " #{@builder.format workspace_name}"
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def delete 
          @builder.append ' -delete'
          self
        end
        def new_name workspace_name
          @builder.append " -newName:#{@builder.format workspace_name}"
          self
        end
        def new_owner owner_name
          @builder.append " -newOwner:#{@builder.format owner_name}"
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
        def initialize builder
          @builder = builder
          @builder.append ' workspaces'
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
        def workspace_name workspace_name
          @builder.append " #{@builder.format workspace_name}"
          self
        end
        def login credentials
          @builder.append " -login:#{@builder.format credentials}"
          self
        end
        def remove workspace_name
          @builder.append " -remove:#{@builder.format workspace_name}"
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
