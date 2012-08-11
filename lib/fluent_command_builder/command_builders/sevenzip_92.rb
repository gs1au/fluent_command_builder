require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def sevenzip_92
    b = UnderlyingBuilder.new
    c = FluentCommandBuilder::SevenZip::V92.create b
    yield b if block_given?
    c
  end
  module SevenZip
    module V92
      def self.create(underlying_builder)
        SevenZip.new underlying_builder
      end
      def sevenzip
        b = UnderlyingBuilder.new
        c = FluentCommandBuilder::SevenZip::V92.create b
        yield b if block_given?
        c
      end
      class SevenZip < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @builder.command_name = '7za'
        end
        def add(archive, file_ref)
          Add.new @builder, archive, file_ref
        end
        def bench(number_of_iterations)
          Bench.new @builder, number_of_iterations
        end
        def delete(archive, files)
          Delete.new @builder, archive, files
        end
        def extract(archive, files)
          Extract.new @builder, archive, files
        end
        def list(archive)
          List.new @builder, archive
        end
        def test(archive, files)
          Test.new @builder, archive, files
        end
        def update(archive, files)
          Update.new @builder, archive, files
        end
        def extract_with_full_paths(archive, files=nil)
          ExtractWithFullPaths.new @builder, archive, files
        end
      end
      class Add < CommandBase
        def initialize(underlying_builder, archive, file_ref)
          super underlying_builder
          @builder.command_name = '7za'
          @builder.append " a #{@builder.format archive} #{@builder.format file_ref}"
        end
        def include(file_ref, recurse_type=nil)
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
        def set_compression_method(method_parameters)
          @builder.append " -m#{@builder.format method_parameters}"
          yield @builder if block_given?
          self
        end
        def password(password)
          @builder.append " -p#{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def recursive(modifier=nil)
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          yield @builder if block_given?
          self
        end
        def create_sfx_archive(sfx_module=nil)
          @builder.append ' -sfx'
          @builder.append "#{@builder.format sfx_module}" unless sfx_module.nil?
          yield @builder if block_given?
          self
        end
        def read_data_from_stdin(file_name=nil)
          @builder.append ' -si'
          @builder.append "#{@builder.format file_name}" unless file_name.nil?
          yield @builder if block_given?
          self
        end
        def write_data_to_stdout
          @builder.append ' -so'
          yield @builder if block_given?
          self
        end
        def compress_files_open_for_writing
          @builder.append ' -ssw'
          yield @builder if block_given?
          self
        end
        def type(archive_type)
          @builder.append " -t#{@builder.format archive_type}"
          yield @builder if block_given?
          self
        end
        def update_options(args)
          @builder.append " -u#{@builder.format args}"
          yield @builder if block_given?
          self
        end
        def create_volumes(size, unit_of_measure=nil)
          @builder.append " -v#{@builder.format size}"
          @builder.append "#{@builder.format unit_of_measure}" unless unit_of_measure.nil?
          yield @builder if block_given?
          self
        end
        def working_dir(dir_path=nil)
          @builder.append ' -w'
          @builder.append "#{@builder.format dir_path}" unless dir_path.nil?
          yield @builder if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
      end
      class Bench < CommandBase
        def initialize(underlying_builder, number_of_iterations)
          super underlying_builder
          @builder.command_name = '7za'
          @builder.append " b #{@builder.format number_of_iterations}"
        end
        def mmt(n)
          @builder.append " -mmt#{@builder.format n}"
          yield @builder if block_given?
          self
        end
        def md(n)
          @builder.append " -md#{@builder.format n}"
          yield @builder if block_given?
          self
        end
        def mm(method)
          @builder.append " -mm=#{@builder.format method}"
          yield @builder if block_given?
          self
        end
      end
      class Delete < CommandBase
        def initialize(underlying_builder, archive, files)
          super underlying_builder
          @builder.command_name = '7za'
          @builder.append " d #{@builder.format archive} #{@builder.format files}"
        end
        def include(file_ref, recurse_type=nil)
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
        def set_compression_method(method_parameters)
          @builder.append " -m#{@builder.format method_parameters}"
          yield @builder if block_given?
          self
        end
        def password(password)
          @builder.append " -p#{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def recursive(modifier=nil)
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          yield @builder if block_given?
          self
        end
        def update_options(args)
          @builder.append " -u#{@builder.format args}"
          yield @builder if block_given?
          self
        end
        def working_dir(dir_path=nil)
          @builder.append ' -w'
          @builder.append "#{@builder.format dir_path}" unless dir_path.nil?
          yield @builder if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
      end
      class Extract < CommandBase
        def initialize(underlying_builder, archive, files)
          super underlying_builder
          @builder.command_name = '7za'
          @builder.append " e #{@builder.format archive} #{@builder.format files}"
        end
        def ai
          @builder.append ' -ai'
          yield @builder if block_given?
          self
        end
        def an
          @builder.append ' -an'
          yield @builder if block_given?
          self
        end
        def ao
          @builder.append ' -ao'
          yield @builder if block_given?
          self
        end
        def ax
          @builder.append ' -ax'
          yield @builder if block_given?
          self
        end
        def include(file_ref, recurse_type=nil)
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
        def output(dir_path)
          @builder.append " -o#{@builder.format dir_path}"
          yield @builder if block_given?
          self
        end
        def password(password)
          @builder.append " -p#{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def recursive(modifier=nil)
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          yield @builder if block_given?
          self
        end
        def write_data_to_stdout
          @builder.append ' -so'
          yield @builder if block_given?
          self
        end
        def type(archive_type)
          @builder.append " -t#{@builder.format archive_type}"
          yield @builder if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
        def y
          @builder.append ' -y'
          yield @builder if block_given?
          self
        end
      end
      class List < CommandBase
        def initialize(underlying_builder, archive)
          super underlying_builder
          @builder.command_name = '7za'
          @builder.append " l #{@builder.format archive}"
        end
        def ai
          @builder.append ' -ai'
          yield @builder if block_given?
          self
        end
        def an
          @builder.append ' -an'
          yield @builder if block_given?
          self
        end
        def ax
          @builder.append ' -ax'
          yield @builder if block_given?
          self
        end
        def include(file_ref, recurse_type=nil)
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
        def slt
          @builder.append ' -slt'
          yield @builder if block_given?
          self
        end
        def password(password)
          @builder.append " -p#{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def recursive(modifier=nil)
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          yield @builder if block_given?
          self
        end
        def type(archive_type)
          @builder.append " -t#{@builder.format archive_type}"
          yield @builder if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
      end
      class Test < CommandBase
        def initialize(underlying_builder, archive, files)
          super underlying_builder
          @builder.command_name = '7za'
          @builder.append " t #{@builder.format archive} #{@builder.format files}"
        end
        def ai
          @builder.append ' -ai'
          yield @builder if block_given?
          self
        end
        def an
          @builder.append ' -an'
          yield @builder if block_given?
          self
        end
        def ax
          @builder.append ' -ax'
          yield @builder if block_given?
          self
        end
        def include(file_ref, recurse_type=nil)
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
        def password(password)
          @builder.append " -p#{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def recursive(modifier=nil)
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          yield @builder if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
      end
      class Update < CommandBase
        def initialize(underlying_builder, archive, files)
          super underlying_builder
          @builder.command_name = '7za'
          @builder.append " u #{@builder.format archive} #{@builder.format files}"
        end
        def include(file_ref, recurse_type=nil)
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
        def set_compression_method(method_parameters)
          @builder.append " -m#{@builder.format method_parameters}"
          yield @builder if block_given?
          self
        end
        def password(password)
          @builder.append " -p#{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def recursive(modifier=nil)
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          yield @builder if block_given?
          self
        end
        def create_sfx_archive(sfx_module=nil)
          @builder.append ' -sfx'
          @builder.append "#{@builder.format sfx_module}" unless sfx_module.nil?
          yield @builder if block_given?
          self
        end
        def read_data_from_stdin(file_name=nil)
          @builder.append ' -si'
          @builder.append "#{@builder.format file_name}" unless file_name.nil?
          yield @builder if block_given?
          self
        end
        def write_data_to_stdout
          @builder.append ' -so'
          yield @builder if block_given?
          self
        end
        def compress_files_open_for_writing
          @builder.append ' -ssw'
          yield @builder if block_given?
          self
        end
        def type(archive_type)
          @builder.append " -t#{@builder.format archive_type}"
          yield @builder if block_given?
          self
        end
        def update_options(args)
          @builder.append " -u#{@builder.format args}"
          yield @builder if block_given?
          self
        end
        def working_dir(dir_path=nil)
          @builder.append ' -w'
          @builder.append "#{@builder.format dir_path}" unless dir_path.nil?
          yield @builder if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
      end
      class ExtractWithFullPaths < CommandBase
        def initialize(underlying_builder, archive, files=nil)
          super underlying_builder
          @builder.command_name = '7za'
          @builder.append " x #{@builder.format archive}"
          @builder.append " #{@builder.format files}" unless files.nil?
        end
        def ai
          @builder.append ' -ai'
          yield @builder if block_given?
          self
        end
        def an
          @builder.append ' -an'
          yield @builder if block_given?
          self
        end
        def ao
          @builder.append ' -ao'
          yield @builder if block_given?
          self
        end
        def ax
          @builder.append ' -ax'
          yield @builder if block_given?
          self
        end
        def include(file_ref, recurse_type=nil)
          @builder.append ' -i'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
        def output(dir_path)
          @builder.append " -o#{@builder.format dir_path}"
          yield @builder if block_given?
          self
        end
        def password(password)
          @builder.append " -p#{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def recursive(modifier=nil)
          @builder.append ' -r'
          @builder.append "#{@builder.format modifier}" unless modifier.nil?
          yield @builder if block_given?
          self
        end
        def write_data_to_stdout
          @builder.append ' -so'
          yield @builder if block_given?
          self
        end
        def type(archive_type)
          @builder.append " -t#{@builder.format archive_type}"
          yield @builder if block_given?
          self
        end
        def exclude(file_ref, recurse_type=nil)
          @builder.append ' -x'
          @builder.append "#{@builder.format recurse_type}" unless recurse_type.nil?
          @builder.append "#{@builder.format file_ref}"
          yield @builder if block_given?
          self
        end
        def y
          @builder.append ' -y'
          yield @builder if block_given?
          self
        end
      end
    end
  end
end
