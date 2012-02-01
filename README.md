# Fluent Command Builder

Fluent Command Builder is designed to ease the process of building command line strings.

Each supported command is represented by a class that provides a fluent interface by means of method chaining.

## Example

```ruby
msbuild.project_file('sample.csproj').target(:rebuild).property({ :configuration => :release })
```

Produces:

    MSBuild sample.csproj /target:rebuild /property:configuration=release

## Intellisense

Extremely effective with [RubyMine](http://www.jetbrains.com/ruby/) intellisense.

![RubyMine intellisense for MSBuild](https://github.com/mattriley/fluent_command_builder/raw/master/readme/msbuild_intellisense.png)

## Installation

    gem install fluent_command_builder

## Usage

Fluent Command Builder supports multiple versions of each command and offers two main usage scenarios.

The first scenario involves including the modules for a specific version of each command:

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder::MSBuild::V40
include FluentCommandBuilder::NunitConsole::V25

system msbuild.project_file('sample.csproj').target(:rebuild).property({ :configuration => :release }).to_s
system nunit.assembly('sample.dll').include(:unit_tests).exclude(:integration_tests).to_s
```

In this case, the msbuild method refers to MSBuild 4.0, and the nunit method refers to NUnit 2.5.

The second scenario involves calling a method for a specific version of each command:

```ruby
require 'fluent_command_builder'
include FluentCommandBuilder

system msbuild_40.project_file('sample.csproj').target(:rebuild).property({ :configuration => :release }).to_s
system nunit_25.assembly('sample.dll').include(:unit_tests).exclude(:integration_tests).to_s
```

Notice how the version number forms part of the method itself.


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
- simian 2.3
- tf 2010, TEE 2010

Please note that this project is not constrained to the Microsoft platform.

Suggestions for additional commands are most welcome.

Please email to matthew-github@matthewriley.name.