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

### Set the Command Path

Desired command line:

    "C:\Program Files\MSBuild" "sample 1.proj"

Fluent Command Builder usage:

```ruby
msbuild('sample 1.proj').execute! { |b| b.path = 'C:\\Program Files' }
```

## Experimental

These features are new and experimental. Use with caution.

### Detect version of command on PATH

Fluent Command Builder provides a consistent way of detecting the version of a command on the PATH environment variable.

```ruby
MSBuild.version # => "4.0.30319.1"
```

### Create command builder based on version of command on PATH

Fluent Command Builder can dynamically create a command builder based on the version of a command on the PATH environment variable.

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder

msbuild('sample.proj').target(:rebuild).property(configuration: 'release')
```

Notice there is no mention of the MSBuild version. So if MSBuild 4.0 is on the path, this would be a MSBuild 4.0 command builder.

## Supported Commands

- appcfg.py 1.6, 1.7
- aspnet_compiler 2.0, 3.5, 4.0
- cucumber 1.1, 1.2
- dev_appserver.py 1.6, 1.7
- dotcover 1.0, 1.1, 1.2, 2.0
- installutil 1.1, 2.0, 3.5, 4.0
- msbuild 2.0, 3.0, 3.5, 4.0
- msdeploy 4.0
- mstest 2005, 2008, 2010
- netsh 2008 (WIP)
- nunit 2.5, 2.6
- rake 0.9
- security OSX 10.7 (WIP)
- sevenzip 9.2 (WIP)
- simian 2.3
- tf 2010, tee 2010
- xcodebuild 4.3, 4.4