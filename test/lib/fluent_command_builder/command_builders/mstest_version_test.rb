require_relative '../../../command_test_base'

class MSTestVersionTest < CommandTestBase

  def test_version_100
    output = <<EOF
    Microsoft (R) Test Execution Command Line Tool Version 10.0.30319.1
    Copyright (c) Microsoft Corporation. All rights reserved.

    Usage:                              MSTest.exe [options].

    Description:                        Run tests in test files or in a metadata
                                        file. Optionally, publish test results,
                                        if Team Explorer is also installed.

    Options:

      /help                             Display this usage message.
                                        (Short form: /? or /h)

      /nologo                           Do not display the startup banner and
                                        copyright message.

      /testcontainer:[file name]        Load a file that contains tests. You can
                                        Specify this option more than once to
                                        load multiple test files.
                                        Examples:
                                          /testcontainer:mytestproject.dll
                                          /testcontainer:loadtest1.loadtest

      /maxpriority:[priority]           Only tests whose priority is less than
                                        or equal to this value will be executed.
                                        Example:
                                        /minpriority:0 /maxpriority:2

      /category:[filter]                Use the specified filter to select tests
                                        to run based on the test category of each
                                        test.
                                        You can use the logical operators &
                                        and ! to construct your filter, or you
                                        can use logical operators | and ! to
                                        filter the tests.
                                        Examples:
                                        /category:Priority1
                                           (any tests with category: Priority1)
                                        /category:"Priority1&MyTests"
                                           (tests that must have multiple
                                            categories: Priority1 and MyTests)
                                        /category:"Priority1|MyTests"
                                           (all tests from multiple
                                            categories: Priority 1 or MyTests)
                                        /category:"Priority1&!MyTests"
                                           (filter out tests: Priority1 tests
                                             that do not have a test category
                                             of MyTests)

      /minpriority:[priority]           Only tests whose priority is greater than
                                        or equal to this value will be executed.
                                        Example:
                                        /minpriority:0 /maxpriority:2

      /testmetadata:[file name]         Load a metadata file.
                                        Example:
                                          /testmetadata:testproject1.vsmdi

      /testsettings:[file name]         Use the specified test settings file.
                                        Example:
                                          /testsettings:mysettings.testsettings

      /resultsfile:[file name]          Save the test run results to the specified
                                        file.
                                        Example:
                                          /resultsfile:c:\temp\myresults.trx

      /testlist:[test list path]        The test list, as specified in the metadata
                                        file, to be run. You can specify this
                                        option multiple times to run more than
                                        one test list.
                                        Example:
                                          /testlist:checkintests/clientteam

      /test:[test name]                 The name of a test to be run. You can
                                        specify this option multiple times to run
                                        more than one test.

      /unique                           Run a test only if one unique match is
                                        found for any given /test.

      /usestderr                        Uses standard error to output error
                                        information.  Without this option all
                                        output is sent to standard output.

      /noisolation                      Run tests within the MSTest.exe process.
                                        This choice improves test run speed but
                                        increases risk to the MSTest.exe process.

      /noresults                        Do not save the test results in a TRX file.
                                        This choice improves test run speed but
                                        does not save the test run results.

      /detail:[property id]             The name of a property that you want to
                                        show values for, in addition to the test
                                        outcome. Please examine a test results
                                        file to see the available properties.
                                        Example: /detail:errormessage

    The following options are also available if Team Explorer is installed:

      /publish:[team project collection url]            Publish results to the Team Project Collection.

      /testconfigname:[config name]     The name of the pre-existing test
                                        management configuration to associate with
                                        the published run.
                                        If not specified using a name then
                                        optionally use /testconfigid to specify
                                        the configuration by id. If you use
                                        neither then no configuration will
                                        be associated with the published run.
                                        This switch is only used with /publish
                                        to publish to a test management server.

      /testconfigid:[config id]         The id (a positive integer) of the
                                        pre-existing test management configuration
                                        to associate with the published run.
                                        If not specified using an id then
                                        optionally use /testconfigname to specify
                                        the configuration by name. If you use
                                        neither then no configuration will
                                        be associated with the published run.
                                        This switch is only used with /publish
                                        to publish to a test management server.

      /publishbuild:[build name]        The build identifier to be used to publish
                                        test results.

      /publishresultsfile:[file name]   The name of the test results file to
                                        publish. If none is specified, use the
                                        file produced by the current test run.

      /teamproject:[team project name]  The name of the team project to which the
                                        build belongs. Specify this when publishing
                                        test results.

      /platform:[platform]              The platform of the build against which
                                        to publish test results.

      /flavor:[flavor]                  The flavor of the build against which
                                        to publish test results.

      /buildverification:[yes/no]       [Optional] Identifies the test as a build
                                        verification run.  Default value is yes

EOF
    executor = stub
    executor.stubs(:execute).returns(output)
    FluentCommandBuilder::MSTest.version_detector.backticks_executor = executor
    actual = FluentCommandBuilder::MSTest.version
    assert_equal '10.0.30319.1', actual
  end

end


