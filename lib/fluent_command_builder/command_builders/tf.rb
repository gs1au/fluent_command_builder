require File.expand_path(File.dirname(__FILE__) + '/../underlying_builder')
require File.expand_path(File.dirname(__FILE__) + '/../util')

module FluentCommandBuilder
  def tf(&block)
    Tf.create &block
  end
  module Tf
    COMMAND_NAME = 'tf'
    def self.create
      b = UnderlyingBuilder.new FluentCommandBuilder::Tf::COMMAND_NAME
      c = version_module(Tf).create b
      yield b if block_given?
      c
    end
  end
end