<%@ Page language="C#" MasterPageFile="~masterurl/default.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:webpartpageexpansion="full" meta:progid="SharePoint.WebPartPage.Document"  %>
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
		<WebPartPages:DataFormWebPart runat="server" EnableOriginalValue="False" DisplayName="Record Data" ViewFlag="1048584" ViewContentTypeId="" Default="FALSE" ListUrl="" ListDisplayName="" ListName="{02E083B6-237F-4B24-AA0F-D883915445CF}" ListId="02e083b6-237f-4b24-aa0f-d883915445cf" PageType="PAGE_DISPLAYFORM" PageSize="-1" UseSQLDataSourcePaging="True" DataSourceID="" ShowWithSampleData="False" AsyncRefresh="False" ManualRefresh="False" AutoRefresh="False" AutoRefreshInterval="60" NoDefaultStyle="TRUE" InitialAsyncDataFetch="False" Title="Record Data" FrameType="None" SuppressWebPartChrome="False" Description="" IsIncluded="True" PartOrder="2" FrameState="Normal" AllowRemove="True" AllowZoneChange="True" AllowMinimize="True" AllowConnect="True" AllowEdit="True" AllowHide="True" IsVisible="True" DetailLink="" HelpLink="" HelpMode="Modeless" Dir="Default" PartImageSmall="" MissingAssembly="Cannot import this Web Part." PartImageLarge="" IsIncludedFilter="" ExportControlledProperties="True" ConnectionID="00000000-0000-0000-0000-000000000000" ID="g_cf32ea02_0f5e_4c1a_bd62_65586697e6c6" ChromeType="None" ExportMode="All" __MarkupType="vsattributemarkup" __WebPartId="{BD61000D-4499-4E65-91BC-A1D110BEDCC8}" __AllowXSLTEditing="true" WebPart="true" Height="" Width=""><DataSources>
<SharePoint:SPDataSource runat="server" DataSourceMode="ListItem" SelectCommand="&lt;View&gt;&lt;Query&gt;&lt;Where&gt;&lt;Eq&gt;&lt;FieldRef Name=&quot;ContentType&quot;/&gt;&lt;Value Type=&quot;Text&quot;&gt;Record_Data&lt;/Value&gt;&lt;/Eq&gt;&lt;/Where&gt;&lt;/Query&gt;&lt;/View&gt;" UseInternalName="True" UseServerDataFormat="True"><SelectParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{02e083b6-237f-4b24-aa0f-d883915445cf}" Name="ListID"></WebPartPages:DataFormParameter>
			</SelectParameters><UpdateParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{02e083b6-237f-4b24-aa0f-d883915445cf}" Name="ListID"></WebPartPages:DataFormParameter>
			</UpdateParameters><InsertParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{02e083b6-237f-4b24-aa0f-d883915445cf}" Name="ListID"></WebPartPages:DataFormParameter>
			</InsertParameters><DeleteParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{02e083b6-237f-4b24-aa0f-d883915445cf}" Name="ListID"></WebPartPages:DataFormParameter>
			</DeleteParameters>
</SharePoint:SPDataSource>
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
		<xsl:variable name="dvt_RowCount" select="count($Rows)"/>
		<xsl:variable name="dvt_IsEmpty" select="$dvt_RowCount = 0"/>
		<xsl:choose>
			<xsl:when test="$dvt_IsEmpty">
				<xsl:call-template name="dvt_1.empty"/>
			</xsl:when>
			<xsl:otherwise>
				<table border="0" width="100%">
					<xsl:call-template name="dvt_1.body">
						<xsl:with-param name="Rows" select="$Rows"/>
					</xsl:call-template>
				</table>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="dvt_1.body">
		<xsl:param name="Rows"/>
		<tr>
			<td class="ms-toolbar" nowrap="nowrap">
				<table>
					<tr>
						<td width="99%" class="ms-toolbar" nowrap="nowrap"><IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="nowrap" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="Display" id="gobackbutton1"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="ms-toolbar" nowrap="nowrap">
				<SharePoint:FormToolBar runat="server" ControlMode="Display"/>
				<SharePoint:ItemValidationFailedMessage runat="server" ControlMode="Display"/>
			</td>
		</tr>
		<xsl:for-each select="$Rows">
			<xsl:call-template name="dvt_1.rowview"/>
		</xsl:for-each>
		<tr>
			<td class="ms-toolbar" nowrap="nowrap">
				<table>
					<tr>
						<td class="ms-descriptiontext" nowrap="nowrap">
							<SharePoint:CreatedModifiedInfo ControlMode="Display" runat="server"/>
						</td>
						<td width="99%" class="ms-toolbar" nowrap="nowrap"><IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="nowrap" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="Display" id="gobackbutton2"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="dvt_1.rowview">
		<tr>
			<td>
				<table border="0" cellspacing="0" width="100%">
					<tr>
						<td width="290px" class="ms-formlabel">
							<h1 class="ipl-stdheader">
								<nobr>Record Data Form</nobr>
							</h1>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>Submitted By: </nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<H3 id="Submitted_By" class="ms-standardheader">
							</H3>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>Project Number: </nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<H3 id="ProjectNumber" class="ms-standardheader">
							</H3>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>Contractor: </nobr>
							</H3>
						</td>						
						<td width="400px" valign="top" class="ms-formbody">
							<H3 id="Contractor" class="ms-standardheader">
							</H3>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>Designer: </nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<H3 id="Designer" class="ms-standardheader">
							</H3>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>IPL Project Code: </nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<H3 id="IPL_Project_Code" class="ms-standardheader">
							</H3>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>Description: <span class="ms-formvalidation"> *</span>
								</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff1{$Pos}" ControlMode="New" FieldName="Title" __designer:bind="{ddwrt:DataBind('i',concat('ff1',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Title')}"/>
							<SharePoint:FieldDescription runat="server" id="ff1description{$Pos}" FieldName="Title" ControlMode="New"/>
							<br></br>(Description is 55 characters maximum)
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>Specification: </nobr><span class="ms-formvalidation"> *</span>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff21{$Pos}" ControlMode="New" FieldName="SpecNum" __designer:bind="{ddwrt:DataBind('i',concat('ff21',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@SpecNum')}"/>
							<SharePoint:FieldDescription runat="server" id="ff21description{$Pos}" FieldName="SpecNum" ControlMode="New"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>Drawing Number: </nobr><span class="ms-formvalidation"> *</span>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff22{$Pos}" ControlMode="New" FieldName="DrawingNum" __designer:bind="{ddwrt:DataBind('i',concat('ff22',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@DrawingNum')}"/>
							<SharePoint:FieldDescription runat="server" id="ff22description{$Pos}" FieldName="DrawingNum" ControlMode="New"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>Detail Description: </nobr><span class="ms-formvalidation"> *</span>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff23{$Pos}" ControlMode="New" FieldName="DetailDescription" __designer:bind="{ddwrt:DataBind('i',concat('ff23',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@DetailDescription')}"/>
							<SharePoint:FieldDescription runat="server" id="ff23description{$Pos}" FieldName="DetailDescription" ControlMode="New"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader field">
								<nobr>Contractor Comments: </nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff4{$Pos}" ControlMode="New" FieldName="Submitter_Comments" __designer:bind="{ddwrt:DataBind('i',concat('ff4',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Submitter_Comments')}"/>
							<SharePoint:FieldDescription runat="server" id="ff4description{$Pos}" FieldName="Submitter_Comments" ControlMode="New"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Status</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff3{$Pos}" ControlMode="Edit" FieldName="RD_Status" __designer:bind="{ddwrt:DataBind('u',concat('ff3',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@RD_Status')}"/>
							<SharePoint:FieldDescription runat="server" id="ff3description{$Pos}" FieldName="RD_Status" ControlMode="Edit"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>RE Comments</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff5{$Pos}" ControlMode="Edit" FieldName="Reviewer_Comments" __designer:bind="{ddwrt:DataBind('u',concat('ff5',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Reviewer_Comments')}"/>
							<SharePoint:FieldDescription runat="server" id="ff5description{$Pos}" FieldName="Reviewer_Comments" ControlMode="Edit"/>
						</td>
					</tr>					
					<tr id="idAttachmentsRow">
						<td nowrap="true" valign="top" class="ms-formlabel" width="20%">
							<SharePoint:FieldLabel ControlMode="Display" FieldName="Attachments" runat="server"/>
						</td>
						<td valign="top" class="ms-formbody" width="80%">
							<SharePoint:FormField runat="server" id="AttachmentsField" ControlMode="Display" FieldName="Attachments" __designer:bind="{ddwrt:DataBind('u','AttachmentsField','Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Attachments')}"/>
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
	<xsl:template name="dvt_1.empty">
		<xsl:variable name="dvt_ViewEmptyText">There are no items to show in this view.</xsl:variable>
		<table border="0" width="100%">
			<tr>
				<td class="ms-vb">
					<xsl:value-of select="$dvt_ViewEmptyText"/>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>	</Xsl>
<DataFields>@ID,ID;@ContentType,Content Type;@Title,Summary;@Modified,Modified;@Created,Created;@Author,Created By;@Editor,Modified By;@_UIVersionString,Version;@Attachments,Attachments;@File_x0020_Type,File Type;@FileLeafRef,Name (for use in forms);@FileDirRef,Path;@FSObjType,Item Type;@_HasCopyDestinations,Has Copy Destinations;@_CopySource,Copy Source;@ContentTypeId,Content Type ID;@_ModerationStatus,Approval Status;@_UIVersion,UI Version;@Created_x0020_Date,Created;@FileRef,URL Path;@ItemChildCount,Item Child Count;@FolderChildCount,Folder Child Count;@AppAuthor,App Created By;@AppEditor,App Modified By;@RD_Num,RD_Num;@RD_Cert_Name,RD_Cert_Name;@RD_Cert_Date,RD_Cert_Date;@RD_Status,RD_Status;@Submitter_Comments,Submitter_Comments;@Reviewer_Comments,Reviewer_Comments;@Record_x0020_Data_x0020_Workflow,Record Data Workflow;@RE_Response_Date,RE_Response_Date;@Submited_Date,Submited_Date;@Form_Rev,Form_Rev;@Submitted_By,Submitted_By;@Submitter_Co,Submitter_Co;@PublishingContactEmail,Contact E-Mail Address;@CompanyNumber,Company Main Phone;@RD_Project_Num,RD_Project_Num;@RD_Designer,RD_Designer;@RD_Project,RD_Project;@RD_Owner_x002F_PCM,RD_Owner/PCM;@RD_Contractor,RD_Contractor;@Contractor_Cert,Contractor_Cert;@RD_Signature,RD_Signature;@SpecNum,SpecNum;@DrawingNum,DrawingNum;@DetailDescription,DetailDescription;@RecordDataNewForm,RecordDataNewForm;@SPFormInternalID,ConstructionTaskGUID;@Record_x0020_Data_x0020_State,Record Data State;@SubmittalRegisterItemGUID,SubmittalRegisterItemGUID;@ReSubmitReady,ReSubmitReady;</DataFields>
<ParameterBindings>
		 <ParameterBinding Name="ListItemId" Location="QueryString(ID)" DefaultValue="0"/>
		 <ParameterBinding Name="weburl" Location="None" DefaultValue="https://iplnet3.iplsharepoint.com/sites/imt/15-1-Dev"/>
		 <ParameterBinding Name="ListID" Location="None" DefaultValue="{02e083b6-237f-4b24-aa0f-d883915445cf}"/>
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
<SharePoint:StyleBlock runat="server">
.ms-bodyareaframe {
	padding: 8px;
	border: none;
}
</SharePoint:StyleBlock>
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
