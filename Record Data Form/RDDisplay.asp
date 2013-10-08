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
		<WebPartPages:DataFormWebPart runat="server" EnableOriginalValue="False" DisplayName="Record Data" ViewFlag="8" ViewContentTypeId="" Default="FALSE" ListUrl="" ListDisplayName="" ListName="{473991C8-179F-4346-B24D-A182AC8C04EB}" ListId="473991c8-179f-4346-b24d-a182ac8c04eb" PageType="PAGE_DISPLAYFORM" PageSize="-1" UseSQLDataSourcePaging="True" DataSourceID="" ShowWithSampleData="False" AsyncRefresh="False" ManualRefresh="False" AutoRefresh="False" AutoRefreshInterval="60" NoDefaultStyle="TRUE" InitialAsyncDataFetch="False" Title="Record Data" FrameType="None" SuppressWebPartChrome="False" Description="" IsIncluded="True" PartOrder="2" FrameState="Normal" AllowRemove="True" AllowZoneChange="True" AllowMinimize="True" AllowConnect="True" AllowEdit="True" AllowHide="True" IsVisible="True" DetailLink="" HelpLink="" HelpMode="Modeless" Dir="Default" PartImageSmall="" MissingAssembly="Cannot import this Web Part." PartImageLarge="" IsIncludedFilter="" ExportControlledProperties="True" ConnectionID="00000000-0000-0000-0000-000000000000" ID="g_26ee2829_4bea_4820_9f1f_9270b7dd1096" ChromeType="None" ExportMode="All" __MarkupType="vsattributemarkup" __WebPartId="{26EE2829-4BEA-4820-9F1F-9270B7DD1096}" __AllowXSLTEditing="true" WebPart="true" Height="" Width=""><DataSources>
<SharePoint:SPDataSource runat="server" DataSourceMode="ListItem" SelectCommand="&lt;View&gt;&lt;Query&gt;&lt;Where&gt;&lt;Eq&gt;&lt;FieldRef Name=&quot;ContentType&quot;/&gt;&lt;Value Type=&quot;Text&quot;&gt;Record_Data&lt;/Value&gt;&lt;/Eq&gt;&lt;/Where&gt;&lt;/Query&gt;&lt;/View&gt;" UseInternalName="True" UseServerDataFormat="True"><SelectParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/construction/15-1" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{473991C8-179F-4346-B24D-A182AC8C04EB}" Name="ListID"></WebPartPages:DataFormParameter>
			</SelectParameters><UpdateParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/construction/15-1" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{473991C8-179F-4346-B24D-A182AC8C04EB}" Name="ListID"></WebPartPages:DataFormParameter>
			</UpdateParameters><InsertParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/construction/15-1" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{473991C8-179F-4346-B24D-A182AC8C04EB}" Name="ListID"></WebPartPages:DataFormParameter>
			</InsertParameters><DeleteParameters><WebPartPages:DataFormParameter ParameterKey="ListItemId" PropertyName="ParameterValues" DefaultValue="0" Name="ListItemId"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="weburl" PropertyName="ParameterValues" DefaultValue="https://iplnet3.iplsharepoint.com/sites/construction/15-1" Name="weburl"></WebPartPages:DataFormParameter><WebPartPages:DataFormParameter ParameterKey="ListID" PropertyName="ParameterValues" DefaultValue="{473991C8-179F-4346-B24D-A182AC8C04EB}" Name="ListID"></WebPartPages:DataFormParameter>
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
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Summary</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Title"/>
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Num</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Num"/>
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Spec_Num</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RFI_Spec_Num"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Drawing_Num</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RFI_Drawing_Num"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Detail</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RFI_Detail"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Status</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Status"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Submitter_Comments</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Submitter_Comments"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Reviewer_Comments</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Reviewer_Comments"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RE_Response_Date</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RE_Response_Date"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>FM_Response_Date</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@FM_Action_Date"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Submited_Date</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Submited_Date"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Form_Rev</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Form_Rev"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Form_Num</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Form_Num"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Submitted_By</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Submitted_By"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Submitter_Co</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Submitter_Co"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Contact E-Mail Address</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@PublishingContactEmail"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Company Main Phone</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@CompanyNumber"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Description</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Description"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Detail_Desc</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Detail_Desc"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Contractor_Cmmnts</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Contractor_Cmmnts"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Project_Num</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Project_Num"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Designer</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Designer"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Project</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Project"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Owner/PCM</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Owner_x002F_PCM"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Contractor</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Contractor"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>Contractor_Cert</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@Contractor_Cert"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>RD_Signature</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<xsl:value-of select="@RD_Signature"/>
										
										</td>
									</tr>
									<tr>
										<td width="190px" valign="top" class="ms-formlabel">
										
										<H3 class="ms-standardheader">
										<nobr>15-1 Record Data</nobr>
										</H3>
										</td>
										<td width="400px" valign="top" class="ms-formbody">
										
										<a href="{substring-before(@_x0031_5_x002d_1_x0020_Record_x0, ', ')}">
										
										<xsl:value-of select="substring-after(@_x0031_5_x002d_1_x0020_Record_x0, ', ')"/>
										
										</a>
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
<DataFields>@Title,Summary;@RD_Num,RD_Num;@RFI_Spec_Num,Spec_Num;@RFI_Drawing_Num,Drawing_Num;@RFI_Detail,Detail;@RD_Cert_Name,RD_Cert_Name;@RD_Cert_Date,RD_Cert_Date;@RD_Status,RD_Status;@Submitter_Comments,Submitter_Comments;@Reviewer_Comments,Reviewer_Comments;@Record_x0020_Data_x0020_Workflow,Record Data Workflow;@RE_Response_Date,RE_Response_Date;@FM_Action_Date,FM_Response_Date;@Submited_Date,Submited_Date;@Form_Rev,Form_Rev;@Form_Num,Form_Num;@Submitted_By,Submitted_By;@Submitter_Co,Submitter_Co;@PublishingContactEmail,Contact E-Mail Address;@CompanyNumber,Company Main Phone;@RD_Description,RD_Description;@RD_Detail_Desc,RD_Detail_Desc;@Contractor_Cmmnts,Contractor_Cmmnts;@RD_Project_Num,RD_Project_Num;@RD_Designer,RD_Designer;@RD_Project,RD_Project;@RD_Owner_x002F_PCM,RD_Owner/PCM;@RD_Contractor,RD_Contractor;@Contractor_Cert,Contractor_Cert;@RD_Signature,RD_Signature;@_x0031_5_x002d_1_x0020_Record_x0,15-1 Record Data;@ID,ID;@ContentType,Content Type;@Modified,Modified;@Created,Created;@Author,Created By;@Editor,Modified By;@_UIVersionString,Version;@Attachments,Attachments;@File_x0020_Type,File Type;@FileLeafRef,Name (for use in forms);@FileDirRef,Path;@FSObjType,Item Type;@_HasCopyDestinations,Has Copy Destinations;@_CopySource,Copy Source;@ContentTypeId,Content Type ID;@_ModerationStatus,Approval Status;@_UIVersion,UI Version;@Created_x0020_Date,Created;@FileRef,URL Path;@ItemChildCount,Item Child Count;@FolderChildCount,Folder Child Count;@AppAuthor,App Created By;@AppEditor,App Modified By;</DataFields>
<ParameterBindings>
		 <ParameterBinding Name="ListItemId" Location="QueryString(ID)" DefaultValue="0"/>
		 <ParameterBinding Name="weburl" Location="None" DefaultValue="https://iplnet3.iplsharepoint.com/sites/construction/15-1"/>
		 <ParameterBinding Name="ListID" Location="None" DefaultValue="{473991C8-179F-4346-B24D-A182AC8C04EB}"/>
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
