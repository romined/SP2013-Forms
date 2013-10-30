<%@ Page language="C#" MasterPageFile="~masterurl/default.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" meta:webpartpageexpansion="full"  %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePoint:ListFormPageTitle runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
	<span class="die">
		<SharePoint:ListProperty Property="LinkTitle" runat="server" id="ID_LinkTitle"/>
	</span>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageImage" runat="server">
	<img src="/_layouts/15/images/blank.gif?rev=23" width='1' height='1' alt="" />
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
	<ContentTemplate>
	<div style="padding-left:5px">
	</ContentTemplate>
</SharePoint:UIVersionedContent>
	<table class="ms-core-tableNoSpace" id="onetIDListForm">
	 <tr>
	  <td>
	 <WebPartPages:WebPartZone runat="server" FrameType="None" ID="Main" Title="loc:Main"><ZoneTemplate>
		<WebPartPages:DataFormWebPart runat="server" EnableOriginalValue="False" DisplayName="Request for Information" ViewFlag="1048584" ViewContentTypeId="" Default="FALSE" ListName="{FD5E7DDC-F127-458B-A2A8-9301DC940741}" ListId="fd5e7ddc-f127-458b-a2a8-9301dc940741" PageType="PAGE_NEWFORM" PageSize="-1" UseSQLDataSourcePaging="True" DataSourceID="" ShowWithSampleData="False" AsyncRefresh="False" ManualRefresh="False" AutoRefresh="False" AutoRefreshInterval="60" NoDefaultStyle="TRUE" InitialAsyncDataFetch="False" Title="Request for Information" FrameType="None" SuppressWebPartChrome="False" Description="" IsIncluded="True" PartOrder="2" FrameState="Normal" AllowRemove="True" AllowZoneChange="True" AllowMinimize="True" AllowConnect="True" AllowEdit="True" AllowHide="True" IsVisible="True" DetailLink="" HelpLink="" HelpMode="Modeless" Dir="Default" PartImageSmall="" MissingAssembly="Cannot import this Web Part." PartImageLarge="" IsIncludedFilter="" ExportControlledProperties="True" ConnectionID="00000000-0000-0000-0000-000000000000" ID="g_d9a92004_bfe4_4440_a6d7_575dd85d62d3" ChromeType="None" ExportMode="All" __MarkupType="vsattributemarkup" __WebPartId="{D9A92004-BFE4-4440-A6D7-575DD85D62D3}" __AllowXSLTEditing="true" WebPart="true" Height="" Width=""><DataSources>
<SharePoint:SPDataSource runat="server" DataSourceMode="ListItem" SelectCommand="&lt;View&gt;&lt;Query&gt;&lt;Where&gt;&lt;Eq&gt;&lt;FieldRef Name=&quot;ContentType&quot;/&gt;&lt;Value Type=&quot;Text&quot;&gt;RFI_Request&lt;/Value&gt;&lt;/Eq&gt;&lt;/Where&gt;&lt;/Query&gt;&lt;/View&gt;" UseInternalName="True" UseServerDataFormat="True"><SelectParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{FD5E7DDC-F127-458B-A2A8-9301DC940741}" Name="ListID"></WebPartPages:DataFormParameter>
			</SelectParameters><UpdateParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{FD5E7DDC-F127-458B-A2A8-9301DC940741}" Name="ListID"></WebPartPages:DataFormParameter>
			</UpdateParameters><InsertParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{FD5E7DDC-F127-458B-A2A8-9301DC940741}" Name="ListID"></WebPartPages:DataFormParameter>
			</InsertParameters><DeleteParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{FD5E7DDC-F127-458B-A2A8-9301DC940741}" Name="ListID"></WebPartPages:DataFormParameter>
			</DeleteParameters></SharePoint:SPDataSource>
</DataSources>
<Xsl>


<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:SharePoint="Microsoft.SharePoint.WebControls" xmlns:ddwrt2="urn:frontpage:internal">
	<xsl:output method="html" indent="no"/>
	<xsl:decimal-format NaN=""/>
	<xsl:param name="dvt_apos">'</xsl:param>
	<xsl:param name="ManualRefresh"></xsl:param>
	<xsl:variable name="dvt_1_automode">0</xsl:variable>
	<xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:SharePoint="Microsoft.SharePoint.WebControls">


		<xsl:choose>
			<xsl:when test="($ManualRefresh = 'True')">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					
					
					<tr>
						<td valign="top">
							<xsl:call-template name="dvt_1"/>
						</td>
						<td width="1%" class="ms-vb" valign="top">
							<img src="/_layouts/15/images/staticrefresh.gif" id="ManualRefresh" border="0" onclick="javascript: {ddwrt:GenFireServerEvent('__cancel')}" alt="Click here to refresh the dataview."/>
						</td>
						</tr>
					</table>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="dvt_1"/>
							</xsl:otherwise>
					</xsl:choose>
					</xsl:template>
	
					<xsl:template name="dvt_1">
						<xsl:variable name="dvt_StyleName">ListForm</xsl:variable>
					
					
						<xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row"/>
					
					
					<div>
						<span id="part1">
						<table border="0" width="100%">
							<xsl:call-template name="dvt_1.body">
								<xsl:with-param name="Rows" select="$Rows"/>
								
								
							</xsl:call-template>
						</table>
						</span>
						<SharePoint:AttachmentUpload runat="server" ControlMode="New"/>
						
						
						<SharePoint:ItemHiddenVersion runat="server" ControlMode="New"/>
						
						
					</div>
					</xsl:template>
					<xsl:template name="dvt_1.body">
						<xsl:param name="Rows"/>
					
					<tr>
						<td class="ms-toolbar" nowrap="nowrap">
						<SharePoint:FormToolBar runat="server" ControlMode="New"/>
						
						
						<SharePoint:ItemValidationFailedMessage runat="server" ControlMode="New"/>
						
						
						</td>
					</tr>
						<xsl:call-template name="dvt_1.rowedit"/>
							<tr>
								<td class="ms-toolbar" nowrap="nowrap">
								<table>
									<tr>
										<td width="99%" class="ms-toolbar" nowrap="nowrap"><IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/></td>
										
									
										<td class="ms-toolbar" nowrap="nowrap">
										
									
										<SharePoint:SaveButton runat="server" ControlMode="New" id="savebutton2"/>
										
									
										</td>
										<td class="ms-separator"> </td>
										
										<td class="ms-toolbar" nowrap="nowrap" align="right">
										
									
										<SharePoint:GoBackButton runat="server" ControlMode="New" id="gobackbutton2"/>
										
									
										</td>
									</tr>
								</table>
								</td>
							</tr>
							</xsl:template>
							<xsl:template name="dvt_1.rowedit">
								<xsl:param name="Pos" select="position()"/>
							<tr>
								<td>
								<table border="0" cellspacing="0" width="100%">
									
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
											<H3 class="ms-standardheader">
												<nobr>Submitted By</nobr>
											</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
											<H3 id="Submitted_By" class="ms-standardheader">
											</H3>
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
											<H3 class="ms-standardheader">
												<nobr>Project Number: <span id="ProjectNumber"></span></nobr>
											</H3>
										</td>
										<td width="190px" valign="top" class="ms-formlabel">
											<H3 class="ms-standardheader">
												<nobr>Contractor: <span id="Contractor"></span></nobr>
											</H3>
										</td>						
									</tr>	
									<tr>						
										<td width="190px" valign="top" class="ms-formlabel">
											<H3 class="ms-standardheader">
												<nobr>Designer: <span id="Designer"></span></nobr>
											</H3>
										</td>
										<td width="190px" valign="top" class="ms-formlabel">
											<H3 class="ms-standardheader">
												<nobr>IPL Project Code: <span id="IPL_Project_Code"></span></nobr>
											</H3>
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
									
										<H3 class="ms-standardheader">
										
										<nobr>Description<span class="ms-formvalidation"> *</span>
										</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
									
										<SharePoint:FormField runat="server" id="ff1{$Pos}" ControlMode="New" FieldName="Title" __designer:bind="{ddwrt:DataBind('i',concat('ff1',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Title')}"/>
										
									
										<SharePoint:FieldDescription runat="server" id="ff1description{$Pos}" FieldName="Title" ControlMode="New"/>
										
									
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
									
										<H3 class="ms-standardheader">
										
										<nobr>Specification</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
									
										<SharePoint:FormField runat="server" id="ff13{$Pos}" ControlMode="New" FieldName="RFI_Spec_Num" __designer:bind="{ddwrt:DataBind('i',concat('ff13',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@RFI_Spec_Num')}"/>
										
									
										<SharePoint:FieldDescription runat="server" id="ff13description{$Pos}" FieldName="RFI_Spec_Num" ControlMode="New"/>
										
									
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
									
										<H3 class="ms-standardheader">
										
										<nobr>Drawing Number</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
									
										<SharePoint:FormField runat="server" id="ff6{$Pos}" ControlMode="New" FieldName="RFI_Drawing_Num" __designer:bind="{ddwrt:DataBind('i',concat('ff6',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@RFI_Drawing_Num')}"/>
										
									
										<SharePoint:FieldDescription runat="server" id="ff6description{$Pos}" FieldName="RFI_Drawing_Num" ControlMode="New"/>
										
									
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
									
										<H3 class="ms-standardheader">
										
										<nobr>Detail Description</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
									
										<SharePoint:FormField runat="server" id="ff5{$Pos}" ControlMode="New" FieldName="RFI_Detail" __designer:bind="{ddwrt:DataBind('i',concat('ff5',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@RFI_Detail')}"/>
										
									
										<SharePoint:FieldDescription runat="server" id="ff5description{$Pos}" FieldName="RFI_Detail" ControlMode="New"/>
										
									
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
									
										<H3 class="ms-standardheader">
										
										<nobr>Request<span class="ms-formvalidation"> *</span></nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
									
										<SharePoint:FormField runat="server" id="ff10{$Pos}" ControlMode="New" FieldName="RFI_Request" __designer:bind="{ddwrt:DataBind('i',concat('ff10',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@RFI_Request')}"/>
										
									
										<SharePoint:FieldDescription runat="server" id="ff10description{$Pos}" FieldName="RFI_Request" ControlMode="New"/>
										
									
										</td>
									</tr>
								
									<tr id="idAttachmentsRow">
										<td nowrap="true" valign="top" class="ms-formlabel" width="20%">
										
									
										<SharePoint:FieldLabel ControlMode="New" FieldName="Attachments" runat="server"/>
										
									
										</td>
										<td valign="top" class="ms-formbody" width="80%">
										
									
										<SharePoint:FormField runat="server" id="AttachmentsField" ControlMode="New" FieldName="Attachments" __designer:bind="{ddwrt:DataBind('i','AttachmentsField','Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Attachments')}"/>
										
									
										<script>
          var elm = document.getElementById(&quot;idAttachmentsTable&quot;);
          if (elm == null || elm.rows.length == 0)
          document.getElementById(&quot;idAttachmentsRow&quot;).style.display=&apos;none&apos;;
        </script>
										</td>
									</tr>
									<xsl:if test="$dvt_1_automode = '1'" ddwrt:cf_ignore="1">
									
								
									<tr>
										<td colspan="99" class="ms-vb">
										
										<span ddwrt:amkeyfield="ID" ddwrt:amkeyvalue="ddwrt:EscapeDelims(string(@ID))" ddwrt:ammode="view"></span>
										
									
										</td>
									</tr>
									</xsl:if>
								</table>
								</td>
							</tr>
							</xsl:template>
							</xsl:stylesheet>	</Xsl>
<DataFields>@Title,Description;@RFI_Contract_ID,RFI_Contract_ID;@RFI_Contractor,RFI_Contractor;@RFI_Designer,RFI_Designer;@RFI_Detail,Detail;@RFI_Drawing_Num,Drawing_Num;@RFI_IPL_Project_Code,RFI_IPL_Project_Code;@RFI_Num,RFI_Num;@RFI_PCM,RFI_PCM;@RFI_Request,RFI_Request;@RFI_Request_Date,RFI_Request_Date;@RFI_Requestor,RFI_Requestor;@RFI_Spec_Num,Spec_Num;@RFI_State,RFI_State;@RFI_Responder,RFI_Responder;@RFI_Response,RFI_Response;@RFI_Response_Date,RFI_Response_Date;@Form_Status,Form_Status;@FormCC,FormCC;@RFIAction,RFIAction;@SPFormInternalID,ConstructionTaskGUID;@SubmittalRegisterItemGUID,SubmittalRegisterItemGUID;@RFI_x0020__x0020_Route_x0020_New,RFI  Route New Form;@TaskDueDate,Due Date;@ID,ID;@ContentType,Content Type;@Modified,Modified;@Created,Created;@Author,Created By;@Editor,Modified By;@_UIVersionString,Version;@Attachments,Attachments;@File_x0020_Type,File Type;@FileLeafRef,Name (for use in forms);@FileDirRef,Path;@FSObjType,Item Type;@_HasCopyDestinations,Has Copy Destinations;@_CopySource,Copy Source;@ContentTypeId,Content Type ID;@_ModerationStatus,Approval Status;@_UIVersion,UI Version;@Created_x0020_Date,Created;@FileRef,URL Path;@ItemChildCount,Item Child Count;@FolderChildCount,Folder Child Count;@AppAuthor,App Created By;@AppEditor,App Modified By;</DataFields>
<ParameterBindings>
		 <ParameterBinding Name="ListItemId" Location="QueryString(ID)" DefaultValue="0"/>
		 <ParameterBinding Name="weburl" Location="None" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev"/>
		 <ParameterBinding Name="ListID" Location="None" DefaultValue="{FD5E7DDC-F127-458B-A2A8-9301DC940741}"/>
		 <ParameterBinding Name="dvt_apos" Location="Postback;Connection"/>
		 <ParameterBinding Name="ManualRefresh" Location="WPProperty[ManualRefresh]"/>
		 <ParameterBinding Name="UserID" Location="CAMLVariable" DefaultValue="CurrentUserName"/>
		 <ParameterBinding Name="Today" Location="CAMLVariable" DefaultValue="CurrentDate"/>
	 </ParameterBindings>
</WebPartPages:DataFormWebPart>

		</ZoneTemplate></WebPartPages:WebPartZone>
	  </td>
	 </tr>
	</table>
<SharePoint:UIVersionedContent UIVersion="4" runat="server">
	<ContentTemplate>
	</div>
	</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
	<SharePoint:DelegateControl runat="server" ControlId="FormCustomRedirectControl" AllowMultipleControls="true"/>
	<SharePoint:UIVersionedContent UIVersion="4" runat="server"><ContentTemplate>
		<SharePoint:CssRegistration Name="forms.css" runat="server"/>
	</ContentTemplate></SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleLeftBorder" runat="server">
<table cellpadding="0" height="100%" width="100%" cellspacing="0">
 <tr><td class="ms-areaseparatorleft"><img src="/_layouts/15/images/blank.gif?rev=23" width='1' height='1' alt="" /></td></tr>
</table>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleAreaClass" runat="server">
<script type="text/javascript" id="onetidPageTitleAreaFrameScript">
	if (document.getElementById("onetidPageTitleAreaFrame") != null)
	{
		document.getElementById("onetidPageTitleAreaFrame").className="ms-areaseparator";
	}
</script>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderBodyAreaClass" runat="server">
<script type="text/javascript" src="/_layouts/15/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="/_layouts/15/jquery.SPServices-2013.01.js" ></script>
<script type="text/javascript">
var $j = jQuery.noConflict(true);
	$j(document).ready(function(){
		var userName = $j().SPServices.SPGetCurrentUser({
		fieldName: "Title",
		debug: false
	});
	$j('#Submitted_By').text(userName);

	$j().SPServices({
		operation: "GetListItems",
		async: false,
		CAMLViewFields: "<ViewFields><FieldRef Name='tValue' /></ViewFields>",
		CAMLQuery: "<Query><Where><Or><Or>" +
			"<Eq><FieldRef Name='Title' /><Value Type='Text'>ProjectNumber</Value></Eq>" +
			"<Eq><FieldRef Name='Title' /><Value Type='Text'>Contractor</Value></Eq></Or>" +
			"<Or><Eq><FieldRef Name='Title' /><Value Type='Text'>Designer</Value></Eq>" +
			"<Eq><FieldRef Name='Title' /><Value Type='Text'>IPL_Project_Code</Value></Eq>" +
			"</Or></Or></Where></Query>",
		listName: "Site_Constants",
		completefunc: function(xData, Status) {
			$j(xData.responseXML).SPFilterNode("z:row").each(function(){
				var title = $j(this).attr('ows_Title');
				var val = $j(this).attr('ows_tValue');
				$j('#' + title).text(val);
			});
		}
	});
});

function PreSaveAction()
{
   var r=confirm("Are you sure you want to submit this Request for Information form?");
  return r;
}
</script>
<SharePoint:StyleBlock runat="server">
.ms-bodyareaframe {
	padding: 8px;
	border: none;
}</SharePoint:StyleBlock>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderBodyLeftBorder" runat="server">
<div class='ms-areaseparatorleft'><img src="/_layouts/15/images/blank.gif?rev=23" width='8' height='100%' alt="" /></div>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleRightMargin" runat="server">
<div class='ms-areaseparatorright'><img src="/_layouts/15/images/blank.gif?rev=23" width='8' height='100%' alt="" /></div>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderBodyRightMargin" runat="server">
<div class='ms-areaseparatorright'><img src="/_layouts/15/images/blank.gif?rev=23" width='8' height='100%' alt="" /></div>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleAreaSeparator" runat="server"/>
