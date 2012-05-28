# Note: Tests do not represent valid command line usage.

require 'test/unit'
require_relative '../../lib/fluent_command_builder'
include FluentCommandBuilder

class Bundle11Test < Test::Unit::TestCase

  def test_cache_full_command
    expected = 'bundle cache --no-prune'
    actual = bundle_11.cache.no_prune.to_s
    assert_equal expected, actual
  end

  def test_check_full_command
    expected = 'bundle check --gemfile=gemfile --path=path'
    actual = bundle_11.check.gemfile('gemfile').path('path').to_s
    assert_equal expected, actual
  end

  def test_clean_full_command
    expected = 'bundle clean --force'
    actual = bundle_11.clean.force.to_s
    assert_equal expected, actual
  end

  def test_config_full_command
    expected = 'bundle config name value'
    actual = bundle_11.config('name', 'value').to_s
    assert_equal expected, actual
  end

  def test_config_value_is_optional
    expected = 'bundle config name'
    actual = bundle_11.config('name').to_s
    assert_equal expected, actual
  end

  def test_console_full_command
    expected = 'bundle console group'
    actual = bundle_11.console('group').to_s
    assert_equal expected, actual
  end

  def test_console_group_is_optional
    expected = 'bundle console'
    actual = bundle_11.console.to_s
    assert_equal expected, actual
  end

  def test_exec_full_command
    expected = 'bundle exec command'
    actual = bundle_11.exec('command').to_s
    assert_equal expected, actual
  end

  def test_gem_full_command
    expected = 'bundle gem gem --bin'
    actual = bundle_11.gem('gem').bin.to_s
    assert_equal expected, actual
  end

  def test_init_full_command
    expected = 'bundle init --gemspec=file'
    actual = bundle_11.init.gemspec('file').to_s
    assert_equal expected, actual
  end

  def test_install_full_command
    expected = 'bundle install --binstubs=path --clean --deployment --frozen --full-index --gemfile=file --local --no-cache --no-prune --path=path --quiet --shebang=string --standalone=array --system --without=group'
    actual = bundle_11.install.binstubs('path').clean.deployment.frozen.full_index.gemfile('file').local.no_cache.no_prune.path('path').quiet.shebang('string').standalone('array').system.without('group').to_s
    assert_equal expected, actual
  end

  def test_open_full_command
    expected = 'bundle open gem'
    actual = bundle_11.open('gem').to_s
    assert_equal expected, actual
  end

  def test_outdated_full_command
    expected = 'bundle outdated gem --local --pre --source'
    actual = bundle_11.outdated('gem').local.pre.source.to_s
    assert_equal expected, actual
  end

  def test_outdated_gem_is_optional
    expected = 'bundle outdated'
    actual = bundle_11.outdated.to_s
    assert_equal expected, actual
  end

  def test_package_full_command
    expected = 'bundle package --no-prune'
    actual = bundle_11.package.no_prune.to_s
    assert_equal expected, actual
  end

  def test_show_full_command
    expected = 'bundle show gem --paths'
    actual = bundle_11.show('gem').paths.to_s
    assert_equal expected, actual
  end

  def test_update_full_command
    expected = 'bundle update gem --local --source=source'
    actual = bundle_11.update('gem').local.source('source').to_s
    assert_equal expected, actual
  end

  def test_update_gem_is_optional
    expected = 'bundle update'
    actual = bundle_11.update.to_s
    assert_equal expected, actual
  end

  def test_version
    expected = 'bundle version'
    actual = bundle_11.version.to_s
    assert_equal expected, actual
  end

  def test_viz_full_command
    expected = 'bundle viz --file=file --format=format --requirements --version'
    actual = bundle_11.viz.file('file').format('format').requirements.version.to_s
    assert_equal expected, actual
  end

end
