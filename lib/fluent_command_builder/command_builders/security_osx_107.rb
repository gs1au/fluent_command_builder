# Generated code. Do not modify.

require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../printer')
require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')

module FluentCommandBuilder
  def security_osx_107
    FluentCommandBuilder::SecurityOSX::V107.create { |b| yield b if block_given? }
  end
  module SecurityOSX
    module V107
      VERSION = '10.7'
      def self.default_path
        @default_path ||= nil
      end
      def self.default_path=(value)
        printer = FluentCommandBuilder::Printer.new
        begin
          printer.print_warning %Q[Default Path for command "#{FluentCommandBuilder::SecurityOSX::COMMAND_NAME} #{VERSION}" does not exist. Path: #{value}] unless File.exist? value
        rescue
          printer.print_warning %Q[Failed to determine whether Default Path for command "#{FluentCommandBuilder::SecurityOSX::COMMAND_NAME} #{VERSION}" exists. An internal error occurred.]
        end
        @default_path = value
      end
      def self.create
        b = UnderlyingBuilder.new FluentCommandBuilder::SecurityOSX::COMMAND_NAME
        b.path = self.default_path
        c = SecurityOSX.new(b)
        yield b if block_given?
        c
      end
      def security_osx
        FluentCommandBuilder::SecurityOSX::V107.create { |b| yield b if block_given? }
      end
      class SecurityOSX < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
        end
        def delete_certificate
          DeleteCertificate.new @b
        end
        def find_certificate
          FindCertificate.new @b
        end
        def import(input_file)
          Import.new @b, input_file
        end
        def unlock_keychain
          UnlockKeychain.new @b
        end
      end
      class DeleteCertificate < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' delete-certificate'
        end
        def common_name(name)
          @b.append " -c #{@b.format name}"
          yield @b if block_given?
          self
        end
        def hash(hash)
          @b.append " -Z #{@b.format hash}"
          yield @b if block_given?
          self
        end
        def delete_user_trust_settings
          @b.append ' -t'
          yield @b if block_given?
          self
        end
        def keychain(keychain)
          @b.append " #{@b.format keychain}"
          yield @b if block_given?
          self
        end
      end
      class FindCertificate < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' find-certificate'
        end
        def all
          @b.append ' -a'
          yield @b if block_given?
          self
        end
        def name(name)
          @b.append " -c #{@b.format name}"
          yield @b if block_given?
          self
        end
        def email_address(email_address)
          @b.append " -e #{@b.format email_address}"
          yield @b if block_given?
          self
        end
        def show_email_addresses
          @b.append ' -m'
          yield @b if block_given?
          self
        end
        def output_pem_format
          @b.append ' -p'
          yield @b if block_given?
          self
        end
        def print_sha1_hash
          @b.append ' -Z'
          yield @b if block_given?
          self
        end
        def keychain(keychain)
          @b.append " #{@b.format keychain}"
          yield @b if block_given?
          self
        end
      end
      class Import < CommandBase
        def initialize(underlying_builder, input_file)
          super underlying_builder
          @b.append " import #{@b.format input_file}"
        end
        def keychain(keychain)
          @b.append " -k #{@b.format keychain}"
          yield @b if block_given?
          self
        end
        def type(type)
          @b.append " -t #{@b.format type}"
          yield @b if block_given?
          self
        end
        def format(format)
          @b.append " -f #{@b.format format}"
          yield @b if block_given?
          self
        end
        def wrapped
          @b.append ' -w'
          yield @b if block_given?
          self
        end
        def not_extractable
          @b.append ' -x'
          yield @b if block_given?
          self
        end
        def passphrase(passphrase)
          @b.append " -P #{@b.format passphrase}"
          yield @b if block_given?
          self
        end
        def attribute(name, value)
          @b.append " -a #{@b.format name} #{@b.format value}"
          yield @b if block_given?
          self
        end
        def allow_without_warning
          @b.append ' -A'
          yield @b if block_given?
          self
        end
        def allow_application(app_path)
          @b.append " -T #{@b.format app_path}"
          yield @b if block_given?
          self
        end
      end
      class UnlockKeychain < CommandBase
        def initialize(underlying_builder)
          super underlying_builder
          @b.append ' unlock-keychain'
        end
        def no_password
          @b.append ' -u'
          yield @b if block_given?
          self
        end
        def password(password)
          @b.append " -p #{@b.format_password password}"
          yield @b if block_given?
          self
        end
        def keychain(keychain)
          @b.append " #{@b.format keychain}"
          yield @b if block_given?
          self
        end
      end

    end
  end
end