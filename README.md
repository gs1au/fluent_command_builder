Official fork: [https://github.com/mattriley/fluent_command_builder](https://github.com/mattriley/fluent_command_builder)

# Fluent Command Builder

Fluent Command Builder makes building command lines easy and clean.

Automated build/test/deploy processes depend heavily on tools that provide a command line interface.
Building command lines requires much string interpolation and often results in code which is not only
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

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder::MSBuild::V40
msbuild('sample.proj').target(:rebuild).property(configuration: 'release').execute!
```

In this example, the __msbuild__ method invokes a MSBuild 4.0 command builder and expects that MSBuild is on the PATH.

To set the path explicitly:

```ruby
configure_msbuild { |config| config.path = 'C:/Windows/Microsoft.NET/Framework64/v4.0.30319' }
```

If the path does not exist, a warning will be generated similar to:

    WARNING: Path for command "MSBuild", version "4.0" does not exist. Path: C:/Windows/Microsoft.NET/Framework64/v4.0.30319

At execution time, if the path still does not exist, an error will be generated similar to:

    ERROR: Path for command "MSBuild", version "4.0" does not exist. Path: C:/Windows/Microsoft.NET/Framework64/v4.0.30319

## Execution

### The "execute!" method

At any point along the chain, the __execute!__ method may be called to execute the command:

```ruby
msbuild('sample.proj').target(:rebuild).property(configuration: 'release').execute!
```

By default, the __execute!__ method executes the command using [Kernel#system](http://www.ruby-doc.org/core-1.9.3/Kernel.html#method-i-system).

#### The Execution Context

__FluentCommandBuilder::execution_context__ exposes the following attributes which can be used to customise command execution:

- __executor__: An object responsible for executing the command. Default: __SystemExecutor__.
- __formatter__: An object responsible for formatting the command for display. Default: __NullFormatter__.
- __should_print_on_execute__: Determines whether the command should be displayed when executed. Default: __true__.
- __should_fail_on_error__: Determines whether the command should raise an exception if not successful. Default: __true__.

Available executors:

- __BackticksExecutor__: Executes the command and returns the output.
- __DryRunExecutor__: Prints the command instead of executing it.
- __RakeShExecutor__: Executes the command using [Rake#sh](http://rake.rubyforge.org/classes/FileUtils.html#M000018).
- __SystemExecutor__: Executes the command using [Kernel#system](http://www.ruby-doc.org/core-1.9.3/Kernel.html#method-i-system) and returns true (successful), false (unsuccessful) or nil (failed).

Available formatters:

- __NullFormatter__: Leaves the command unaltered.
- __HiddenPasswordFormatter__: Replaces passwords with *** (by default).

Example customisation:

```ruby
FluentCommandBuilder.execution_context.executor = BackticksExecutor.new
FluentCommandBuilder.execution_context.formatter = HiddenPasswordFormatter.new
FluentCommandBuilder.execution_context.should_print_on_execute = false
FluentCommandBuilder.execution_context.should_fail_on_error = true
```

The execution context can be changed temporarily using the __change_execution_context__ method:

```ruby
FluentCommandBuilder.change_execution_context do |context|
    context.executor = BackticksExecutor.new
    context.formatter = HiddenPasswordFormatter.new
    context.should_print_on_execute = false
    context.should_fail_on_error = true
    msbuild_40('sample.proj').execute!
end
```

Once the block has executed, the execution context will reset to it's original values.

Please note that it is also possible to plug-in custom executors and formatters.

#### Version Validation

Fluent Command Builder compares the command builder version with the actual command version just prior to execution
and aborts if the versions do not match.

As an example, if MSBuild 3.5 is on the PATH but is being invoked by an MSBuild 4.0 command builder,
an error would be generated similar to:

    ERROR: Version validation for command "MSBuild" failed. Expected version 4.0 but was 3.5.

Version validation can be configured to warn instead of aborting:

```ruby
configure_msbuild { |config| config.version_validation_level = :warn }
```

### The "to_s" method

At any point along the chain, the __to_s__ method may be called to get the command string:

```ruby
command = msbuild('sample.proj').target(:rebuild).property(configuration: 'release').to_s
```

## Capabilities

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

#### Detect version of command on PATH

Fluent Command Builder provides a consitent way of obtaining a command version:

```ruby
MSBuild.version # => "4.0.30319.1"
```

## Customisation

### Custom String Appending

Each command has an underlying builder that provides generic functions for building command line strings.
The underlying builder can be exposed to enable customisation of the command line.

In the following examples, the underlying builder is exposed as the variable __b__.

Desired command line:

    rake deploy TARGET_ENV=TEST

Fluent Command Builder usage:

```ruby
rake(:deploy) { |b| b.append ' TARGET_ENV=TEST' }
```



## Supported Commands

__Please note:__

The versions listed here are not tightly bound to the actual version of the command being executed.

Since most commands are backwards compatible and vary only slightly between versions,
an old version of a command builder can be used with a new version of a command.

As an example, the __security__ command for OS X is listed as version 10.7 (Lion),
but can also be used for version 10.8 (Mountain Lion).

### Ruby

Gems:

- cucumber 1.1, 1.2
- rake 0.9
- bundle 1.1

### Google

App Engine Python SDK:

- appcfg.py 1.6, 1.7
- dev_appserver.py 1.6, 1.7

### Apple

OS X (10.7 = Lion, 10.8 = Mountain Lion)

- security 10.7, 10.8 (WIP)

XCode

- xcodebuild 4.3, 4.4, 4.5

### Microsoft

Windows (6.1 = Windows 7 / Windows Server 2008 R2)

- netsh.exe 6.1 (WIP)

IIS:

- msdeploy.exe 7.1

.NET Framework:

- aspnet_compiler.exe 2.0, 4.0
- installutil.exe 1.1, 2.0, 3.5, 4.0
- msbuild.exe 2.0, 3.0, 3.5, 4.0

Visual Studio (8.0 = 2005, 9.0 = 2008, 10.0 = 2010):

- mstest.exe 8.0, 9.0, 10.0
- tf.exe 10.0
- tf.exe (Team Explorer Everywhere) 10.0, 10.1

Other very important tools:

- nuget.exe 2.0
- nunit-console.exe (NUnit) 2.5, 2.6
- dotcover.exe (.NET code coverage tool by JetBrains) 1.0, 1.1, 1.2, 2.0
- 7za.exe (7-Zip) 9.20 (WIP)
- simian.exe 2.3
- conlinkchecker.exe (Fast Link Checker) 2.1