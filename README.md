# Fluent Command Builder

Fluent Command Builder is designed to ease the process of building command line strings.

Each supported command is represented by a class that provides a fluent interface by means of method chaining.

## Example

```ruby
msbuild('sample.proj').target(['clean', 'build']).property({'configuration'=>'release'})
```

Produces:

    MSBuild sample.proj /target:clean;build /property:configuration=release

## Intellisense

Extremely effective with [RubyMine](http://www.jetbrains.com/ruby/) intellisense.

![RubyMine intellisense for MSBuild](https://github.com/mattriley/fluent_command_builder/raw/master/readme/msbuild_intellisense.png)

## Installation

    gem install fluent_command_builder

## Usage

### Versions

Fluent Command Builder supports multiple versions of each command and offers two main usage scenarios.

The first scenario involves including the modules for a specific version of each command:

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder::MSBuild::V40
include FluentCommandBuilder::Nunit::V25

msbuild('sample.proj').target('rebuild').property({'configuration'=>'release'}).execute!
nunit('sample.dll').include('unit_tests').exclude('integration_tests').execute!
```

In this case, the msbuild method refers to MSBuild 4.0, and the nunit method refers to NUnit 2.5.

The second scenario involves calling a method for a specific version of each command:

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder

msbuild_40('sample.proj').target('rebuild').property({'configuration'=>'release'}).execute!
nunit_25('sample.dll').include('unit_tests').exclude('integration_tests').execute!
```

Notice how the version number forms part of the method itself.

### Execution

#### The "execute!" method

At any point along the chain, the __execute!__ method may be called to execute the command:

```ruby
msbuild('sample.proj').target('rebuild').property({'configuration'=>'release'}).execute!
```

The __execute!__ method executes the command using Rake's __sh__ method.

#### The "to_s" method

At any point along the chain, the __to_s__ method may be called to get the command string:

```ruby
command = msbuild('sample.proj').target('rebuild').property({'configuration'=>'release'}).to_s
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
Fluent Command Builder will format the list using the appropriate delimiter:

```ruby
msbuild('sample.proj').target(['clean', 'build'])
```

Produces:

    MSBuild sample.proj /target:clean;build

Notice how target is an array and has been formatted as a semicolon delimited list.

#### Key-value Pairs

A hash can be passed to an argument that expects key-value pairs.
Fluent Command Builder will format the key-value pairs using the appropriate delimiters:

```ruby
msbuild('sample.proj').property({'configuration'=>'release'})
```

Produces:

    MSBuild sample.proj /property:configuration=release

Notice how property is a hash and has been formatted using the equals sign.

#### Arguments containing spaces

Fluent Command Builder will surround any argument containing a space with double quotes automatically:

```ruby
msbuild('sample 1.proj')
```

Produces:

    MSBuild "sample 1.proj"

Notice the space in the project name and how the output has surrounded the project name with double quotes.

#### Nested Commands

Fluent Command Builder also supports nesting of commands:

```ruby
bundle.exec(cucumber('sample.feature'))
```

Produces:

    bundle exec cucumber sample.feature

## Supported Commands

- aspnet_compiler 2.0, 3.5, 4.0
- cucumber 1.1
- dotcover 1.0, 1.1, 1.2
- installutil 1.1, 2.0, 3.5, 4.0
- msbuild 2.0, 3.0, 3.5, 4.0
- msdeploy 4.0
- mstest 2005, 2008, 2010
- netsh 2008 (advfirewall only at present)
- nunit 2.5, 2.6
- rake 0.9
- sevenzip 9.2 (work in progress)
- simian 2.3
- tf 2010, tee 2010

## Project Notes

Please note that this project is not constrained to the Microsoft platform.

Suggestions for additional commands are most welcome.

Please email to matthew-github@matthewriley.name.