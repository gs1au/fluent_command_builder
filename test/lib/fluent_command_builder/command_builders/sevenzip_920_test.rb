# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class SevenZip920Test < CommandTestBase

  def test_add_full_command
    expected = '7za a archive fileRef -irecurseTypefileRef -ifileRef -mmethodParameters -ppassword -rmodifier -r -sfxsfxModule -sfx -sifileName -si -so -ssw -tarchiveType -uargs -vsizeunitOfMeasure -vsize -wdirPath -w -xrecurseTypefileRef -xfileRef'
    actual = sevenzip_920.add('archive', 'fileRef').include('fileRef', 'recurseType').include('fileRef').set_compression_method('methodParameters').password('password').recursive('modifier').recursive.create_sfx_archive('sfxModule').create_sfx_archive.read_data_from_stdin('fileName').read_data_from_stdin.write_data_to_stdout.compress_files_open_for_writing.type('archiveType').update_options('args').create_volumes('size', 'unitOfMeasure').create_volumes('size').working_dir('dirPath').working_dir.exclude('fileRef', 'recurseType').exclude('fileRef')
    assert_command expected, actual
  end

  def test_bench_full_command
    expected = '7za b numberOfIterations -mmtn -mdn -mm=method'
    actual = sevenzip_920.bench('numberOfIterations').mmt('n').md('n').mm('method')
    assert_command expected, actual
  end

  def test_delete_full_command
    expected = '7za d archive files -ifileRefrecurseType -ifileRef -mmethodParameters -ppassword -rmodifier -r -uargs -wdirPath -w -xfileRefrecurseType -xfileRef'
    actual = sevenzip_920.delete('archive', 'files').include('recurseType', 'fileRef').include('fileRef').set_compression_method('methodParameters').password('password').recursive('modifier').recursive.update_options('args').working_dir('dirPath').working_dir.exclude('recurseType', 'fileRef').exclude('fileRef')
    assert_command expected, actual
  end

  def test_extract_full_command
    expected = '7za e archive files -ai -an -ao -irecurseTypefileRef -ifileRef -odirPath -ppassword -rmodifier -r -so -tarchiveType -xrecurseTypefileRef -xfileRef -y'
    actual = sevenzip_920.extract('archive', 'files').ai.an.ao.include('fileRef', 'recurseType').include('fileRef').output('dirPath').password('password').recursive('modifier').recursive.write_data_to_stdout.type('archiveType').exclude('fileRef', 'recurseType').exclude('fileRef').y
    assert_command expected, actual
  end

  def test_list_full_command
    expected = '7za l archive -ai -an -ax -ifileRefrecurseType -ifileRef -slt -ppassword -rmodifier -r -tarchiveType -xrecurseTypefileRef -xfileRef'
    actual = sevenzip_920.list('archive').ai.an.ax.include('recurseType', 'fileRef').include('fileRef').slt.password('password').recursive('modifier').recursive.type('archiveType').exclude('fileRef', 'recurseType').exclude('fileRef')
    assert_command expected, actual
  end

  def test_test_full_command
    expected = '7za t archive files -ai -an -ax -irecurseTypefileRef -ifileRef -ppassword -rmodifier -r -xrecurseTypefileRef'
    actual = sevenzip_920.test('archive', 'files').ai.an.ax.include('fileRef', 'recurseType').include('fileRef').password('password').recursive('modifier').recursive.exclude('fileRef', 'recurseType')
    assert_command expected, actual
  end

  def test_update_full_command
    expected = '7za u archive files -irecurseTypefileRef -ifileRef -mmethodParameters -ppassword -rmodifier -r -sfxsfxModule -sfx -sifileName -si -so -ssw -tarchiveType -uargs -wdirPath -w -xfileRefrecurseType -xrecurseType'
    actual = sevenzip_920.update('archive', 'files').include('fileRef', 'recurseType').include('fileRef').set_compression_method('methodParameters').password('password').recursive('modifier').recursive.create_sfx_archive('sfxModule').create_sfx_archive.read_data_from_stdin('fileName').read_data_from_stdin.write_data_to_stdout.compress_files_open_for_writing.type('archiveType').update_options('args').working_dir('dirPath').working_dir.exclude('recurseType', 'fileRef').exclude('recurseType')
    assert_command expected, actual
  end

  def test_extract_with_full_paths_full_command
    expected = '7za x archive files -ai -an -ao -irecurseTypefileRef -ifileRef -odirPath -ppassword -rmodifier -r -so -tarchiveType -xrecurseTypefileRef -xfileRef -y'
    actual = sevenzip_920.extract_with_full_paths('archive', 'files').ai.an.ao.include('fileRef', 'recurseType').include('fileRef').output('dirPath').password('password').recursive('modifier').recursive.write_data_to_stdout.type('archiveType').exclude('fileRef', 'recurseType').exclude('fileRef').y
    assert_command expected, actual
  end

end