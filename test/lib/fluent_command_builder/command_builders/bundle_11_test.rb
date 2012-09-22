# Note: Tests do not represent valid command line usage.

require_relative '../../../command_test_base'

class Bundle11Test < CommandTestBase
  include FluentCommandBuilder::Bundle::V11

  def test_cache_full_command
    expected = 'bundle cache --no-prune'
    actual = bundle.cache.no_prune
    assert_command expected, actual
  end

  def test_check_full_command
    expected = 'bundle check --gemfile=gemfile --path=path'
    actual = bundle.check.gemfile('gemfile').path('path')
    assert_command expected, actual
  end

  def test_clean_full_command
    expected = 'bundle clean --force'
    actual = bundle.clean.force
    assert_command expected, actual
  end

  def test_config_full_command
    expected = 'bundle config name value'
    actual = bundle.config('name', 'value')
    assert_command expected, actual
  end

  def test_config_value_is_optional
    expected = 'bundle config name'
    actual = bundle.config('name')
    assert_command expected, actual
  end

  def test_console_full_command
    expected = 'bundle console group'
    actual = bundle.console('group')
    assert_command expected, actual
  end

  def test_console_group_is_optional
    expected = 'bundle console'
    actual = bundle.console
    assert_command expected, actual
  end

  def test_exec_full_command
    expected = 'bundle exec command'
    actual = bundle.exec('command')
    assert_command expected, actual
  end

  def test_gem_full_command
    expected = 'bundle gem gem --bin'
    actual = bundle.gem('gem').bin
    assert_command expected, actual
  end

  def test_init_full_command
    expected = 'bundle init --gemspec=file'
    actual = bundle.init.gemspec('file')
    assert_command expected, actual
  end

  def test_install_full_command
    expected = 'bundle install --binstubs=path --clean --deployment --frozen --full-index --gemfile=file --local --no-cache --no-prune --path=path --quiet --shebang=string --standalone=array --system --without=group'
    actual = bundle.install.binstubs('path').clean.deployment.frozen.full_index.gemfile('file').local.no_cache.no_prune.path('path').quiet.shebang('string').standalone('array').system.without('group')
    assert_command expected, actual
  end

  def test_open_full_command
    expected = 'bundle open gem'
    actual = bundle.open('gem')
    assert_command expected, actual
  end

  def test_outdated_full_command
    expected = 'bundle outdated gem --local --pre --source'
    actual = bundle.outdated('gem').local.pre.source
    assert_command expected, actual
  end

  def test_outdated_gem_is_optional
    expected = 'bundle outdated'
    actual = bundle.outdated
    assert_command expected, actual
  end

  def test_package_full_command
    expected = 'bundle package --no-prune'
    actual = bundle.package.no_prune
    assert_command expected, actual
  end

  def test_show_full_command
    expected = 'bundle show gem --paths'
    actual = bundle.show('gem').paths
    assert_command expected, actual
  end

  def test_update_full_command
    expected = 'bundle update gem --local --source=source'
    actual = bundle.update('gem').local.source('source')
    assert_command expected, actual
  end

  def test_update_gem_is_optional
    expected = 'bundle update'
    actual = bundle.update
    assert_command expected, actual
  end

  def test_version
    expected = 'bundle version'
    actual = bundle.version
    assert_command expected, actual
  end

  def test_viz_full_command
    expected = 'bundle viz --file=file --format=format --requirements --version'
    actual = bundle.viz.file('file').format('format').requirements.version
    assert_command expected, actual
  end

end
