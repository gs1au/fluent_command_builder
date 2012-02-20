require 'test/unit'
require_relative 'test_helper'
require_relative '../ruby_naming_convention'
include CodeGenerator

class TestRubyNamingConvention < Test::Unit::TestCase

  def test_should_return_valid_module_name
    naming_convention = RubyNamingConvention.new
    assert_equal 'ModuleName', naming_convention.module_name('ModuleName')
    assert_equal 'ModuleName', naming_convention.module_name('moduleName')
    assert_equal 'Modulename', naming_convention.module_name('modulename')
    assert_equal 'ModuleName', naming_convention.module_name('module_name')
  end

  def test_should_return_valid_class_name
    naming_convention = RubyNamingConvention.new
    assert_equal 'ClassName', naming_convention.module_name('ClassName')
    assert_equal 'ClassName', naming_convention.module_name('className')
    assert_equal 'Classname', naming_convention.module_name('classname')
    assert_equal 'ClassName', naming_convention.module_name('class_name')
  end

  def test_should_return_valid_method_name
    naming_convention = RubyNamingConvention.new
    assert_equal 'method_name', naming_convention.method_name('MethodName')
    assert_equal 'method_name', naming_convention.method_name('methodName')
    assert_equal 'methodname', naming_convention.method_name('methodname')
    assert_equal 'method_name', naming_convention.method_name('method_name')
  end

  def test_should_return_valid_arg_name
    naming_convention = RubyNamingConvention.new
    assert_equal 'arg_name', naming_convention.method_name('ArgName')
    assert_equal 'arg_name', naming_convention.method_name('argName')
    assert_equal 'argname', naming_convention.method_name('argname')
    assert_equal 'arg_name', naming_convention.method_name('arg_name')
  end


end