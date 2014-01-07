<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="WebPartPageExpansion" content="full" />
<title>Test</title>
<link type="text/css" rel="stylesheet" href="test.css" />
<link type="text/css" rel="stylesheet" href="smoothness-jquery-ui.min.css" />
<script src='//ajax.aspnetcdn.com/ajax/4.0/1/MicrosoftAjax.js' type="text/javascript" ></script>
<script src='/_layouts/15/init.js' type="text/javascript"></script>
<script src='jquery-1.8.2.min.js' type="text/javascript"></script>
<script src='jquery-ui.min.js' type="text/javascript"></script>
<script src='jquery.SPServices-0.7.2.min.js' type="text/javascript"></script>
<script src='/_layouts/15/SP.RequestExecutor.js' type="text/javascript"></script>
<script src='/_layouts/15/SP.Runtime.js' type="text/javascript"></script>
<script src='/_layouts/15/SP.js' type="text/javascript"></script>
<script src='/_layouts/15/SP.Taxonomy.js' type="text/javascript"></script>
<script type="text/javascript" src="/_layouts/15/SP.DocumentManagement.js"></script>
<script type="text/javascript" src="jquery-ui-combobox.js"></script>
<script src='test.js' type="text/javascript"></script>
</head>

<body>
	<div id="bg"></div>
	<div class="ui-corner-all" id="wrapper">
		<h2>Upload Document(s)</h2>
		<div id="form_error" class="error_msg"></div>
		<div id="upload_selection">
				<div id="doc" class="file_icon ui-corner-all"><img src="images/single_document.png" id="single_icon" alt="Single File Upload" /><br />Single File</div>
				<div id="set" class="file_icon ui-corner-all"><img src="images/multi_document.png" id="multi_icon" alt="Multi File Upload" /><br />Multiple Files</div>
		</div>
		<div id="fields_table_wrapper">
			<table id="fields_table">
				<tr class="doc"><th class="field">File</td><td class="value"><input class="ui-widget ui-widget-content ui-state-default ui-corner-all" id="doc_file" type="file" /><div class="error_msg" id="doc_error">A file is required to upload.</div></td></tr>
				<tr class="set"><th class="field">Files</td><td class="value"><input class="ui-widget ui-widget-content ui-state-default ui-corner-all" id="set_file" type="file" multiple /><div class="error_msg" id="set_error">At least two files are required for a multiple file upload.</div></td></tr>
				<tr class="doc"><th class="field">Title</td><td class="value"><textarea class="ui-widget ui-widget-content ui-state-default ui-corner-all" id="doc_title" maxlength="255" rows="3" cols="50"></textarea></td></tr>
				<tr class="set"><th class="field">Name</td><td class="value"><input class="ui-widget ui-widget-content ui-state-default ui-corner-all" id="set_name" type="text" maxlength="255" /></td></tr>
				<tr class="set"><th class="field">Description</td><td class="value"><textarea class="ui-widget ui-widget-content ui-state-default ui-corner-all" id="set_description" rows="5" cols="50"></textarea></td></tr>
				<tr class="doc set"><th class="field">Doc Date</td><td class="value"><input class="ui-widget ui-widget-content ui-state-default ui-corner-all" type="text" maxlength="10" id="date_select" /><div class="error_msg" id="date_error">Please enter date in mm/dd/yyyy format.</div></td></tr>
				<tr class="doc set"><th class="field">Author</td><td class="value">Authors:<ul id="author_list"></ul><div id="author_wrapper" class="ui-widget"><select id="author"></select></div><input id="add_author" type="button" value="Add"></td></tr>
				<tr class="doc set"><th class="field">Document Type</td><td class="value"><div class="ui-widget"><select id="documentType"></select></div></td></tr>
				<tr class="doc set"><th class="field">IPL Project Code</td><td class="value"><div class="ui-widget"><select id="projectCode"></select></div></td></tr>
				<tr class="doc set"><th class="field">Contract ID</td><td class="value"><div class="ui-widget"><select id="contractId"></select></div></td></tr>
				<tr class="doc set"><th class="field">Work Order</td><td class="value"><div class="ui-widget"><select id="workOrder"></select></div></td></tr>
				<tr class="doc set"><th class="field">Maximo Location</td><td class="value"><div class="ui-widget"><select id="M_Location"></select></div></td></tr>
				<tr class="doc set"><th class="field">Maximo Asset</td><td class="value"><div class="ui-widget"><select id="M_Asset"></select></div></td></tr>
				<tr class="doc set"><th class="field">Bid Package</td><td class="value"><div class="ui-widget"><select id="bidPkg"></select></div></td></tr>
				<tr class="doc set"><th class="field"></td><td class="value"><input id="add_record" type="button" value="Add Record" /></td></tr>
			</table>
		</div>
	</div>
</body>
</html>
