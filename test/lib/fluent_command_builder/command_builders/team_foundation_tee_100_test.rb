# Note: Tests do not represent valid command line usage.

require_relative '../command_test_base'

class TeamFoundationTee100Test < CommandTestBase

  def assert_each_tf_command(expected_command_text)
    assert_command expected_command_text, yield(team_foundation_100)
    expected_command_text.gsub! '/', '-'
    assert_command expected_command_text, yield(team_foundation_tee_100)
  end

  def test_add
    expected = 'tf add itemSpec /lock:lockType /type:fileType /noPrompt /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.add('itemSpec').lock('lockType').type('fileType').no_prompt.login('username', 'password').login('username')
    end
  end

  def test_branch
    expected = 'tf branch oldItem newItem /version:versionSpec /noGet /lock:lockType /noPrompt /silent /checkin /comment:comment /author:author /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.branch('oldItem', 'newItem').version('versionSpec').no_get.lock('lockType').no_prompt.silent.checkin.comment('comment').author('author').login('username', 'password').login('username')
    end
  end

  def test_branches
    expected = 'tf branches itemSpec /version:versionSpec /collection:teamProjectCollectionUrl /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.branches('itemSpec').version('versionSpec').collection('teamProjectCollectionUrl').login('username', 'password').login('username')
    end
  end

  def test_changeset
    expected = 'tf changeset changesetNumber /comment:comment /notes:field1=value1;field2=value2 /noPrompt /collection:teamProjectCollectionUrl /latest /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.changeset('changesetNumber').comment('comment').notes('field1' => 'value1', 'field2' => 'value2').no_prompt.collection('teamProjectCollectionUrl').latest.login('username', 'password').login('username')
    end
  end

  def test_changeset_number_is_optional
    expected = 'tf changeset'
    assert_each_tf_command expected do |tf|
      tf.changeset
    end
  end

  def test_checkin
    expected = 'tf checkin itemSpec /author:authorName /comment:comment /noPrompt /notes:field1=value1;field2=value2 /override:reason /recursive /saved /validate /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.checkin('itemSpec').author('authorName').comment('comment').no_prompt.notes('field1' => 'value1', 'field2' => 'value2').override('reason').recursive.saved.validate.login('username', 'password').login('username')
    end
  end

  def test_checkin_item_spec_is_optional
    expected = 'tf checkin'
    assert_each_tf_command expected do |tf|
      tf.checkin
    end
  end

  def test_checkin_shelveset
    expected = 'tf checkin /shelveset:shelvesetName;shelvesetOwner /noPrompt /login:username,password /login:username /collection:teamProjectCollectionUrl /author:authorName'
    assert_each_tf_command expected do |tf|
      tf.checkin_shelveset('shelvesetName', 'shelvesetOwner').no_prompt.login('username', 'password').login('username').collection('teamProjectCollectionUrl').author('authorName')
    end
  end

  def test_checkin_shelveset_owner_is_optional
    expected = 'tf checkin /shelveset:shelvesetName'
    assert_each_tf_command expected do |tf|
      tf.checkin_shelveset('shelvesetName')
    end
  end

  def test_checkout
    expected = 'tf checkout itemSpec /lock:lockType /recursive /type:encoding /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.checkout('itemSpec').lock('lockType').recursive.type('encoding').login('username', 'password').login('username')
    end
  end

  def test_checkout_item_spec_is_optional
    expected = 'tf checkout'
    assert_each_tf_command expected do |tf|
      tf.checkout
    end
  end

  def test_configure
    expected = 'tf configure pathOfTeamProject /collection:teamProjectCollectionUrl /login:username,password /login:username'
    actual = team_foundation_100.configure('pathOfTeamProject').collection('teamProjectCollectionUrl').login('username', 'password').login('username')
    assert_command expected, actual
  end

  def test_delete
    expected = 'tf delete itemSpec /lock:lockType /recursive /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.delete('itemSpec').lock('lockType').recursive.login('username', 'password').login('username')
    end
  end

  def test_destroy
    expected = 'tf destroy itemSpec /keepHistory /stopAt:versionSpec /preview /startCleanup /noPrompt /silent /login:username,password /login:username /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.destroy('itemSpec').keep_history.stop_at('versionSpec').preview.start_cleanup.no_prompt.silent.login('username', 'password').login('username').collection('teamProjectCollectionUrl')
    end
  end

  def test_compare_with_current_workspace_version
    expected = 'tf difference itemSpec /version:versionSpec /type:fileType /format:format /ignoreSpace /ignoreEol /ignoreCase /recursive /options /noPrompt /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.compare_with_current_workspace_version('itemSpec').version('versionSpec').type('fileType').format('format').ignore_space.ignore_eol.ignore_case.recursive.options.no_prompt.login('username', 'password').login('username')
    end
  end

  def test_difference
    expected = 'tf difference itemSpec1 itemSpec2 /type:fileType /format:format /ignoreSpace /ignoreEol /ignoreCase /recursive /options /noPrompt /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.compare('itemSpec1', 'itemSpec2').type('fileType').format('format').ignore_space.ignore_eol.ignore_case.recursive.options.no_prompt.login('username', 'password').login('username')
    end
  end

  def test_compare_with_shelveset_version
    expected = 'tf difference shelvesetItemSpec /shelveset:shelvesetName;shelvesetOwner /shelveset:shelvesetName /type:fileType /format:format /ignoreSpace /ignoreEol /ignoreCase /recursive /options /noPrompt /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.compare_with_shelveset_version('shelvesetItemSpec').shelveset('shelvesetName', 'shelvesetOwner').shelveset('shelvesetName').type('fileType').format('format').ignore_space.ignore_eol.ignore_case.recursive.options.no_prompt.login('username', 'password').login('username')
    end
  end

  def test_configure_compare_tool
    expected = 'tf difference /configure'
    assert_each_tf_command expected do |tf|
      tf.configure_compare_tool
    end
  end

  def test_dir
    expected = 'tf dir itemSpec /version:versionSpec /recursive /folders /deleted /login:username,password /login:username /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.dir('itemSpec').version('versionSpec').recursive.folders.deleted.login('username', 'password').login('username').collection('teamProjectCollectionUrl')
    end
  end

  def test_folder_diff
    expected = 'tf folderDiff sourcePath targetPath /recursive /noPrompt /collection:teamProjectCollectionUrl /filter:filter1;filter2 /filterLocalPathsOnly /login:username,password /login:username /view:view1,view2'
    actual = team_foundation_100.folder_diff('targetPath', 'sourcePath').recursive.no_prompt.collection('teamProjectCollectionUrl').filter(%w(filter1 filter2)).filter_local_paths_only.login('username', 'password').login('username').view(%w(view1 view2))
    assert_command expected, actual
  end

  def test_folder_diff_source_path_is_optional
    expected = 'tf folderDiff targetPath'
    actual = team_foundation_100.folder_diff('targetPath')
    assert_command expected, actual
  end

  def test_eula
    expected = 'tf eula -accept'
    actual = team_foundation_tee_100.eula.accept
    assert_command expected, actual
  end

  def test_get
    expected = 'tf get itemSpec /version:versionSpec /all /overwrite /force /preview /recursive /remap /noPrompt /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.get('itemSpec').version('versionSpec').all.overwrite.force.preview.recursive.remap.no_prompt.login('username', 'password').login('username')
    end
  end

  def test_get_item_spec_is_optional
    expected = 'tf get'
    assert_each_tf_command expected do |tf|
      tf.get
    end
  end

  def test_getcs
    expected = 'tf getcs -changeset:changesetNumber -latest'
    actual = team_foundation_tee_100.getcs.changeset('changesetNumber').latest
    assert_command expected, actual
  end

  def test_help
    expected = 'tf help commandName'
    actual = team_foundation_100.help('commandName')
    assert_command expected, actual
  end

  def test_help_command_command_name_is_optional
    expected = 'tf help'
    actual = team_foundation_100.help
    assert_command expected, actual
  end

  def test_history
    expected = 'tf history itemSpec /version:versionSpec /stopAfter:number /recursive /user:userName /format:format /slotMode /itemMode /noPrompt /login:username,password /login:username /sort:sort /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.history('itemSpec').version('versionSpec').stop_after('number').recursive.user('userName').format('format').slot_mode.item_mode.no_prompt.login('username', 'password').login('username').sort('sort').collection('teamProjectCollectionUrl')
    end
  end

  def test_label
    expected = 'tf label labelName@scope itemSpec /owner:ownerName /version:versionSpec /comment:comment /child:lockType /recursive /login:username,password /login:username /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.label('labelName', 'itemSpec', 'scope').owner('ownerName').version('versionSpec').comment('comment').child('lockType').recursive.login('username', 'password').login('username').collection('teamProjectCollectionUrl')
    end
  end

  def test_label_scope_is_optional
    expected = 'tf label labelName itemSpec'
    assert_each_tf_command expected do |tf|
      tf.label('labelName', 'itemSpec')
    end
  end

  def test_delete_label
    expected = 'tf label /delete labelName@scope itemSpec /login:username,password /login:username /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.delete_label('labelName', 'itemSpec', 'scope').login('username', 'password').login('username').collection('teamProjectCollectionUrl')
    end
  end

  def test_delete_label_scope_is_optional
    expected = 'tf label /delete labelName itemSpec'
    assert_each_tf_command expected do |tf|
      tf.delete_label('labelName', 'itemSpec')
    end
  end

  def test_labels
    expected = 'tf labels labelName /owner:ownerName /format:format /collection:teamProjectCollectionUrl /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.labels('labelName').owner('ownerName').format('format').collection('teamProjectCollectionUrl').login('username', 'password').login('username')
    end
  end

  def test_labels_label_name_is_optional
    expected = 'tf labels'
    assert_each_tf_command expected do |tf|
      tf.labels
    end
  end

  def test_local_versions
    expected = 'tf localVersions itemSpec /recursive /format:format /workspace:workspaceName;workspaceOwner /workspace:workspaceName /recursive /collection:teamProjectCollectionUrl'
    actual = team_foundation_100.local_versions('itemSpec').recursive.format('format').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName').recursive.collection('teamProjectCollectionUrl')
    assert_command expected, actual
  end

  def test_lock
    expected = 'tf lock itemSpec /lock:lockType /workspace:workspaceName;workspaceOwner /workspace:workspaceName /recursive /login:username,password /login:username /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.lock('itemSpec').lock('lockType').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName').recursive.login('username', 'password').login('username').collection('teamProjectCollectionUrl')
    end
  end

  def test_merge
    expected = 'tf merge source destination /recursive /force /candidate /discard /version:versionSpec /lock:lockType /preview /baseless /noSummary /noImplicitBaseless /conservative /format:format /noPrompt /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.merge('source', 'destination').recursive.force.candidate.discard.version('versionSpec').lock('lockType').preview.baseless.no_summary.no_implicit_baseless.conservative.format('format').no_prompt.login('username', 'password').login('username')
    end
  end

  def test_merges
    expected = 'tf merges source destination /recursive /extended /format:format /login:username,password /login:username /showAll /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.merges('destination', 'source').recursive.extended.format('format').login('username', 'password').login('username').show_all.collection('teamProjectCollectionUrl')
    end
  end

  def test_merges_source_is_optional
    expected = 'tf merges destination'
    assert_each_tf_command expected do |tf|
      tf.merges('destination')
    end
  end

  def test_msdn
    expected = 'tf msdn commandName'
    actual = team_foundation_100.msdn('commandName')
    assert_command expected, actual
  end

  def test_msdn_command_name_is_optional
    expected = 'tf msdn'
    actual = team_foundation_100.msdn
    assert_command expected, actual
  end

  def test_permission
    expected = 'tf permission itemSpec /allow:permission1,permission2 /deny:permission1,permission2 /remove:permission1,permission2 /inherit:inherit /user:userName1,userName2 /group:groupName1,groupName2 /collection:teamProjectCollectionUrl /recursive /global /login:username,password /login:username'
    actual = team_foundation_100.permission('itemSpec').allow(%w(permission1 permission2)).deny(%w(permission1 permission2)).remove(%w(permission1 permission2)).inherit('inherit').user(%w(userName1 userName2)).group(%w(groupName1 groupName2)).collection('teamProjectCollectionUrl').recursive.global.login('username', 'password').login('username')
    assert_command expected, actual
  end

  def test_print
    expected = 'tf print itemSpec -version:versionSpec'
    actual = team_foundation_tee_100.print('itemSpec').version('versionSpec')
    assert_command expected, actual
  end

  def test_product_key
    expected = 'tf productKey -set:myProductKey -trial'
    actual = team_foundation_tee_100.product_key.set('myProductKey').trial
    assert_command expected, actual
  end

  def test_copy_profile
    expected = 'tf profile -copy existingProfileName newProfileName'
    actual = team_foundation_tee_100.copy_profile('existingProfileName', 'newProfileName')
    assert_command expected, actual
  end

  def test_delete_profile
    expected = 'tf profile -delete profileName'
    actual = team_foundation_tee_100.delete_profile('profileName')
    assert_command expected, actual
  end

  def test_edit_profile
    expected = 'tf profile -edit existingProfileName -string:name=value -boolean:name=value -number:name=value'
    actual = team_foundation_tee_100.edit_profile('existingProfileName').string('name', 'value').boolean('name', 'value').number('name', 'value')
    assert_command expected, actual
  end

  def test_new_profile
    expected = 'tf profile -new newProfileName -string:name=value -boolean:name=value -number:name=value'
    actual = team_foundation_tee_100.new_profile('newProfileName').string('name', 'value').boolean('name', 'value').number('name', 'value')
    assert_command expected, actual
  end

  def test_profiles
    expected = 'tf profiles -format:format'
    actual = team_foundation_tee_100.profiles.format('format')
    assert_command expected, actual
  end

  def test_properties
    expected = 'tf properties itemSpec /collection:teamProjectCollectionUrl /recursive /login:username,password /login:username /version:versionSpec /workspace:workspaceName;workspaceOwner /workspace:workspaceName'
    assert_each_tf_command expected do |tf|
      tf.properties('itemSpec').collection('teamProjectCollectionUrl').recursive.login('username', 'password').login('username').version('versionSpec').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName')
    end
  end

  def test_configure_proxy
    expected = 'tf proxy /configure url /collection:teamProjectCollectionUrl /login:username,password /login:username'
    actual = team_foundation_100.configure_proxy('url').collection('teamProjectCollectionUrl').login('username', 'password').login('username')
    assert_command expected, actual
  end

  def test_add_proxy_record
    expected = 'tf proxy /add url /name:name /site:siteName /description:description /collection:teamProjectCollectionUrl /login:username,password /login:username'
    actual = team_foundation_100.add_proxy_record('url').name('name').site('siteName').description('description').collection('teamProjectCollectionUrl').login('username', 'password').login('username')
    assert_command expected, actual
  end

  def test_delete_proxy_record
    expected = 'tf proxy /delete url /collection:teamProjectCollectionUrl /login:username,password /login:username'
    actual = team_foundation_100.delete_proxy_record('url').collection('teamProjectCollectionUrl').login('username', 'password').login('username')
    assert_command expected, actual
  end

  def test_list_proxy_records
    expected = 'tf proxy /list url1 url2 /collection:teamProjectCollectionUrl /login:username,password /login:username'
    actual = team_foundation_100.list_proxy_records(%w(url1 url2)).collection('teamProjectCollectionUrl').login('username', 'password').login('username')
    assert_command expected, actual
  end

  def test_enable_proxy
    expected = 'tf proxy /enabled:true'
    actual = team_foundation_100.enable_proxy
    assert_command expected, actual
  end

  def test_disable_proxy
    expected = 'tf proxy /enabled:false'
    actual = team_foundation_100.disable_proxy
    assert_command expected, actual
  end

  def test_rename
    expected = 'tf rename oldItem newItem /lock:lockType /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.rename('oldItem', 'newItem').lock('lockType').login('username', 'password').login('username')
    end
  end

  def test_resolve
    expected = 'tf resolve itemSpec /auto:resolution /preview /overrideType:overrideType /convertToType:convertType /recursive /newName:path /noPrompt /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.resolve('itemSpec').auto('resolution').preview.override_type('overrideType').convert_to_type('convertType').recursive.new_name('path').no_prompt.login('username', 'password').login('username')
    end
  end

  def test_resolve_item_spec_is_optional
    expected = 'tf resolve'
    assert_each_tf_command expected do |tf|
      tf.resolve
    end
  end

  def test_rollback_to_version
    expected = 'tf rollback /toVersion:versionSpec itemSpec /recursive /lock:lockType /version:versionSpec /keepMergeHistory /login:username,password /login:username /noPrompt'
    actual = team_foundation_100.rollback_to_version('versionSpec', 'itemSpec').recursive.lock('lockType').version('versionSpec').keep_merge_history.login('username', 'password').login('username').no_prompt
    assert_command expected, actual
  end

  def test_rollback_changeset
    expected = 'tf rollback /changeset:changesetFrom~changesetTo itemSpec /recursive /lock:lockType /version:versionSpec /keepMergeHistory /login:username,password /login:username /noPrompt'
    actual = team_foundation_100.rollback_changeset('changesetFrom', 'changesetTo', 'itemSpec').recursive.lock('lockType').version('versionSpec').keep_merge_history.login('username', 'password').login('username').no_prompt
    assert_command expected, actual
  end

  def test_rollback_changeset_changeset_to_is_optional
    expected = 'tf rollback /changeset:changesetFrom'
    actual = team_foundation_100.rollback_changeset('changesetFrom')
    assert_command expected, actual
  end

  def test_rollback_changeset_item_spec_is_optional
    expected = 'tf rollback /changeset:changesetFrom~changesetTo'
    actual = team_foundation_100.rollback_changeset('changesetFrom', 'changesetTo')
    assert_command expected, actual
  end

  def test_replace_shelveset
    expected = 'tf shelve /replace shelvesetName /comment:comment /validate /noPrompt /login:username,password /login:username /noPrompt'
    assert_each_tf_command expected do |tf|
      tf.replace_shelveset('shelvesetName').comment('comment').validate.no_prompt.login('username', 'password').login('username').no_prompt
    end
  end

  def test_shelve
    expected = 'tf shelve shelvesetName itemSpec /move /replace /comment:comment /recursive /validate /noPrompt /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.shelve('shelvesetName', 'itemSpec').move.replace.comment('comment').recursive.validate.no_prompt.login('username', 'password').login('username')
    end
  end

  def test_delete_shelveset
    expected = 'tf shelve /delete shelvesetName;shelvesetOwner /login:username,password /login:username /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.delete_shelveset('shelvesetName', 'shelvesetOwner').login('username', 'password').login('username').collection('teamProjectCollectionUrl')
    end
  end

  def test_delete_shelveset_owner_is_optional
    expected = 'tf shelve /delete shelvesetName'
    assert_each_tf_command expected do |tf|
      tf.delete_shelveset('shelvesetName')
    end
  end

  def test_shelvesets
    expected = 'tf shelvesets shelvesetName /owner:ownerName /format:format /collection:teamProjectCollectionUrl /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.shelvesets('shelvesetName').owner('ownerName').format('format').collection('teamProjectCollectionUrl').login('username', 'password').login('username')
    end
  end

  def test_shelvesets_shelveset_name_is_optional
    expected = 'tf shelvesets'
    assert_each_tf_command expected do |tf|
      tf.shelvesets
    end
  end

  def test_status
    expected = 'tf status itemSpec /collection:teamProjectCollectionUrl /login:username,password /login:username /workspace:workspaceName;workspaceOwner /workspace:workspaceName /shelveset:shelvesetName;shelvesetOwner /shelveset:shelvesetName /format:format /recursive /user:userName'
    assert_each_tf_command expected do |tf|
      tf.status('itemSpec').collection('teamProjectCollectionUrl').login('username', 'password').login('username').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName').shelveset('shelvesetName', 'shelvesetOwner').shelveset('shelvesetName').format('format').recursive.user('userName')
    end
  end

  def test_undelete
    expected = 'tf undelete itemSpec;deletionId /noGet /lock:lockType /recursive /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.undelete('itemSpec', 'deletionId').no_get.lock('lockType').recursive.login('username', 'password').login('username')
    end
  end

  def test_undelete_deletion_id_is_optional
    expected = 'tf undelete itemSpec'
    assert_each_tf_command expected do |tf|
      tf.undelete('itemSpec')
    end
  end

  def test_undo
    expected = 'tf undo itemSpec /workspace:workspaceName;workspaceOwner /workspace:workspaceName /recursive /noPrompt /login:username,password /login:username /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.undo('itemSpec').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName').recursive.no_prompt.login('username', 'password').login('username').collection('teamProjectCollectionUrl')
    end
  end

  def test_unlabel
    expected = 'tf unlabel labelName itemSpec /collection:teamProjectCollectionUrl /recursive /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.unlabel('labelName', 'itemSpec').collection('teamProjectCollectionUrl').recursive.login('username', 'password').login('username')
    end
  end

  def test_unshelve
    expected = 'tf unshelve shelvesetName;userName itemSpec /move /recursive /noPrompt /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.unshelve('shelvesetName', 'userName', 'itemSpec').move.recursive.no_prompt.login('username', 'password').login('username')
    end
  end

  def test_unshelve_item_spec_is_optional
    expected = 'tf unshelve shelvesetName;userName'
    assert_each_tf_command expected do |tf|
      tf.unshelve('shelvesetName', 'userName')
    end
  end

  def test_unshelve_username_is_optional
    expected = 'tf unshelve shelvesetName'
    assert_each_tf_command expected do |tf|
      tf.unshelve('shelvesetName')
    end
  end

  def test_view
    expected = 'tf view itemSpec /collection:teamProjectCollectionUrl /console /recursive /output:localFile /shelveset:shelvesetName;shelvesetOwner /shelveset:shelvesetName /noPrompt /version:versionSpec /login:username,password /login:username'
    actual = team_foundation_100.view('itemSpec').collection('teamProjectCollectionUrl').console.recursive.output('localFile').shelveset('shelvesetName', 'shelvesetOwner').shelveset('shelvesetName').no_prompt.version('versionSpec').login('username', 'password').login('username')
    assert_command expected, actual
  end

  def test_show_local_folder_mapping
    expected = 'tf workfold localFolder /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.show_local_folder_mapping('localFolder').login('username', 'password').login('username')
    end
  end

  def test_show_workspace_mappings
    expected = 'tf workfold /workspace:workspaceName /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.show_workspace_mappings('workspaceName').login('username', 'password').login('username')
    end
  end

  def test_show_server_folder_mappings
    expected = 'tf workfold serverFolder /login:username,password /login:username /workspace:workspaceName;workspaceOwner /workspace:workspaceName /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.show_server_folder_mappings('serverFolder').login('username', 'password').login('username').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName').collection('teamProjectCollectionUrl')
    end
  end

  def test_map_folder
    expected = 'tf workfold /map serverFolder localFolder /login:username,password /login:username /workspace:workspaceName;workspaceOwner /workspace:workspaceName /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.map_folder('serverFolder', 'localFolder').login('username', 'password').login('username').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName').collection('teamProjectCollectionUrl')
    end
  end

  def test_unmap_folder
    expected = 'tf workfold /unmap /login:username,password /login:username /workspace:workspaceName;workspaceOwner /workspace:workspaceName /collection:teamProjectCollectionUrl /recursive'
    assert_each_tf_command expected do |tf|
      tf.unmap_folder.login('username', 'password').login('username').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName').collection('teamProjectCollectionUrl').recursive
    end
  end

  def test_cloak_folder
    expected = 'tf workfold /cloak serverFolder /login:username,password /login:username /workspace:workspaceName;workspaceOwner /workspace:workspaceName /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.cloak_folder('serverFolder').login('username', 'password').login('username').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName').collection('teamProjectCollectionUrl')
    end
  end

  def test_decloak_folder
    expected = 'tf workfold /decloak serverFolder /login:username,password /login:username /workspace:workspaceName;workspaceOwner /workspace:workspaceName /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.decloak_folder('serverFolder').login('username', 'password').login('username').workspace('workspaceName', 'workspaceOwner').workspace('workspaceName').collection('teamProjectCollectionUrl')
    end
  end

  def test_create_workspace
    expected = 'tf workspace /new workspaceName;workspaceOwner /noPrompt /template:workspaceName;workspaceOwner /template:workspaceName /computer:computerName /comment:comment /collection:teamProjectCollectionUrl /permission:permission /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.create_workspace('workspaceName', 'workspaceOwner').no_prompt.template('workspaceName', 'workspaceOwner').template('workspaceName').computer('computerName').comment('comment').collection('teamProjectCollectionUrl').permission('permission').login('username', 'password').login('username')
    end
  end

  def test_create_workspace_workspace_owner_is_optional
    expected = 'tf workspace /new workspaceName'
    assert_each_tf_command expected do |tf|
      tf.create_workspace('workspaceName')
    end
  end

  def test_delete_workspace
    expected = 'tf workspace /delete workspaceName;workspaceOwner /collection:teamProjectCollectionUrl /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.delete_workspace('workspaceName', 'workspaceOwner').collection('teamProjectCollectionUrl').login('username', 'password').login('username')
    end
  end

  def test_delete_workspace_workspace_owner_is_optional
    expected = 'tf workspace /delete workspaceName'
    assert_each_tf_command expected do |tf|
      tf.delete_workspace('workspaceName')
    end
  end

  def test_modify_workspace
    expected = 'tf workspace workspaceName;workspaceOwner /computer:computerName /comment:comment /collection:teamProjectCollectionUrl /permission:permission /login:username,password /login:username /newName:workspaceName /newOwner:ownerName'
    assert_each_tf_command expected do |tf|
      tf.modify_workspace('workspaceName', 'workspaceOwner').computer('computerName').comment('comment').collection('teamProjectCollectionUrl').permission('permission').login('username', 'password').login('username').new_name('workspaceName').new_owner('ownerName')
    end
  end

  def test_modify_workspace_workspace_owner_is_optional
    expected = 'tf workspace workspaceName'
    assert_each_tf_command expected do |tf|
      tf.modify_workspace('workspaceName')
    end
  end

  def test_modify_workspace_workspace_name_is_optional
    expected = 'tf workspace'
    assert_each_tf_command expected do |tf|
      tf.modify_workspace
    end
  end

  def test_workspaces
    expected = 'tf workspaces workspaceName /owner:ownerName /computer:computerName /collection:teamProjectCollectionUrl /format:format /updateUserName:oldUserName /updateComputerName:oldComputerName /login:username,password /login:username'
    assert_each_tf_command expected do |tf|
      tf.workspaces('workspaceName').owner('ownerName').computer('computerName').collection('teamProjectCollectionUrl').format('format').update_user_name('oldUserName').update_computer_name('oldComputerName').login('username', 'password').login('username')
    end
  end

  def test_workspaces_workspace_name_is_optional
    expected = 'tf workspaces'
    assert_each_tf_command expected do |tf|
      tf.workspaces
    end
  end

  def test_remove_workspaces
    expected = 'tf workspaces /remove:workspaceName1,workspaceName2 /collection:teamProjectCollectionUrl'
    assert_each_tf_command expected do |tf|
      tf.remove_workspace(%w(workspaceName1 workspaceName2)).collection('teamProjectCollectionUrl')
    end
  end

end