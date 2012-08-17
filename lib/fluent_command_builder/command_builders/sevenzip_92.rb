require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def sevenzip_92
    FluentCommandBuilder::SevenZip::V92.create { |b| yield b if block_given? }
  end
  module SevenZip
    module V92
      VERSION = '9.2'
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::SevenZip::COMMAND_NAME
        c = SevenZip.new(b)
        yield b if block_given?
        c
      end
      def sevenzip
        FluentCommandBuilder::SevenZip::V92.create { |b| yield b if block_given? }
      end
      class SevenZip < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def add(archive, file_ref)
          Add.new @b, archive, file_ref
        end
        def bench(number_of_iterations)
          Bench.new @b, number_of_iterations
        end
        def delete(archive, files)
          Delete.new @b, archive, files
        end
        def extract(archive, files)
          Extract.new @b, archive, files
        end
        def list(archive)
          List.new @b, archive
        end
        def test(archive, files)
          Test.new @b, archive, files
        end
        def update(archive, files)
          Update.new @b, archive, files
        end
        def extract_with_full_paths(archive, files=nil)
          ExtractWithFullPaths.new @b, archive, files
        end
      end
      class Add < CommandBase
        def initialize(underlying_builder, archive, file_ref)
          super underlying_builder
          @b.append " a #{@b.format archive} #{@b.format file_ref}"
        end
        def include(file_ref, recurse_type=nil)
          @b.append ' -i'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
        def set_compression_method(method_parameters)
          @b.append " -m#{@b.format method_parameters}"
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -p#{@b.format password}"
          yield @b if block_given?
          self
        end
        def recursive(modifier=nil)
          @b.append ' -r'
          @b.append "#{@b.format modifier}" unless modifier.nil?
          yield @b if block_given?
          self
        end
        def create_sfx_archive(sfx_module=nil)
          @b.append ' -sfx'
          @b.append "#{@b.format sfx_module}" unless sfx_module.nil?
          yield @b if block_given?
          self
        end
        def read_data_from_stdin(file_name=nil)
          @b.append ' -si'
          @b.append "#{@b.format file_name}" unless file_name.nil?
          yield @b if block_given?
          self
        end
        def write_data_to_stdout
          @b.append ' -so'
          yield @b if block_given?
          self
        end
        def compress_files_open_for_writing
          @b.append ' -ssw'
          yield @b if block_given?
          self
        end
        def type(archive_type)
          @b.append " -t#{@b.format archive_type}"
          yield @b if block_given?
          self
        end
        def update_options(args)
          @b.append " -u#{@b.format args}"
          yield @b if block_given?
          self
        end
        def create_volumes(size, unit_of_measure=nil)
          @b.append " -v#{@b.format size}"
          @b.append "#{@b.format unit_of_measure}" unless unit_of_measure.nil?
          yield @b if block_given?
          self
        end
        def working_dir(dir_path=nil)
          @b.append ' -w'
          @b.append "#{@b.format dir_path}" unless dir_path.nil?
          yield @b if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @b.append ' -x'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
      end
      class Bench < CommandBase
        def initialize(underlying_builder, number_of_iterations)
          super underlying_builder
          @b.append " b #{@b.format number_of_iterations}"
        end
        def mmt(n)
          @b.append " -mmt#{@b.format n}"
          yield @b if block_given?
          self
        end
        def md(n)
          @b.append " -md#{@b.format n}"
          yield @b if block_given?
          self
        end
        def mm(method)
          @b.append " -mm=#{@b.format method}"
          yield @b if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(underlying_builder, archive, files)
          super underlying_builder
          @b.append " d #{@b.format archive} #{@b.format files}"
        end
        def include(file_ref, recurse_type=nil)
          @b.append ' -i'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
        def set_compression_method(method_parameters)
          @b.append " -m#{@b.format method_parameters}"
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -p#{@b.format password}"
          yield @b if block_given?
          self
        end
        def recursive(modifier=nil)
          @b.append ' -r'
          @b.append "#{@b.format modifier}" unless modifier.nil?
          yield @b if block_given?
          self
        end
        def update_options(args)
          @b.append " -u#{@b.format args}"
          yield @b if block_given?
          self
        end
        def working_dir(dir_path=nil)
          @b.append ' -w'
          @b.append "#{@b.format dir_path}" unless dir_path.nil?
          yield @b if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @b.append ' -x'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
      end
      class Extract < CommandBase
        def initialize(underlying_builder, archive, files)
          super underlying_builder
          @b.append " e #{@b.format archive} #{@b.format files}"
        end
        def ai
          @b.append ' -ai'
          yield @b if block_given?
          self
        end
        def an
          @b.append ' -an'
          yield @b if block_given?
          self
        end
        def ao
          @b.append ' -ao'
          yield @b if block_given?
          self
        end
        def ax
          @b.append ' -ax'
          yield @b if block_given?
          self
        end
        def include(file_ref, recurse_type=nil)
          @b.append ' -i'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
        def output(dir_path)
          @b.append " -o#{@b.format dir_path}"
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -p#{@b.format password}"
          yield @b if block_given?
          self
        end
        def recursive(modifier=nil)
          @b.append ' -r'
          @b.append "#{@b.format modifier}" unless modifier.nil?
          yield @b if block_given?
          self
        end
        def write_data_to_stdout
          @b.append ' -so'
          yield @b if block_given?
          self
        end
        def type(archive_type)
          @b.append " -t#{@b.format archive_type}"
          yield @b if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @b.append ' -x'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
        def y
          @b.append ' -y'
          yield @b if block_given?
          self
        end
      end
      class List < CommandBase
        def initialize(underlying_builder, archive)
          super underlying_builder
          @b.append " l #{@b.format archive}"
        end
        def ai
          @b.append ' -ai'
          yield @b if block_given?
          self
        end
        def an
          @b.append ' -an'
          yield @b if block_given?
          self
        end
        def ax
          @b.append ' -ax'
          yield @b if block_given?
          self
        end
        def include(file_ref, recurse_type=nil)
          @b.append ' -i'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
        def slt
          @b.append ' -slt'
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -p#{@b.format password}"
          yield @b if block_given?
          self
        end
        def recursive(modifier=nil)
          @b.append ' -r'
          @b.append "#{@b.format modifier}" unless modifier.nil?
          yield @b if block_given?
          self
        end
        def type(archive_type)
          @b.append " -t#{@b.format archive_type}"
          yield @b if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @b.append ' -x'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
      end
      class Test < CommandBase
        def initialize(underlying_builder, archive, files)
          super underlying_builder
          @b.append " t #{@b.format archive} #{@b.format files}"
        end
        def ai
          @b.append ' -ai'
          yield @b if block_given?
          self
        end
        def an
          @b.append ' -an'
          yield @b if block_given?
          self
        end
        def ax
          @b.append ' -ax'
          yield @b if block_given?
          self
        end
        def include(file_ref, recurse_type=nil)
          @b.append ' -i'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -p#{@b.format password}"
          yield @b if block_given?
          self
        end
        def recursive(modifier=nil)
          @b.append ' -r'
          @b.append "#{@b.format modifier}" unless modifier.nil?
          yield @b if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @b.append ' -x'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
      end
      class Update < CommandBase
        def initialize(underlying_builder, archive, files)
          super underlying_builder
          @b.append " u #{@b.format archive} #{@b.format files}"
        end
        def include(file_ref, recurse_type=nil)
          @b.append ' -i'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
        def set_compression_method(method_parameters)
          @b.append " -m#{@b.format method_parameters}"
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -p#{@b.format password}"
          yield @b if block_given?
          self
        end
        def recursive(modifier=nil)
          @b.append ' -r'
          @b.append "#{@b.format modifier}" unless modifier.nil?
          yield @b if block_given?
          self
        end
        def create_sfx_archive(sfx_module=nil)
          @b.append ' -sfx'
          @b.append "#{@b.format sfx_module}" unless sfx_module.nil?
          yield @b if block_given?
          self
        end
        def read_data_from_stdin(file_name=nil)
          @b.append ' -si'
          @b.append "#{@b.format file_name}" unless file_name.nil?
          yield @b if block_given?
          self
        end
        def write_data_to_stdout
          @b.append ' -so'
          yield @b if block_given?
          self
        end
        def compress_files_open_for_writing
          @b.append ' -ssw'
          yield @b if block_given?
          self
        end
        def type(archive_type)
          @b.append " -t#{@b.format archive_type}"
          yield @b if block_given?
          self
        end
        def update_options(args)
          @b.append " -u#{@b.format args}"
          yield @b if block_given?
          self
        end
        def working_dir(dir_path=nil)
          @b.append ' -w'
          @b.append "#{@b.format dir_path}" unless dir_path.nil?
          yield @b if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @b.append ' -x'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
      end
      class ExtractWithFullPaths < CommandBase
        def initialize(underlying_builder, archive, files=nil)
          super underlying_builder
          @b.append " x #{@b.format archive}"
          @b.append " #{@b.format files}" unless files.nil?
        end
        def ai
          @b.append ' -ai'
          yield @b if block_given?
          self
        end
        def an
          @b.append ' -an'
          yield @b if block_given?
          self
        end
        def ao
          @b.append ' -ao'
          yield @b if block_given?
          self
        end
        def ax
          @b.append ' -ax'
          yield @b if block_given?
          self
        end
        def include(file_ref, recurse_type=nil)
          @b.append ' -i'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
        def output(dir_path)
          @b.append " -o#{@b.format dir_path}"
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -p#{@b.format password}"
          yield @b if block_given?
          self
        end
        def recursive(modifier=nil)
          @b.append ' -r'
          @b.append "#{@b.format modifier}" unless modifier.nil?
          yield @b if block_given?
          self
        end
        def write_data_to_stdout
          @b.append ' -so'
          yield @b if block_given?
          self
        end
        def type(archive_type)
          @b.append " -t#{@b.format archive_type}"
          yield @b if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @b.append ' -x'
          @b.append "#{@b.format recurse_type}" unless recurse_type.nil?
          @b.append "#{@b.format file_ref}"
          yield @b if block_given?
          self
        end
        def y
          @b.append ' -y'
          yield @b if block_given?
          self
        end
      end

    end
  end
end