# Fluent Command Builder

Fluent Command Builder makes building command lines easy and intuitive.

Automated build/test/deploy processes depend heavily on tools that provide a command line interface.
Building command lines requires a lot of string appending and interpolation and often results in code which is not only
hard to read and maintain but results in much unwanted duplication.

Fluent Command Builder hides this complexity behind a fluent interface which dramatically improves readabilty,
maintainability and reduces duplication. The fluent interface also helps reduce barrier to entry when using new
commands since details such as switch symbols, delimiters and casing are taken care of automatically.

## Example

Desired command line:

    MSBuild sample.proj /target:clean;build /property:configuration=release

Fluent Command Builder usage:

```ruby
msbuild('sample.proj').target([:clean, :build]).property(configuration: 'release')
```

## Intellisense

Extremely effective with [RubyMine](http://www.jetbrains.com/ruby/) intellisense.

![RubyMine intellisense for MSBuild](https://github.com/mattriley/fluent_command_builder/raw/master/images/msbuild_intellisense.png)

## Installation

    gem install fluent_command_builder

## Usage

### Versions

Fluent Command Builder supports multiple versions of each command and offers two main usage scenarios.

The first scenario involves including the modules for a specific version of each command:

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder::MSBuild::V40
include FluentCommandBuilder::NUnit::V25

msbuild('sample.proj').target(:rebuild).property(configuration: 'release')
nunit('sample.dll').include(:unit_tests).exclude(:integration_tests)
```

In this case, the msbuild method refers to MSBuild 4.0, and the nunit method refers to NUnit 2.5.

The second scenario involves calling a method for a specific version of each command:

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder

msbuild_40('sample.proj').target(:rebuild).property(configuration: 'release')
nunit_25('sample.dll').include(:unit_tests).exclude(:integration_tests)
```

Notice how the version number forms part of the method itself.

### Execution

#### The "execute!" method

At any point along the chain, the __execute!__ method may be called to execute the command:

```ruby
msbuild('sample.proj').target(:rebuild).property(configuration: 'release').execute!
```

The __execute!__ method executes the command using Rake's __sh__ method.

#### The "to_s" method

At any point along the chain, the __to_s__ method may be called to get the command string:

```ruby
command = msbuild('sample.proj').target(:rebuild).property(configuration: 'release').to_s
```

This approach enables custom execution of a command which could be useful in the following scenarios:

- Executing the command by a means other than Rake's to_s method.
- Remote execution, e.g. SSH
- Deferred execution
- Concatenation with another command
- Generated scripts such as a batch script

### Argument Formatting

#### Lists

An array can be passed to an argument that allows multiple values.
Fluent Command Builder will format the list using the appropriate delimiter.

Desired command line:

    MSBuild sample.proj /target:clean;build

Fluent Command Builder usage:

```ruby
msbuild('sample.proj').target([:clean, :build])
```

Notice how target is an array and has been formatted as a semicolon delimited list.

#### Key-value Pairs

A hash can be passed to an argument that expects key-value pairs.
Fluent Command Builder will format the key-value pairs using the appropriate delimiters.

Desired command line:

    MSBuild sample.proj /property:configuration=release

Fluent Command Builder usage:

```ruby
msbuild('sample.proj').property(configuration: 'release')
```

Notice how property is a hash and has been formatted using the equals sign.

#### Arguments containing spaces

Fluent Command Builder will surround any argument containing a space with double quotes automatically.

Desired command line:

    MSBuild "sample 1.proj"

Fluent Command Builder usage:

```ruby
msbuild('sample 1.proj')
```

Notice the space in the project name and how the output has surrounded the project name with double quotes.

#### Nested Commands

Fluent Command Builder also supports nesting of commands.

Desired command line:

    bundle exec cucumber sample.feature

Fluent Command Builder usage:

```ruby
bundle.exec(cucumber('sample.feature'))
```

## Customisation

Each command has an underlying command builder which provides generic functions for building command line strings.
The underlying command builder can be exposed to enable customisation of the command line:

Desired command line:

    rake deploy TARGET_ENV=TEST

Fluent Command Builder usage:

```ruby
rake(:deploy) { |b| b.append ' TARGET_ENV=TEST' }
```

## Supported Commands

- [appcfg.py] 1.6, 1.7
- aspnet_compiler [2.0][aspnet_compiler_20], [3.5][aspnet_compiler_35], [4.0][aspnet_compiler_40]
- [cucumber] 1.1, 1.2
- [dev_appserver.py] 1.6, 1.7
- [dotcover] 1.0, 1.1, 1.2, 2.0
- installutil [1.1][installutil_11], [2.0][installutil_20], [3.5][installutil_35], [4.0][installutil_40]
- msbuild [2.0][msbuild_20], [3.0][msbuild_30], [3.5][msbuild_35], [4.0][msbuild_40]
- msdeploy [4.0][msdeploy_40]
- mstest [2005][mstest_2005], [2008][mstest_2008], [2010][mstest_2010]
- netsh [2008][netsh_2008] (WIP)
- nunit [2.5][nunit_25], [2.6][nunit_26]
- [rake] 0.9
- security [OSX 10.7][security_osx_107] (WIP)
- [sevenzip] 9.2 (WIP)
- [simian] 2.3
- tf [2010][tf_2010], [tee 2010][tf_tee_2010]
- xcodebuild [4.3][xcodebuild_43]

Additional commands can be easily added, please email suggestions to: matthew-github@matthewriley.name

[appcfg.py]: https://developers.google.com/appengine/docs/python/tools/uploadinganapp
[aspnet_compiler_20]: http://msdn.microsoft.com/en-us/library/ms229863(v=vs.80).aspx
[aspnet_compiler_35]: http://msdn.microsoft.com/en-us/library/ms229863(v=vs.90).aspx
[aspnet_compiler_40]: http://msdn.microsoft.com/en-us/library/ms229863(v=vs.100).aspx
[cucumber]: http://http://cukes.info/
[dev_appserver.py]: https://developers.google.com/appengine/docs/python/tools/devserver
[dotcover]: http://www.jetbrains.com/dotcover/
[installutil_11]: http://msdn.microsoft.com/en-us/library/50614e95(v=vs.71).aspx
[installutil_20]: http://msdn.microsoft.com/en-us/library/50614e95(v=vs.80).aspx
[installutil_35]: http://msdn.microsoft.com/en-us/library/50614e95(v=vs.90).aspx
[installutil_40]: http://msdn.microsoft.com/en-us/library/50614e95(v=vs.100).aspx
[msbuild_20]: http://msdn.microsoft.com/en-us/library/0k6kkbsd(v=vs.80).aspx
[msbuild_30]: http://msdn.microsoft.com/en-us/library/0k6kkbsd(v=vs.85).aspx
[msbuild_35]: http://msdn.microsoft.com/en-us/library/0k6kkbsd(v=vs.90).aspx
[msbuild_40]: http://msdn.microsoft.com/en-us/library/0k6kkbsd(v=vs.100).aspx
[msdeploy_40]: http://technet.microsoft.com/en-us/library/dd569106(v=ws.10).aspx
[mstest_2005]: http://msdn.microsoft.com/en-us/library/ms182489(v=vs.80).aspx
[mstest_2008]: http://msdn.microsoft.com/en-us/library/ms182489(v=vs.90).aspx
[mstest_2010]: http://msdn.microsoft.com/en-us/library/ms182489(v=vs.100).aspx
[netsh_2008]: http://technet.microsoft.com/en-us/library/cc754516(v=ws.10).aspx
[nunit_25]: http://www.nunit.org/index.php?p=consoleCommandLine&r=2.5.10
[nunit_26]: http://www.nunit.org/index.php?p=consoleCommandLine&r=2.6
[rake]: http://docs.rubyrake.org/user_guide/chapter02.html
[security_osx_107]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/Manpages/man1/security.1.html
[sevenzip]: http://www.7-zip.org/
[simian]: http://www.harukizaemon.com/simian/
[tf_2010]: http://msdn.microsoft.com/en-us/library/z51z7zy0(v=vs.100).aspx
[tf_tee_2010]: http://msdn.microsoft.com/en-us/library/gg413282.aspx
[xcodebuild_43]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html