# Note: Tests do not represent valid command line usage.

require_relative '../lib/command_test_base'

class Bundle11Test < CommandTestBase

  def test_cache_full_command
    expected = 'bundle cache --no-prune'
    actual = bundle_11.cache.no_prune
    assert_command expected, actual
  end

  def test_check_full_command
    expected = 'bundle check --gemfile=gemfile --path=path'
    actual = bundle_11.check.gemfile('gemfile').path('path')
    assert_command expected, actual
  end

  def test_clean_full_command
    expected = 'bundle clean --force'
    actual = bundle_11.clean.force
    assert_command expected, actual
  end

  def test_config_full_command
    expected = 'bundle config name value'
    actual = bundle_11.config('name', 'value')
    assert_command expected, actual
  end

  def test_config_value_is_optional
    expected = 'bundle config name'
    actual = bundle_11.config('name')
    assert_command expected, actual
  end

  def test_console_full_command
    expected = 'bundle console group'
    actual = bundle_11.console('group')
    assert_command expected, actual
  end

  def test_console_group_is_optional
    expected = 'bundle console'
    actual = bundle_11.console
    assert_command expected, actual
  end

  def test_exec_full_command
    expected = 'bundle exec command'
    actual = bundle_11.exec('command')
    assert_command expected, actual
  end

  def test_gem_full_command
    expected = 'bundle gem gem --bin'
    actual = bundle_11.gem('gem').bin
    assert_command expected, actual
  end

  def test_init_full_command
    expected = 'bundle init --gemspec=file'
    actual = bundle_11.init.gemspec('file')
    assert_command expected, actual
  end

  def test_install_full_command
    expected = 'bundle install --binstubs=path --clean --deployment --frozen --full-index --gemfile=file --local --no-cache --no-prune --path=path --quiet --shebang=string --standalone=array --system --without=group'
    actual = bundle_11.install.binstubs('path').clean.deployment.frozen.full_index.gemfile('file').local.no_cache.no_prune.path('path').quiet.shebang('string').standalone('array').system.without('group')
    assert_command expected, actual
  end

  def test_open_full_command
    expected = 'bundle open gem'
    actual = bundle_11.open('gem')
    assert_command expected, actual
  end

  def test_outdated_full_command
    expected = 'bundle outdated gem --local --pre --source'
    actual = bundle_11.outdated('gem').local.pre.source
    assert_command expected, actual
  end

  def test_outdated_gem_is_optional
    expected = 'bundle outdated'
    actual = bundle_11.outdated
    assert_command expected, actual
  end

  def test_package_full_command
    expected = 'bundle package --no-prune'
    actual = bundle_11.package.no_prune
    assert_command expected, actual
  end

  def test_show_full_command
    expected = 'bundle show gem --paths'
    actual = bundle_11.show('gem').paths
    assert_command expected, actual
  end

  def test_update_full_command
    expected = 'bundle update gem --local --source=source'
    actual = bundle_11.update('gem').local.source('source')
    assert_command expected, actual
  end

  def test_update_gem_is_optional
    expected = 'bundle update'
    actual = bundle_11.update
    assert_command expected, actual
  end

  def test_version
    expected = 'bundle version'
    actual = bundle_11.version
    assert_command expected, actual
  end

  def test_viz_full_command
    expected = 'bundle viz --file=file --format=format --requirements --version'
    actual = bundle_11.viz.file('file').format('format').requirements.version
    assert_command expected, actual
  end

end
