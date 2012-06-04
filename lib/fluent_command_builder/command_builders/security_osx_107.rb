require File.expand_path(File.dirname(__FILE__) + '/../command_base')
require File.expand_path(File.dirname(__FILE__) + '/../command_builder')

module FluentCommandBuilder
  module Security
    module OSX107
      COMMAND_NAME = 'security'
      class Security < CommandBase
        def initialize(builder)
          super builder
        end
        def delete_certificate(keychain)
          DeleteCertificate.new @builder, keychain
        end
        def import(input_file)
          Import.new @builder, input_file
        end
        def unlock_keychain(keychain)
          UnlockKeychain.new @builder, keychain
        end
      end
      class DeleteCertificate < CommandBase
        def initialize(builder, keychain)
          super builder
          @builder.append " delete-certificate #{@builder.format keychain}"
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
        def initialize(builder, keychain)
          super builder
          @builder.append " unlock-keychain #{@builder.format keychain}"
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
      end
      def security
        builder = CommandBuilder.new COMMAND_NAME
        command = Security.new builder
        yield builder if block_given?
        command
      end
    end
  end
  def security_osx_107
    builder = CommandBuilder.new Security::OSX107::COMMAND_NAME
    command = Security::OSX107::Security.new builder
    yield builder if block_given?
    command
  end
end
