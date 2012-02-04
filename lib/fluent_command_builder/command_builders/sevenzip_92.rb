require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module SevenZip
    module V92
      class SevenZip
        def initialize builder
          @builder = builder
          @builder.append '7za'
        end
        def add archive, file_ref
          Add.new @builder, archive, file_ref
        end
        def bench number_of_iterations
          Bench.new @builder, number_of_iterations
        end
        def delete archive, files
          Delete.new @builder, archive, files
        end
        def extract archive, files
          Extract.new @builder, archive, files
        end
        def list archive
          List.new @builder, archive
        end
        def test archive, files
          Test.new @builder, archive, files
        end
        def update archive, files
          Update.new @builder, archive, files
        end
        def extract_with_full_paths archive, files=nil
          ExtractWithFullPaths.new @builder, archive, files
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
        def initialize builder, archive, file_ref
          @builder = builder
          @builder.append " a #{@builder.format archive} #{@builder.format file_ref}"
        end
        def include file_ref, recurse_type=nil
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          self
        end
        def set_compression_method method_parameters
          @builder.append " -m#{@builder.format method_parameters}"
          self
        end
        def password password
          @builder.append " -p#{@builder.format password}"
          self
        end
        def recursive modifier=nil
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          self
        end
        def create_sfx_archive sfx_module=nil
          @builder.append ' -sfx'
          @builder.append "#{@builder.format sfx_module}" unless sfx_module.nil?
          self
        end
        def read_data_from_stdin file_name=nil
          @builder.append ' -si'
          @builder.append "#{@builder.format file_name}" unless file_name.nil?
          self
        end
        def write_data_to_stdout 
          @builder.append ' -so'
          self
        end
        def compress_files_open_for_writing 
          @builder.append ' -ssw'
          self
        end
        def type archive_type
          @builder.append " -t#{@builder.format archive_type}"
          self
        end
        def update_options args
          @builder.append " -u#{@builder.format args}"
          self
        end
        def create_volumes size, unit_of_measure=nil
          @builder.append " -v#{@builder.format size}"
          @builder.append "#{@builder.format unit_of_measure}" unless unit_of_measure.nil?
          self
        end
        def working_dir dir_path=nil
          @builder.append ' -w'
          @builder.append "#{@builder.format dir_path}" unless dir_path.nil?
          self
        end
        def exclude file_ref, recurse_type=nil
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
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
      class Bench
        def initialize builder, number_of_iterations
          @builder = builder
          @builder.append " b #{@builder.format number_of_iterations}"
        end
        def mmt n
          @builder.append " -mmt#{@builder.format n}"
          self
        end
        def md n
          @builder.append " -md#{@builder.format n}"
          self
        end
        def mm method
          @builder.append " -mm=#{@builder.format method}"
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
        def initialize builder, archive, files
          @builder = builder
          @builder.append " d #{@builder.format archive} #{@builder.format files}"
        end
        def include file_ref, recurse_type=nil
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          self
        end
        def set_compression_method method_parameters
          @builder.append " -m#{@builder.format method_parameters}"
          self
        end
        def password password
          @builder.append " -p#{@builder.format password}"
          self
        end
        def recursive modifier=nil
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          self
        end
        def update_options args
          @builder.append " -u#{@builder.format args}"
          self
        end
        def working_dir dir_path=nil
          @builder.append ' -w'
          @builder.append "#{@builder.format dir_path}" unless dir_path.nil?
          self
        end
        def exclude file_ref, recurse_type=nil
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
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
      class Extract
        def initialize builder, archive, files
          @builder = builder
          @builder.append " e #{@builder.format archive} #{@builder.format files}"
        end
        def ai 
          @builder.append ' -ai'
          self
        end
        def an 
          @builder.append ' -an'
          self
        end
        def ao 
          @builder.append ' -ao'
          self
        end
        def ax 
          @builder.append ' -ax'
          self
        end
        def include file_ref, recurse_type=nil
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          self
        end
        def output dir_path
          @builder.append " -o#{@builder.format dir_path}"
          self
        end
        def password password
          @builder.append " -p#{@builder.format password}"
          self
        end
        def recursive modifier=nil
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          self
        end
        def write_data_to_stdout 
          @builder.append ' -so'
          self
        end
        def type archive_type
          @builder.append " -t#{@builder.format archive_type}"
          self
        end
        def exclude file_ref, recurse_type=nil
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          self
        end
        def y 
          @builder.append ' -y'
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
      class List
        def initialize builder, archive
          @builder = builder
          @builder.append " l #{@builder.format archive}"
        end
        def ai 
          @builder.append ' -ai'
          self
        end
        def an 
          @builder.append ' -an'
          self
        end
        def ax 
          @builder.append ' -ax'
          self
        end
        def include file_ref, recurse_type=nil
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          self
        end
        def slt 
          @builder.append ' -slt'
          self
        end
        def password password
          @builder.append " -p#{@builder.format password}"
          self
        end
        def recursive modifier=nil
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          self
        end
        def type archive_type
          @builder.append " -t#{@builder.format archive_type}"
          self
        end
        def exclude file_ref, recurse_type=nil
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
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
      class Test
        def initialize builder, archive, files
          @builder = builder
          @builder.append " t #{@builder.format archive} #{@builder.format files}"
        end
        def ai 
          @builder.append ' -ai'
          self
        end
        def an 
          @builder.append ' -an'
          self
        end
        def ax 
          @builder.append ' -ax'
          self
        end
        def include file_ref, recurse_type=nil
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          self
        end
        def password password
          @builder.append " -p#{@builder.format password}"
          self
        end
        def recursive modifier=nil
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          self
        end
        def exclude file_ref, recurse_type=nil
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
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
      class Update
        def initialize builder, archive, files
          @builder = builder
          @builder.append " u #{@builder.format archive} #{@builder.format files}"
        end
        def include file_ref, recurse_type=nil
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          self
        end
        def set_compression_method method_parameters
          @builder.append " -m#{@builder.format method_parameters}"
          self
        end
        def password password
          @builder.append " -p#{@builder.format password}"
          self
        end
        def recursive modifier=nil
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          self
        end
        def create_sfx_archive sfx_module=nil
          @builder.append ' -sfx'
          @builder.append "#{@builder.format sfx_module}" unless sfx_module.nil?
          self
        end
        def read_data_from_stdin file_name=nil
          @builder.append ' -si'
          @builder.append "#{@builder.format file_name}" unless file_name.nil?
          self
        end
        def write_data_to_stdout 
          @builder.append ' -so'
          self
        end
        def compress_files_open_for_writing 
          @builder.append ' -ssw'
          self
        end
        def type archive_type
          @builder.append " -t#{@builder.format archive_type}"
          self
        end
        def update_options args
          @builder.append " -u#{@builder.format args}"
          self
        end
        def working_dir dir_path=nil
          @builder.append ' -w'
          @builder.append "#{@builder.format dir_path}" unless dir_path.nil?
          self
        end
        def exclude file_ref, recurse_type=nil
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
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
      class ExtractWithFullPaths
        def initialize builder, archive, files=nil
          @builder = builder
          @builder.append " x #{@builder.format archive}"
          @builder.append " #{@builder.format files}" unless files.nil?
        end
        def ai 
          @builder.append ' -ai'
          self
        end
        def an 
          @builder.append ' -an'
          self
        end
        def ao 
          @builder.append ' -ao'
          self
        end
        def ax 
          @builder.append ' -ax'
          self
        end
        def include file_ref, recurse_type=nil
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          self
        end
        def output dir_path
          @builder.append " -o#{@builder.format dir_path}"
          self
        end
        def password password
          @builder.append " -p#{@builder.format password}"
          self
        end
        def recursive modifier=nil
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          self
        end
        def write_data_to_stdout 
          @builder.append ' -so'
          self
        end
        def type archive_type
          @builder.append " -t#{@builder.format archive_type}"
          self
        end
        def exclude file_ref, recurse_type=nil
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          self
        end
        def y 
          @builder.append ' -y'
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
      def sevenzip 
        SevenZip.new CommandBuilder.new
      end
    end
  end
  def sevenzip_92 
    SevenZip::V92::SevenZip.new CommandBuilder.new
  end
end
