# Fluent Command Builder

Fluent Command Builder is designed to ease the process of building command line strings.

Each supported command is represented by a class that provides a fluent interface by means of method chaining.

## Example

```ruby
msbuild('sample.csproj').target(:rebuild).property({ :configuration => :release })
```

Produces:

    MSBuild sample.csproj /target:rebuild /property:configuration=release

## Intellisense

Extremely effective with [RubyMine](http://www.jetbrains.com/ruby/) intellisense.

![RubyMine intellisense for MSBuild](https://github.com/mattriley/fluent_command_builder/raw/master/readme/msbuild_intellisense.png)

## Installation

    gem install fluent_command_builder

## Usage

### Versioning

Fluent Command Builder supports multiple versions of each command and offers two main usage scenarios.

The first scenario involves including the modules for a specific version of each command:

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder::MSBuild::V40
include FluentCommandBuilder::NunitConsole::V25

msbuild('sample.csproj').target(:rebuild).property({ :configuration => :release }).execute
nunit('sample.dll').include(:unit_tests).exclude(:integration_tests).execute
```

In this case, the msbuild method refers to MSBuild 4.0, and the nunit method refers to NUnit 2.5.

The second scenario involves calling a method for a specific version of each command:

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder

msbuild_40('sample.csproj').target(:rebuild).property({ :configuration => :release }).execute
nunit_25('sample.dll').include(:unit_tests).exclude(:integration_tests).execute
```

Notice how the version number forms part of the method itself.

### Execution

Fluent Command Builder offers two main usage scenarios for executing commands.

The first scenario involves calling the __execute__ method at the end of any command:

```ruby
msbuild('sample.csproj').target(:rebuild).property({ :configuration => :release }).execute
```

If __Rake__ is installed, Rake's __sh__ method will be used to execute the command, otherwise __system__ will be used.

The second scenario involves getting the command as a string using the __to_s__ method and executing it by another means:

```ruby
exec msbuild('sample.csproj').target(:rebuild).property({ :configuration => :release }).to_s
```

## Supported Commands

- aspnet_compiler 2.0, 3.5, 4.0
- cucumber 1.1
- dotcover 1.1
- installutil 1.1, 2.0, 3.5, 4.0
- msbuild 2.0, 3.0, 3.5, 4.0
- msdeploy 4.0
- mstest 2005, 2008, 2010
- netsh 2008 (advfirewall only at present)
- nunit 2.5
- rake 0.9
- sevenzip 9.2 (work in progress)
- simian 2.3
- tf 2010, tee 2010

## References

### Team Foundation

- tf 2010: http://msdn.microsoft.com/en-us/library/cc31bk2e%28v=vs.100%29.aspx
- tf tee 2010: http://msdn.microsoft.com/en-us/library/gg413282.aspx

Note: The MSDN command line references contain many inaccuracies/incosistencies which many have traslated into this library.

## Project Notes

Please note that this project is not constrained to the Microsoft platform.

Suggestions for additional commands are most welcome.

Please email to matthew-github@matthewriley.name.