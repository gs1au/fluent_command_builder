require_relative '../lib/command_test_base'

class NUnitVersionTest < CommandTestBase

  def test_version_40
    FluentCommandBuilder::NUnit.version_detector.backticks_executor = MockExecutor.new <<EOF
NUnit-Console version 2.6.0.12051
Copyright (C) 2002-20011 Charlie Poole.
Copyright (C) 2002-2004 James W. Newkirk, Michael C. Two, Alexei A. Vorontsov.
Copyright (C) 2000-2002 Philip Craig.
All Rights Reserved.

Runtime Environment -
   OS Version: Microsoft Windows NT 6.1.7601 Service Pack 1
  CLR Version: 2.0.50727.5456 ( Net 3.5 )


NUNIT-CONSOLE [inputfiles] [options]

Runs a set of NUnit tests from the console.

You may specify one or more assemblies or a single
project file of type .nunit.

Options:
/fixture=STR            Test fixture or namespace to be loaded (Deprecated) (Short format: /load=STR)
/run=STR                Name of the test case(s), fixture(s) or namespace(s) to run
/runlist=STR            Name of a file containing a list of the tests to run
/config=STR             Project configuration (e.g.: Debug) to load
/result=STR             Name of XML result file (Default: TestResult.xml) (Short format: /xml=STR)
/xmlConsole             Display XML to the console (Deprecated)
/noresult               Suppress XML result output (Short format: /noxml)
/output=STR             File to receive test output (Short format: /out=STR)
/err=STR                File to receive test error output
/work=STR               Work directory for output files
/labels                 Label each test in stdOut
/trace=X                Set internal trace level: Off, Error, Warning, Info, Verbose
/include=STR            List of categories to include
/exclude=STR            List of categories to exclude
/framework=STR          Framework version to be used for tests
/process=X              Process model for tests: Single, Separate, Multiple
/domain=X               AppDomain Usage for tests: None, Single, Multiple
/apartment=X            Apartment for running tests: MTA (Default), STA
/noshadow               Disable shadow copy when running in separate domain
/nothread               Disable use of a separate thread for tests
/timeout=X              Set timeout for each test case in milliseconds
/wait                   Wait for input before closing console window
/nologo                 Do not display the logo
/nodots                 Do not display progress
/stoponerror            Stop after the first test failure or error
/cleanup                Erase any leftover cache files and exit
/help                   Display help (Short format: /?)


Options that take values may use an equal sign, a colon
or a space to separate the option from its value.

EOF
    FluentCommandBuilder.path_finder = MockPathFinder.new '/'
    actual = FluentCommandBuilder::NUnit.version
    assert_equal '2.6.0.12051', actual
  end

end




