require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Security
    COMMAND_NAME = 'security' unless const_defined? :COMMAND_NAME
    module OSX107
      class Security < CommandBase
        def initialize(builder)
          super builder
        end
        def delete_certificate
          DeleteCertificate.new @builder
        end
        def find_certificate
          FindCertificate.new @builder
        end
        def import(input_file)
          Import.new @builder, input_file
        end
        def unlock_keychain
          UnlockKeychain.new @builder
        end
      end
      class DeleteCertificate < CommandBase
        def initialize(builder)
          super builder
          @builder.append ' delete-certificate'
        end
        def common_name(name)
          @builder.append " -c #{@builder.format name}"
          yield @builder if block_given?
          self
        end
        def hash(hash)
          @builder.append " -Z #{@builder.format hash}"
          yield @builder if block_given?
          self
        end
        def delete_user_trust_settings
          @builder.append ' -t'
          yield @builder if block_given?
          self
        end
        def keychain(keychain)
          @builder.append " #{@builder.format keychain}"
          yield @builder if block_given?
          self
        end
      end
      class FindCertificate < CommandBase
        def initialize(builder)
          super builder
          @builder.append ' find-certificate'
        end
        def all
          @builder.append ' -a'
          yield @builder if block_given?
          self
        end
        def name(name)
          @builder.append " -c #{@builder.format name}"
          yield @builder if block_given?
          self
        end
        def email_address(email_address)
          @builder.append " -e #{@builder.format email_address}"
          yield @builder if block_given?
          self
        end
        def show_email_addresses
          @builder.append ' -m'
          yield @builder if block_given?
          self
        end
        def output_pem_format
          @builder.append ' -p'
          yield @builder if block_given?
          self
        end
        def print_sha1_hash
          @builder.append ' -Z'
          yield @builder if block_given?
          self
        end
        def keychain(keychain)
          @builder.append " #{@builder.format keychain}"
          yield @builder if block_given?
          self
        end
      end
      class Import < CommandBase
        def initialize(builder, input_file)
          super builder
          @builder.append " import #{@builder.format input_file}"
        end
        def keychain(keychain)
          @builder.append " -k #{@builder.format keychain}"
          yield @builder if block_given?
          self
        end
        def type(type)
          @builder.append " -t #{@builder.format type}"
          yield @builder if block_given?
          self
        end
        def format(format)
          @builder.append " -f #{@builder.format format}"
          yield @builder if block_given?
          self
        end
        def wrapped
          @builder.append ' -w'
          yield @builder if block_given?
          self
        end
        def not_extractable
          @builder.append ' -x'
          yield @builder if block_given?
          self
        end
        def passphrase(passphrase)
          @builder.append " -P #{@builder.format passphrase}"
          yield @builder if block_given?
          self
        end
        def attribute(name, value)
          @builder.append " -a #{@builder.format name} #{@builder.format value}"
          yield @builder if block_given?
          self
        end
        def allow_without_warning
          @builder.append ' -A'
          yield @builder if block_given?
          self
        end
        def allow_application(app_path)
          @builder.append " -T #{@builder.format app_path}"
          yield @builder if block_given?
          self
        end
      end
      class UnlockKeychain < CommandBase
        def initialize(builder)
          super builder
          @builder.append ' unlock-keychain'
        end
        def no_password
          @builder.append ' -u'
          yield @builder if block_given?
          self
        end
        def password(password)
          @builder.append " -p #{@builder.format password}"
          yield @builder if block_given?
          self
        end
        def keychain(keychain)
          @builder.append " #{@builder.format keychain}"
          yield @builder if block_given?
          self
        end
      end
      def security
        builder = CommandBuilder.new FluentCommandBuilder::Security::COMMAND_NAME
        command = Security.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def security_osx_107
    builder = CommandBuilder.new FluentCommandBuilder::Security::COMMAND_NAME
    command = Security::OSX107::Security.new builder
    yield builder if block_given?
    command
  end
end
