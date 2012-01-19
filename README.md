# Fluent Command Builder

A command line builder with a fluent interface written in Ruby.

## About

Fluent Command Builder is designed to ease the process of building command line strings.

Each supported command is represented by a class that provides a fluent interface by means of method chaining.

## Examples

    msbuild.project_file('sample.csproj').target('rebuild').property({ :configuration => 'release' })
    => MSBuild sample.csproj /target:rebuild /property:configuration=release

## Supported Commands

- aspnet_compiler 2.0, 3.5, 4.0
- cucumber 1.1
- dotcover 1.1
- installutil 1.1, 2.0, 3.5, 4.0
- msbuild 2.0, 3.0, 3.5, 4.0
- mstest 2005, 2008, 2010
- netsh 2008 (advfirewall only at present)
- nunit-console 2.5
- rake 0.9
- simian 2.3
- tf 2010

Please note that this project is *not* constrained to the Microsoft platform.

Suggestions for additional commands are most welcome.

Please email to matthew-github@matthewriley.name.