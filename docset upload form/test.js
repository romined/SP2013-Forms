var MAX_SIMULTANEOUS_UPLOADS = 3;

var baseUrl = "https://iplnet3.iplsharepoint.com"; //Base site URL, do not include slash
var formDigestValue; //Used as SharePoint security mechanism - anti-playback attack
var docContentType = "0x01010012C72C3D6D1923448E53AEB5F638EF5800E196DD1CBCB6604E80B38EC85ABC8378002DCC10D74049C64EB7ACE9DA4884351C"; //Used for searche queries
var docSetContentType = "0x0120D52000445F5FE85E5A0549BDA729C0B0D3D78C00A8C7B1D3201CA84EA7A52E7F9954E7B5"; //Used for search queries
var setContentType = "0x0120D520"; //used for adding docset to LineJSubmit list

$(document).ready(function () {
	//Get form digest for xdigest request
	var executor = new SP.RequestExecutor(baseUrl);
	executor.executeAsync({
		async: false,
		url: baseUrl + "/sites/linej/_api/contextinfo",
		method: "POST",
		headers: { "Accept": "application/json; odata=verbose" },
		success: function (data) {
			var jsonObject = JSON.parse(data.body);
			formDigestValue = jsonObject.d.GetContextWebInformation.FormDigestValue;
		},
		error: function (data, errorCode, errorMessage) {
			var errMsg = "Error retrieving the form digest value: " + errorMessage;
			$("#form_error").show('slow').text(errMsg);
			return;
		}
	});

	//Fill selects
	populateManagedMetadata();
	
	//Setup datepicker
	$('#date_select').datepicker({
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		yearRange: "-100:+0"
	}).blur(validateDate);
	
	//Setup behavior for selection of single or multiple file
	$('.file_icon').click(function() {
		$('.file_icon').not(this).hide('explode', 1000);
		var e_id = $(this).attr('id'); //ID matches class that should be displayed
		$('.' + e_id).show();
		$('.' + e_id + ':odd').addClass("alt_row");
		$('#fields_table_wrapper').show({
			effect: 'blind',
			easing: 'easeOutExpo',
			duration: 2000
		});
	});
	
	//Setup add author functionality
	$('#add_author').click(addAuthor);
	
	//Setup Add Record button functionality
	$('#add_record').click(addRecord);
	
	//Rig up all comboboxes with the nice jquery UI effect.
	$('select').combobox();
	
	//Check if browser supports FileReader. This is a very rudimentary check to see if it is compatible with HTML5
	if (!FileReader) {
		$('#form_error').text('This browser does not support HTML5. Please use a modern browser (IE10, latest Firefox, Chrome or equivalent)').show('slow');
	}
});

function addAuthor() {
	//Includes author in the selected author list.
	var author_select = $('#author');
	var guid = author_select.val();
	var selected_option = $('#author option:selected');
	var author_name = selected_option.text();
	
	if (guid) {
		$('#author_list').append('<li class="selected_author" name="' + guid + '"><div class="delete_author" onclick="removeAuthor(this);" alt=""></div>' + author_name + '</li>');
		selected_option.remove();
		author_select.val(''); //remove value from hidden combobox
		$('#author_wrapper .ui-autocomplete-input').val('').focus(); //Set cursor back on the author select input and empty it.
	}
}

function addRecord() {
	//This function is the main function for adding new records, and will:
	//1) Error check
	//2) Generate overlay
	//3) Call uploadRecord which creates the actual container (if docset) and uploads the file(s)
	//4) Update metadata
	
	//Resolve if docset based on visibility of file icon
	var isDocset = ($('.file_icon:visible').attr('id') == "set");
	
	//Get the file element -- There's one for each type
	var file_elt = _get_file_elt(isDocset);
	
	//Establish min file count for upload type
	var minFiles = 1;
	if (isDocset){
		minFiles++;
	}

	//If not enough files, show the error
	var err_elt = (isDocset ? 'set_error' : 'doc_error');
	if (file_elt.files.length < minFiles) {
		$('#' + err_elt).show('slow');
	} else {
		$('#' + err_elt).hide('slow');
	}
	
	//Get all error objects -- displayed or not
	var errs = $('.error_msg');
	
	//promise in this context waits until animations are complete. Necessary since we base form errors on visibility of error msgs.
	errs.promise().done(function() { 
		errs = errs.filter(':visible'); //limit to just visible items
		if (errs.length > 0) { //Errors present?
			pulseRed(errs);
		} else {
			//Form appears valid, generate overlay and begin adding record
			generateOverlayProgress(isDocset);
			setTimeout(function(){ //make it pause a half second before continuing -- looks nicer on GUI.
				var promise = uploadRecord(isDocset);
				$.when(promise)
				.done(function(){ //Success - uploadRecord
					startProgressTicker('apply_metadata');
					$.when(updateMetadata(isDocset)).then(function(){ //success - updateMetadata
						finishProgressTicker('apply_metadata');
					}, function(errMsg) { //Failure -- updateMetadata
						failedProgressTicker('apply_metadata', errMsg);
					});
				})
				.fail(function(errMsg){ //Failure - uploadRecord
					failedProgressTicker('apply_metadata', 'Previous step failed.');
				})
				.always(function() {
					var pw = $('#progress_window');
					pw.append('<input id="continue_button" type="button" value="Continue" onclick="location.reload();" />');
					var scrollTo = $('#continue_button')[0].offsetTop;
					$('#progress_window').animate({scrollTo: scrollTo}, '500');
				});
			}, 500);
		}
	});
}

function generateOverlayProgress(isDocset) {
	$('body').append('<div id="overlay"></div>');
	$('body').append('<div class="ui-corner-all" id="progress_window"></div>');
	
	//Add a table with top row
	$('#progress_window').append('<table id="upload_table"><tr><th colspan="4" style="text-align: center; font-size: 2em;">Upload Progress</th></tr><tr><th>1</td><td>Initialize Record</td><td id="initialize_record_text"></td><td id="initialize_record"></td></tr>');
	
	var uploadTable = $('#upload_table');
	var rowCounter = 2;
	var file_elt = _get_file_elt(isDocset);
	var appendHTML = '';
	
	//Add table rows for file uploads
	for (var i = 0; i < file_elt.files.length; i++) {
		appendHTML += '<tr><th>' + rowCounter + '</th><td>Upload ' + file_elt.files[i].name + '</td><td id="upload_file' + i + '_text">Pending</td><td id="upload_file' + i + '"></tr>';
		rowCounter++;
	}
	
	//Add table row for metadata
	appendHTML += '<tr><th>' + rowCounter + '</th><td>Apply Metadata</td><td id="apply_metadata_text">Pending</td><td id="apply_metadata"></td></tr>';
	
	//Append all to table
	uploadTable.append(appendHTML);
	
	//Add progress tickers
	addProgressTicker($('#initialize_record')[0], 'initialize_record');
	for (var i = 0; i < file_elt.files.length; i++) {
		addProgressTicker($('#upload_file' + i)[0], 'upload_file' + i);
	}
	addProgressTicker($('#apply_metadata')[0], 'apply_metadata');
	
	//And start everything
	startProgressTicker('initialize_record');
	$('#overlay').fadeIn('250'); //Make overlay appear
	$('#progress_window').fadeIn('250'); //Make progress window appear
	$("html, body").animate({ scrollTop: 0 }, '250'); //Scroll to top
}

function uploadRecord(isDocset) {
	//Creates the docset container if its a docset, and uploads the files.
	var dfd = $.Deferred(); //Used for deferring until async calls are complete
	
	var folderName = (isDocset ? $('#set_name').val() : ""); //Get folder name, if any
	var promises = []; //Array for all promises -- allows us to wait until all processes finish.
	var file_elt = _get_file_elt(isDocset); //contains the actual DOM element for files

	if (isDocset) {
		//For docsets, we must make the set before uploading files
		var docsetPromise = createDocset(folderName);
		promises.push(docsetPromise);
		
		$.when(docsetPromise)
		.then(function(){
			//Success
		}, function(errMsg){
			//Fail
			dfd.reject(errMsg);
			return;
		});
	}

	//Fire only once all promises are finished and only if succeeded. If docset, then after docset finished. If not, then immediatelyish.
	$.when.apply($, promises).done(function(){ 
		promises = new Array(); //clear out promises
		finishProgressTicker('initialize_record');
		
		var filesQueue = [];
		for (var i = 0; i < file_elt.files.length; i++) {
			filesQueue.push(i);
		}
		
		var maxThreads = Math.min(MAX_SIMULTANEOUS_UPLOADS, filesQueue.length);
		for (var i = 0; i < maxThreads; i++) { //Push on a deferred object for each worker thread.
			promises.push(new $.Deferred());
		}
		
		for (var i = 0; i < maxThreads; i++) //start up # threads up to num of files
		{
			(function recursiveUpload(threadNumber) {
				var ui = filesQueue.shift(); //Remove leading element into ui (upload index)
				if (ui !== undefined) { //If queue was not empty
					var filePromise = uploadFile(file_elt.files[ui].name, file_elt.files[ui], folderName, ui);

					$.when(filePromise)
					.then(function(number){ //Success
						recursiveUpload(threadNumber); //Continue recursively to next one -- same worker thread.
					}, function(errMsg) { //Failure
						dfd.reject(errMsg);
						return;
					});
					promises.push(filePromise);
				} else { //popped an undefined, queue is empty
					promises[threadNumber].resolve(); //Resolve the worker's Deferred -- So that final piece will only fire after each thread ceases.
				}
			})(i); //Pass the worker number as threadNumber to our function closure.
		}

		//Wait for all uploads to finish.
		$.when.apply($, promises).done(function(){
			dfd.resolve("All files successfully uploaded.");
		});
	});
	
	return dfd.promise();
}

function createDocset(setName) {
	//Creates a docset container
	var dfd = new $.Deferred();
	
	var ctx = new SP.ClientContext.get_current(); 
	var parentFolder; 
	
	var web = ctx.get_web(); 
	var list = web.get_lists().getByTitle('LineJSubmit'); 
	ctx.load(list);
	
	parentFolder = list.get_rootFolder(); 
	ctx.load(parentFolder);
	
	var docsetContentType = web.get_contentTypes().getById(setContentType); 
	ctx.load(docsetContentType);
	
	ctx.executeQueryAsync(function () { //outer query succeeded
		var isCreated = SP.DocumentSet.DocumentSet.create(ctx, parentFolder, setName, docsetContentType.get_id()); 
		ctx.executeQueryAsync(
			function(data){ //inner query succeeded
				dfd.resolve("success");
			}, function(sender, args){ //inner query failed
				dfd.reject(args.get_message());
			});
	}, function(){ //outer query failed
		dfd.reject("Failed to load document library.");
	});
	
	return dfd.promise();
}

function uploadFile(filename, file, folderName, fileNumber) {
    //Responsible for uploading files, works for both sets and individual docs
    //File number refers to just the ordinal position from the file element, like 0, 1, 2...
    var dfd = $.Deferred();
    var reader = new FileReader();

	startProgressTicker('upload_file' + fileNumber);
			
	
    reader.onload = function (e) {
        var arrayBuffer = reader.result;

        $.ajax({
            url: baseUrl + "/sites/linej/_api/web/GetFolderByServerRelativeUrl('/sites/linej/LineJSubmit/" + folderName.replace("'", "''") + "')/Files/add(url='" + filename.replace("'", "''") + "',overwrite=false)",
			type: "POST",
			data: arrayBuffer,
			processData: false,
			headers: {
                "Accept": "application/json;odata=verbose",
                "X-RequestDigest": formDigestValue,
                "content-length": arrayBuffer.byteLength
            },
            success: function (data) {
				finishProgressTicker('upload_file' + fileNumber)
				dfd.resolve(fileNumber);
            },
            error: function (xhr, ajaxOptions, thrownError) {
            	var jsonMsg = JSON.parse(xhr.responseText);
            	var errMsg = jsonMsg.error.message.value;
				failedProgressTicker('upload_file' + fileNumber, errMsg)
		    	dfd.reject(errMsg);
            }
        });
    }
    reader.onerror = function (e) {
    	dfd.reject('An error occurred while reading the file ' + filename + '. Please try again.');
    }
    reader.readAsArrayBuffer(file);
    
    return dfd.promise();
}

function updateMetadata(isDocset) {
	//Updates metadata for a document that already exists.
	var dfd = $.Deferred();
	
	if (isDocset) {
		var setName = $('#set_name').val();
		var description = $('#set_description').val();
	} else { //doc
		var title = $('#doc_title').val();
		var fileElt = _get_file_elt(false);
		fileName = fileElt.files[0].name;
	}

	//shared properties
	var authors = new Array();
	$('.selected_author').each(function(){
		authors.push($(this).attr('name'));
	});
	var author = authors.join(';#'); //Format for collection: Wssid;#Label|guid  -- Separator: ;#
	
	var docDate = $('#date_select').val();
	if (docDate.length > 0) {
		docDate = docDate.substr(6) + "-" + docDate.substr(0,2) + "-" + docDate.substr(3,2) + "T00:00:00Z"; //REST requires this format
	}
	
	var documentType = $('#documentType').val();
	var iplProjectCode = $('#projectCode').val();
	var contractId = $('#contractId').val();
	var workOrder = $('#workOrder').val();
	var M_Location = $('#M_Location').val();
	var M_Asset = $('#M_Asset').val();
	var bidPkg = $('#bidPkg').val();

	var context = SP.ClientContext.get_current();
	var web = context.get_web();
	var lists = web.get_lists();
	var list = lists.getByTitle('LineJSubmit');
	
	var promise;
	
	if (isDocset) {
		promise = getDocSetIdByTitle(setName);
	} else {
		promise = getDocIdByFileName(fileName);
	}
	
	$.when(promise).then(function(itemId) { //ID lookup successful
		var item = list.getItemById(itemId);
		var fields = list.get_fields();
	    var taxSession = SP.Taxonomy.TaxonomySession.getTaxonomySession(context); 	//Current Taxonomy Session
	    var termStores = taxSession.get_termStores();								//Term Stores
	    var termStore = termStores.getById('ebb83991f3e5477c93518039d7c8db5b');		//ID of the Term Store from which to get the Terms.
	
		//Resolve author -- this one is special, only collection field
		if (author.length > 0) {
			var authorField = context.castTo(fields.getByInternalNameOrTitle("IPL_x0020_Author"), SP.Taxonomy.TaxonomyField);
			var authorFieldValueCollection = new SP.Taxonomy.TaxonomyFieldValueCollection(context, author, authorField);
			authorField.setFieldValueByValueCollection(item, authorFieldValueCollection);
			context.load(authorField);
		}
		
		//Resolve document type
		if (documentType.length > 0) {
		    var termSetDocumentType = termStore.getTermSet("8396adc4-caab-4a81-b94d-d9ee773787a8");
			var documentTypeField = context.castTo(fields.getByInternalNameOrTitle("IPL_x0020_Document_x0020_Type"), SP.Taxonomy.TaxonomyField);
			var documentTypeSelectedTerm = termSetDocumentType.getTerm(documentType);
			documentTypeField.setFieldValueByTerm(item, documentTypeSelectedTerm);
			context.load(documentTypeField);
		}
		
		//Resolve bid pkg
		if (bidPkg.length > 0) {
		    var termSetBidPkg = termStore.getTermSet("0f3c7b02-89f1-495d-b45f-6fdb2814dd6e");
			var bidPkgField = context.castTo(fields.getByInternalNameOrTitle("BidPkg"), SP.Taxonomy.TaxonomyField);
			var bidPkgSelectedTerm = termSetBidPkg.getTerm(bidPkg);
			bidPkgField.setFieldValueByTerm(item, bidPkgSelectedTerm);
			context.load(bidPkgField);
		}
		
		//Resolve contract id
		if (contractId.length > 0) {
		    var termSetContractId = termStore.getTermSet("0ce8d1aa-bc4f-433a-be63-d94a8dae4387");
			var contractIdField = context.castTo(fields.getByInternalNameOrTitle("Contract_x0020_ID"), SP.Taxonomy.TaxonomyField);
			var contractIdSelectedTerm = termSetContractId.getTerm(contractId);
			contractIdField.setFieldValueByTerm(item, contractIdSelectedTerm);
			context.load(contractIdField);
		}
		
		//Resolve M_Asset
		if (M_Asset.length > 0) {
		    var termSetM_Asset = termStore.getTermSet("e234a8f0-f645-4cb8-83f2-cee87c36544d");
			var MAssetField = context.castTo(fields.getByInternalNameOrTitle("M_Asset"), SP.Taxonomy.TaxonomyField);
			var MAssetSelectedTerm = termSetM_Asset.getTerm(M_Asset);
			MAssetField.setFieldValueByTerm(item, MAssetSelectedTerm);
			context.load(MAssetField);
		}
		
		//Resolve M_Location
		if (M_Location.length > 0) {
		    var termSetM_Location = termStore.getTermSet("e581c6ae-e789-4ad5-8ddc-a0c667714675");
			var MLocationField = context.castTo(fields.getByInternalNameOrTitle("M_Location"), SP.Taxonomy.TaxonomyField);
			var MLocationSelectedTerm = termSetM_Location.getTerm(M_Location);
			MLocationField.setFieldValueByTerm(item, MLocationSelectedTerm);
			context.load(MLocationField);
		}
		
		//Resolve work order
		if (workOrder.length > 0) {
		    var termSetWorkOrder = termStore.getTermSet("bcb47d09-68f5-499e-bebf-19b900141856");
			var workOrderField = context.castTo(fields.getByInternalNameOrTitle("Work_x0020_Order"), SP.Taxonomy.TaxonomyField);
			var workOrderSelectedTerm = termSetWorkOrder.getTerm(workOrder);
			workOrderField.setFieldValueByTerm(item, workOrderSelectedTerm);
			context.load(workOrderField);
		}
		
		//Resolve project code
		if (iplProjectCode.length > 0) {
			item.set_item('IPL_Project_Code', iplProjectCode);
		}
		
		//Resolve document date
		if (docDate.length > 0) {
			item.set_item('IPL_x0020_Doc_x0020_Date', docDate);
		}
		
		//Resolve fields specific to sets or individual docs
		if (isDocset) {
			//Resolve description
			if (description.length > 0) {
				item.set_item('DocumentSetDescription', description);
			}
		} else {
			//Resolve title
			if (title.length > 0) {
				item.set_item('Title', title);
			}
		}
		
		item.update();
		context.load(item);

		context.executeQueryAsync(function() { //Success
			dfd.resolve("Successfully updated metadata.")
		}, function(sender, args){ //Fail
			dfd.reject(args.get_message());
		});
	}, function(reason) { //ID lookup failed
		dfd.reject(reason);
	});
	
	return dfd.promise();
}

function _get_file_elt(isDocset) {
	//supporting function, gets the file element
	var file_input_name = (isDocset ? 'set_file' : 'doc_file');
	return $('#' + file_input_name)[0];
}

function removeAuthor(elt) {
	//Deselects author from list
	var parent = $(elt).parent();
	var author_name = elt.nextSibling.nodeValue.trim();
	var guid = parent.attr('name');
	var insertText = '<option value="' + guid + '">' + author_name + '</option>';

	parent.remove(); //Zonk list item
	
	//Cycle through the select until we find the alphabetic position
	found = false;
	$('#author option').not(':first-child').each(function(){
		if (this.text.toUpperCase() > author_name.toUpperCase()) { //check alphanumeric equality
			$(insertText).insertBefore(this); //add it back in
			found = true;
			return false; //discontinue the closure loop.
		}
	});
	if (!found) { //This was the last item in the list.
		$('#author').append(insertText);
	}
}

function validateDate() {
	//Validate fields on page
	var error = false;
	var ds = $('#date_select');
	var ds_val = ds.val().trim();
	
	if (ds_val.length != 0) {
		var parts = ds_val.split('/');
		if (parts.length != 3) {
			error = true;
		} else {
			parts[0] = _pad(parts[0], 2);
			parts[1] = _pad(parts[1], 2);
			parts[2] = _pad(parts[2], 4);
			
			if (parts[0] == "00" || parts[1] == "00" || parts[2].substr(0,1) == "0") {
				error = true;
			}
		}
	}
	
	if (error) {
		$('#date_error').show('slow');
	} else {
		$('#date_error').hide('slow');
		if (ds_val.length != 0) {
			ds.val(parts[0] + "/" + parts[1] + "/" + parts[2]);
		}
	}
}

function _pad(number, max_length) { 
    //Supporter function for date string -- Takes a number like 1 and pads it with 0s up to max length
    //invalid input will result in all 0's.
    var str = String(number);

    if (str.length > max_length || isNaN(str)) {
    	str = "";
    }
    
    while (str.length < max_length) {
    	str = "0" + str;
    }
    
    return str;
}

function populateManagedMetadata(executor) {
    //Looks up all managed metadata fields and populates the selects
    var context = SP.ClientContext.get_current();								//Current Context
    var taxSession = SP.Taxonomy.TaxonomySession.getTaxonomySession(context); 	//Current Taxonomy Session
    var termStores = taxSession.get_termStores();								//Term Stores
    var termStore = termStores.getById('ebb83991f3e5477c93518039d7c8db5b');		//ID of the Term Store from which to get the Terms.
    
    var termSetAuthor 		= termStore.getTermSet("a815faea-1e56-4866-81a2-311c505379d2");	//GUID of Term Set from which to get the Terms.
    var termSetDocumentType = termStore.getTermSet("8396adc4-caab-4a81-b94d-d9ee773787a8");
    var termSetProjectCode 	= termStore.getTermSet("e884a687-f8eb-4de1-b91c-ad94daac0189");
    var termSetBidPkg 		= termStore.getTermSet("0f3c7b02-89f1-495d-b45f-6fdb2814dd6e");
    var termSetContractId	= termStore.getTermSet("0ce8d1aa-bc4f-433a-be63-d94a8dae4387");
    var termSetM_Asset 		= termStore.getTermSet("e234a8f0-f645-4cb8-83f2-cee87c36544d");
    var termSetM_Location 	= termStore.getTermSet("e581c6ae-e789-4ad5-8ddc-a0c667714675");
    var termSetWorkOrder 	= termStore.getTermSet("bcb47d09-68f5-499e-bebf-19b900141856");

    var termsAuthor = termSetAuthor.getAllTerms();
    var termsDocumentType = termSetDocumentType.getAllTerms();
    var termsProjectCode = termSetProjectCode.getAllTerms();
    var termsBidPkg = termSetBidPkg.getAllTerms();
    var termsContractId = termSetContractId.getAllTerms();
    var termsM_Asset = termSetM_Asset.getAllTerms();
    var termsM_Location = termSetM_Location.getAllTerms();
    var termsWorkOrder = termSetWorkOrder.getAllTerms();

    context.load(termsAuthor);
	context.load(termsDocumentType);
	context.load(termsProjectCode);
	context.load(termsBidPkg);
	context.load(termsContractId);
	context.load(termsM_Asset);
	context.load(termsM_Location);
	context.load(termsWorkOrder);
	
    context.executeQueryAsync(function(){
	  	var currentTerm;
	  	
	  	var authorTermEnumerator = termsAuthor.getEnumerator();	
		var documentTypeTermEnumerator = termsDocumentType.getEnumerator();
		var projectCodeTermEnumerator = termsProjectCode.getEnumerator();
		var bidPkgTermEnumerator = termsBidPkg.getEnumerator();
		var contractIdTermEnumerator = termsContractId.getEnumerator();
		var M_AssetTermEnumerator = termsM_Asset.getEnumerator();
		var M_LocationTermEnumerator = termsM_Location.getEnumerator();
		var workOrderTermEnumerator = termsWorkOrder.getEnumerator();
		
		var authorHTML = '<option value="">- SELECT -</option>';
		var documentTypeHTML = '<option value="">- SELECT -</option>';
		var projectCodeHTML = '<option value="">- SELECT -</option>';
		var bidPkgHTML = '<option value="">- SELECT -</option>';
		var contractIdHTML = '<option value="">- SELECT -</option>';
		var M_AssetHTML = '<option value="">- SELECT -</option>';
		var M_LocationHTML = '<option value="">- SELECT -</option>';
		var workOrderHTML = '<option value="">- SELECT -</option>';

		while(authorTermEnumerator.moveNext()){
			currentTerm = authorTermEnumerator.get_current();
			//special format for collections: Wssid;#Label|guid, later list separated by ;#
			//Wssid can just be made up -- Using -1 here. Internally, a term may or may not have a WSSID at insertion time.
			authorHTML += '<option value="-1;#' + currentTerm.get_name() + "|" + currentTerm.get_id() + '">' + currentTerm.get_name() + '</option>'; 
		}
		while (documentTypeTermEnumerator.moveNext()){
			currentTerm = documentTypeTermEnumerator.get_current();
			documentTypeHTML += '<option value="' + currentTerm.get_id() + '">' + currentTerm.get_name() + '</option>';
		}
		while (projectCodeTermEnumerator.moveNext()){
			currentTerm = projectCodeTermEnumerator.get_current();
			projectCodeHTML += '<option value="' + currentTerm.get_name() + '">' + currentTerm.get_name() + '</option>'; //This one is special: The input value is the same as the name
		}
		while (bidPkgTermEnumerator.moveNext()){
			currentTerm = bidPkgTermEnumerator.get_current();
			bidPkgHTML += '<option value="' + currentTerm.get_id() + '">' + currentTerm.get_name() + '</option>';
		}
		while (contractIdTermEnumerator.moveNext()){
			currentTerm = contractIdTermEnumerator.get_current();
			contractIdHTML += '<option value="' + currentTerm.get_id() + '">' + currentTerm.get_name() + '</option>';
		}
		while (M_AssetTermEnumerator.moveNext()){
			currentTerm = M_AssetTermEnumerator.get_current();
			M_AssetHTML += '<option value="' + currentTerm.get_id() + '">' + currentTerm.get_name() + '</option>';
		}
		while (M_LocationTermEnumerator.moveNext()){
			currentTerm = M_LocationTermEnumerator.get_current();
			M_LocationHTML += '<option value="' + currentTerm.get_id() + '">' + currentTerm.get_name() + '</option>';
		}
		while (workOrderTermEnumerator.moveNext()){
			currentTerm = workOrderTermEnumerator.get_current();
			workOrderHTML += '<option value="' + currentTerm.get_id() + '">' + currentTerm.get_name() + '</option>';
		}

		$('#author').append(authorHTML);
		$('#documentType').append(documentTypeHTML);
		$('#projectCode').append(projectCodeHTML);
		$('#bidPkg').append(bidPkgHTML);
		$('#contractId').append(contractIdHTML);
		$('#M_Asset').append(M_AssetHTML);
		$('#M_Location').append(M_LocationHTML);
		$('#workOrder').append(workOrderHTML);
    });
}

function getDocSetIdByTitle(setTitle) {
	//Retrieves a doc set's ID based on its title (set name)
	var dfd = $.Deferred();
	
	var getUri = baseUrl + "/sites/linej/_api/web/lists/GetByTitle('LineJSubmit')/items?$orderby=Created%20desc&$select=Id&$filter=ContentTypeId%20eq%20'" + docSetContentType + "'%20and%20Title%20eq%20'" + setTitle.replace("'", "''") + "'";
	var executor = new SP.RequestExecutor(baseUrl);
	executor.executeAsync({
		url: getUri,
		method: "GET",
		headers: { "Accept": "application/json;odata=verbose" },
		success: function (data) {
			var jsonObject = JSON.parse(data.body);
			dfd.resolve(jsonObject.d.results[0].Id);
		},
		error: function (data, errorCode, errorMessage) {
			var jsonObject = JSON.parse(data.body);
			dfd.reject(jsonObject.error.message.value);
		}
	});
	
	return dfd.promise();
}

function getDocIdByFileName(fileName) {
	//Retrieves a document's ID based on its file name.
	var dfd = $.Deferred();
	
	//Get a list of items with their file info, ordered by create date descending, of content type document.
	//As far as I can tell there's no way to just select the file name or filter it so that has to be iterated through.
	var getUri = baseUrl + "/sites/linej/_api/web/lists/GetByTitle('LineJSubmit')/items?$orderby=Created%20desc&$expand=File&$filter=ContentTypeId%20eq%20'" + docContentType + "'";
	
	var executor = new SP.RequestExecutor(baseUrl);
	executor.executeAsync({
		url: getUri,
		method: "GET",
		headers: { "Accept": "application/json;odata=verbose" },
		success: function (data) {
			var jsonObject = JSON.parse(data.body);
			var results = jsonObject.d.results;
			
			//Iterate through returned objects looking for a result that has a matching file name. Since two files can have the same name, the created date sort should catch the newest one. Infinitesimal concurrency issue here.
			for (var i = 0; i < results.length; i++) {
				if (results[i].File.Name == fileName) {
					dfd.resolve(results[i].ID);
					break;
				}
			}
			
			if (dfd.state() === 'pending') { //Never resolved, so not found.
				dfd.reject("Unable to locate file while retrieving ID.");
			}
		},
		error: function (data, errorCode, errorMessage) {
			var jsonObject = JSON.parse(data.body);
			dfd.reject(jsonObject.error.message.value);
		}
	});
	
	return dfd.promise();
}

/*********************************************************************************
 *************************** VISUAL/GUI FUNCTIONS ********************************
 *********************************************************************************/

function pulseRed(objs) {
	//Pulse red twice -- pass in jQuery object array
	objs.addClass('redlight', 500, function() {
		objs.removeClass('redlight', 500, function() {
			objs.addClass('redlight', 500, function() {
				objs.removeClass('redlight', 500);
			});
		});
	});	
}

function addProgressTicker(elt, newTickerId) {
	//Turn a passed in elt into a progress ticker. pass in JS obj elt and the desired name of the ticker (will have _ticker appended on its own).
	
	if (!newTickerId) {
		console.log("Illegal add progress ticker request: no newTickerId");
		return;
	} else if (jQuery('#' + newTickerId + "_ticker").length > 0) {
		console.log("Illegal add progress ticker request: newTickerId " + newTickerId + " not unique")
		return;
	}
	
	$(elt).append('<div class="ui-round-all ticker" id="' + newTickerId + '_ticker"></div>');
	
	var ticker = $('#' + newTickerId + '_ticker');
	
	var leftPos;
	for (var i = 0; i < 5; i++) {
		leftPos = 20 * i; //Total width: 100px
		ticker.append('<div class="ticker_circle inactive" id="' + newTickerId + '_ticker_circle' + i + '" style="left: ' + leftPos + 'px"></div>')
	}
}

function startProgressTicker(tickerId) {
	$('#' + tickerId + '_ticker .ticker_circle').removeClass('inactive');
	$('#' + tickerId + '_text').text('In Progress');
	setTimeout(function(){ updateProgressTicker(tickerId + '_ticker_circle', 0); }, 0);
}

function finishProgressTicker(tickerId) {
	$('#' + tickerId + '_ticker .ticker_circle').stop(true, true).attr('class', 'ticker_circle complete');
	$('#' + tickerId + '_text').text('Complete');
}

function failedProgressTicker(tickerId, message) {
	$('#' + tickerId + '_ticker .ticker_circle').stop(true, true).attr('class', 'ticker_circle error');
	$('#' + tickerId + '_text').text(message);
}

function updateProgressTicker(circleId, num) {
	//Continue a cycle of progress ticks until the actual progress element is removed.
	var circleFullId = circleId + num;
	var circle = $('#' + circleFullId).not(".complete, .error, .inactive");


	if (circle.length > 0) {
		var nextNum = (num + 1) % 5;
		var delay = (nextNum === 0 ? 2250 : 750);
		setTimeout (function(){ updateProgressTicker(circleId, nextNum); }, delay);
		$('#' + circleFullId).addClass('highlight', 1500, function() {
			$(this).removeClass('highlight', 750);
		});
	}
}