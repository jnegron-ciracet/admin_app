<%@ Page Language="C#" MasterPageFile="~/admin-app.Master" AutoEventWireup="true" CodeBehind="dash.aspx.cs" Inherits="admin_app.Dashboard.dash" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v12.2, Version=12.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- CSS STYLE -->    
    <link href="../Style/Normalize.css" rel="stylesheet" />
    <link href="../Style/Dashboard.css" rel="stylesheet" />
    <!-- JAVA SCRIPT -->
    <script src="../JS/Resize.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<!-- DIV: MAIN-WRAPPER -->
      <div class="main-wrapper">
<!-- HEADER: DASH-HEAD -->       
       <header class="dash-head group">
         <h2> Dashboard <span> admin resource </span></h2>         
<!-- DIV: TIME-STAMP 
         <div class="time-stamp">
           <div class="time-stamp-content">
             <asp:Image ID="Image1" runat="server" Height="25px" ImageUrl="~/Images/Dashboard Imgs/Calendar.png" Width="25px" />
             <asp:Label ID="lblDate" runat="server"></asp:Label>
            </div>
         </div><!-- END DIV: TIME-STAMP -->
       </header><!-- END HEADER: DASH-HEAD -->
<!-- DIV: DASH-BODY -->
       <div class="dash-body group">
<!-- DIV: ROW 1-->
         <div class="row">
<!-- DIV: SMLL-REPORTS 1 -->
           <div class="smll-reports">
             <div class="smll-container">
               <div class="smll-visual">
                 <asp:Image ID="Image2" class="smll-imgs" runat="server" Height="50px" ImageUrl="~/Images/Dashboard Imgs/Medical.png" Width="50px" />
               </div>
               <div class="smll-txt">
                 <h1> <asp:Label ID="lblOpenPM" runat="server" Text="Label"></asp:Label> </h1>
                 <p> <asp:Label ID="lblMonth1" runat="server" Text="Label"></asp:Label> Opened PM's </p>                   
               </div>
             </div>                        
           </div>
<!-- DIV: SMLL-REPORTS 2 -->
           <div class="smll-reports">
             <div class="smll-container">
               <div class="smll-visual">
                 <asp:Image ID="Image3" class="smll-imgs" runat="server" Height="50px" ImageUrl="~/Images/Dashboard Imgs/Settings.png" Width="50px" />
               </div>
               <div class="smll-txt">
                 <h1> <asp:Label ID="lblOpenedPriorities" runat="server" Text="Label"></asp:Label> </h1>
                 <p> <asp:Label ID="lblMonth2" runat="server" Text="Label"></asp:Label> PM's Priorities </p>
               </div>
             </div>                        
           </div>
<!-- DIV: SMLL-REPORTS 3 -->
           <div class="smll-reports">
             <div class="smll-container">
               <div class="smll-visual">
                 <asp:Image ID="Image4" class="smll-imgs" runat="server" Height="50px" ImageUrl="~/Images/Dashboard Imgs/Shopping.png" Width="50px" />
               </div>
               <div class="smll-txt">
                 <h1> <asp:Label ID="lblPendingPickUp1" runat="server" Text=""></asp:Label> </h1>
                 <p> Uncollected Parts </p>
               </div>
             </div>                        
           </div>
<!-- DIV: SMLL-REPORTS 4 -->
           <div class="smll-reports">
             <div class="smll-container">
               <div class="smll-visual">
                 <asp:Image ID="Image5" class="smll-imgs" runat="server" Height="50px" ImageUrl="~/Images/Dashboard Imgs/Percentage.png" Width="50px" />
               </div>
               <div class="smll-txt">
                 <h1> <asp:Label ID="lblMonthlyPMCompliance1" CssClass="overall" runat="server" Text=""></asp:Label>% </h1>
                 <p> Overall Compliance </p>
               </div>
             </div>                        
           </div><!-- END DIV: SMLL-REPORTS 4 -->
         </div><!-- END DIV: ROW -->
<!-- DIV: ROW 2-->
         <asp:UpdatePanel ID="UpdatePanel2" runat="server" OnLoad="UpdatePanel2_Load" UpdateMode="Conditional">
           <ContentTemplate>           
             <!--<div class="row">-->
    <!-- DIV: CHART 1 -->
               <div id="chrt1" class="charts-content">
                 <header class="charts-header">               
                   <h3>Monthly PM's By Hospital</h3>
                   <p>Overall <asp:Label ID="lblPMCompliance" CssClass="overall" runat="server" Text=""></asp:Label><span>%</span></p>
                 </header>
                 <div class="charts_body">

                   <dxchartsui:WebChartControl ID="WebChartControl3" runat="server" DataSourceID="SqlDataSource3" Height="230px" Width="600px" PaletteName="Palette 1" BackColor="Transparent" ClientInstanceName="WebChartControl3" OnCustomCallback="WebChartControl3_CustomCallback" ShowLoadingPanel="False" >
                    <borderoptions visible="False" />
                    <diagramserializable>
                        <cc1:xydiagram>
                            <axisx visibleinpanesserializable="-1">
                                <label angle="-90">
                                </label>
                                <range sidemarginsenabled="True" />
                                <numericoptions format="General" />
                            </axisx>
                            <axisy visibleinpanesserializable="-1">
                                <constantlines>
                                    <cc1:constantline AxisValueSerializable="90" Color="Red" LegendText="Treshhold" Name="Treshhold">
                                        <linestyle dashstyle="Solid" />
                                    </cc1:ConstantLine>
                                </constantlines>
                                <label textcolor="224, 224, 224">
                                </label>
                                <range sidemarginsenabled="True" auto="False" maxvalueserializable="100" minvalueserializable="0" />
                                <gridlines color="224, 224, 224">
                                </gridlines>
                                <numericoptions format="General" />
                            </axisy>
                            <defaultpane backcolor="Transparent">
                            </defaultpane>
                        </cc1:XYDiagram>
                    </diagramserializable>
                    <FillStyle><OptionsSerializable>
                    <cc1:solidfilloptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>

                    <legend alignmenthorizontal="Right" alignmentvertical="TopOutside" direction="LeftToRight" equallyspaceditems="False" markersize="18, 10"></legend>

                    <seriesserializable>
                        <cc1:series ArgumentDataMember="Hospital" ArgumentScaleType="Qualitative" Name="Compliance %" ValueDataMembersSerializable="Percentage_PMs" LabelsVisibility="True">
                            <viewserializable>
                                <cc1:sidebysidebarseriesview>
                                </cc1:SideBySideBarSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:sidebysidebarserieslabel LineVisible="True" Antialiasing="True" BackColor="Transparent" Font="Verdana, 10pt, style=Bold" TextColor="224, 224, 224">
                                    <border visible="False" /><fillstyle>
                                        <optionsserializable>
                                            <cc1:solidfilloptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:pointoptions Pattern="{V}%">
                                            <argumentnumericoptions format="General" />
                                            <valuenumericoptions format="Number" precision="1" />
                                        </cc1:PointOptions>
                                    </pointoptionsserializable>
                                </cc1:SideBySideBarSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:pointoptions Pattern="{V}%">
                                    <argumentnumericoptions format="General" />
                                    <valuenumericoptions format="Number" precision="1" />
                                </cc1:PointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate>
                        <viewserializable>
                            <cc1:sidebysidebarseriesview>
                            </cc1:SideBySideBarSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:sidebysidebarserieslabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:solidfilloptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:pointoptions>
                                        <argumentnumericoptions format="General" />
                                        <valuenumericoptions format="General" />
                                    </cc1:PointOptions>
                                </pointoptionsserializable>
                            </cc1:SideBySideBarSeriesLabel>
                        </labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:pointoptions>
                                <argumentnumericoptions format="General" />
                                <valuenumericoptions format="General" />
                            </cc1:PointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>

                       <palettewrappers>
                           <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                               <palette>
                                   <cc1:PaletteEntry Color="75, 75, 75" Color2="75, 75, 75" />
                               </palette>
                           </dxchartsui:PaletteWrapper>
                       </palettewrappers>                    

                        <CrosshairOptions ArgumentLineColor="222, 57, 205" ValueLineColor="222, 57, 205"><CommonLabelPositionSerializable>
                        <cc1:crosshairmouseposition></cc1:CrosshairMousePosition>
                        </CommonLabelPositionSerializable>
                        </CrosshairOptions>

                        <ToolTipOptions><ToolTipPositionSerializable>
                        <cc1:tooltipmouseposition></cc1:ToolTipMousePosition>
                        </ToolTipPositionSerializable>
                        </ToolTipOptions>
                    </dxchartsui:WebChartControl>
                   <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=CIRACETSRV002\CIRACETSRV002;Initial Catalog=CiracetNew;Integrated Security=True" SelectCommand="spS_Dashboard_Monthly_PM_History_ByHospital" SelectCommandType="StoredProcedure"></asp:SqlDataSource>                 
                 </div>
               </div>
    <!-- DIV: CHART 2 -->
               <div id="chrt2" class="charts-content">
                 <header class="charts-header">
                   <h3>Monthly PM's</h3>
                   <p>Compliance <asp:Label ID="lblMonthlyPMCompliance2" runat="server" Text=""></asp:Label><span>%</span></p>
                 </header>
                 <div class="charts_body">
                   <dxchartsui:WebChartControl ID="WebChartControl4" runat="server" DataSourceID="SqlDataSource4" Height="230px" Width="295px" PaletteName="Palette 1" BackColor="Transparent">
                        <borderoptions visible="False" />
                    <diagramserializable>
                        <cc1:xydiagram>
                            <axisx visibleinpanesserializable="-1">
                                <label font="Tahoma, 10pt">
                                </label>
                                <range sidemarginsenabled="True" />
                                <numericoptions format="General" />
                            </axisx>
                            <axisy visibleinpanesserializable="-1">
                                <label textcolor="224, 224, 224">
                                </label>
                                <range sidemarginsenabled="True" />
                                <gridlines color="224, 224, 224">
                                </gridlines>
                                <numericoptions format="General" />
                            </axisy>
                            <defaultpane backcolor="Transparent">
                            </defaultpane>
                        </cc1:XYDiagram>
                    </diagramserializable>
                    <FillStyle><OptionsSerializable>
                    <cc1:solidfilloptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>

                        <legend alignmenthorizontal="Right" alignmentvertical="TopOutside" direction="LeftToRight" equallyspaceditems="False" visible="False"></legend>

                    <seriesserializable>
                        
                        
                    <cc1:series ArgumentDataMember="Description1" ArgumentScaleType="Qualitative" Name="Assigned" ValueDataMembersSerializable="Assigned_PMs" LabelsVisibility="True">
                            
                            
                            
                        <viewserializable>
                                
                            <cc1:sidebysidebarseriesview>
                                </cc1:SideBySideBarSeriesView></viewserializable><labelserializable>
                                
                            <cc1:sidebysidebarserieslabel LineVisible="True" BackColor="Transparent" Font="Verdana, 10pt, style=Bold" Position="Center" TextColor="224, 224, 224">
                                    
                                    
                                <border visible="False" /><fillstyle>
                                        
                                    <optionsserializable>
                                            
                                        <cc1:solidfilloptions /></optionsserializable></fillstyle><pointoptionsserializable>
                                        
                                    <cc1:pointoptions>
                                            
                                            
                                        <argumentnumericoptions format="General" /><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:SideBySideBarSeriesLabel></labelserializable><legendpointoptionsserializable>
                                
                            <cc1:pointoptions>
                                    
                                    
                                <argumentnumericoptions format="General" /><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></legendpointoptionsserializable></cc1:Series><cc1:series ArgumentDataMember="Description2" ArgumentScaleType="Qualitative" Name="Completed" ValueDataMembersSerializable="Completed_PMs" LabelsVisibility="True">
                            
                            
                            
                        <viewserializable>
                                
                            <cc1:sidebysidebarseriesview>
                                </cc1:SideBySideBarSeriesView></viewserializable><labelserializable>
                                
                            <cc1:sidebysidebarserieslabel LineVisible="True" BackColor="Transparent" Font="Verdana, 10pt, style=Bold" Position="Center" TextColor="25, 25, 25">
                                    
                                    
                                <border visible="False" /><fillstyle>
                                        
                                    <optionsserializable>
                                            
                                        <cc1:solidfilloptions /></optionsserializable></fillstyle><pointoptionsserializable>
                                        
                                    <cc1:pointoptions>
                                            
                                            
                                        <argumentnumericoptions format="General" /><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:SideBySideBarSeriesLabel></labelserializable><legendpointoptionsserializable>
                                
                            <cc1:pointoptions>
                                    
                                    
                                <argumentnumericoptions format="General" /><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></legendpointoptionsserializable></cc1:Series></seriesserializable>

                        <SeriesTemplate argumentscaletype="Numerical"><ViewSerializable>
                            <cc1:sidebysidebarseriesview>
                            </cc1:SideBySideBarSeriesView>
                        </ViewSerializable>
                        <LabelSerializable>
                            <cc1:sidebysidebarserieslabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:solidfilloptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:pointoptions>
                                        <argumentnumericoptions format="General" />
                                        <valuenumericoptions format="General" />
                                    </cc1:PointOptions>
                                </pointoptionsserializable>
                            </cc1:SideBySideBarSeriesLabel>
                        </LabelSerializable>
                        <LegendPointOptionsSerializable>
                        <cc1:pointoptions>
                        <ArgumentNumericOptions Format="General"></ArgumentNumericOptions>

                        <ValueNumericOptions Format="General"></ValueNumericOptions>
                        </cc1:PointOptions>
                        </LegendPointOptionsSerializable>
                        </SeriesTemplate>

                                        <palettewrappers>
                                            <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                                <palette>
                                                    <cc1:PaletteEntry Color="75, 75, 75" Color2="75, 75, 75" />
                                                    <cc1:PaletteEntry Color="102, 179, 255" Color2="102, 179, 255" />
                                                </palette>
                                            </dxchartsui:PaletteWrapper>
                        </palettewrappers>

                        <CrosshairOptions ArgumentLineColor="222, 57, 205" ValueLineColor="222, 57, 205"><CommonLabelPositionSerializable>
                        <cc1:crosshairmouseposition></cc1:CrosshairMousePosition>
                        </CommonLabelPositionSerializable>
                        </CrosshairOptions>

                        <ToolTipOptions><ToolTipPositionSerializable>
                        <cc1:tooltipmouseposition></cc1:ToolTipMousePosition>
                        </ToolTipPositionSerializable>
                        </ToolTipOptions>
                    </dxchartsui:WebChartControl>
                   <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=CIRACETSRV002\CIRACETSRV002;Initial Catalog=CiracetNew;Integrated Security=True" SelectCommand="spS_Dashboard_Monthly_PM_History" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                 </div>
               </div>
    <!-- DIV: CHART 3 -->
               <div id="chrt3" class="charts-content">
                 <header class="charts-header">
                   <h3>YTD Priorities</h3>
                   <p>Compliance <asp:Label ID="lblYTDPriorityCompliance" runat="server" Text=""></asp:Label><span>%</span></p>
                 </header>
                 <div class="charts_body">
                   <dxchartsui:WebChartControl ID="WebChartControl5" runat="server" DataSourceID="SqlDataSource5" Height="230px" Width="295px" PaletteName="Palette 1" BackColor="Transparent">
                        <borderoptions visible="False" />
                    <diagramserializable>
                        <cc1:xydiagram>
                            <axisx visibleinpanesserializable="-1">
                                <label font="Tahoma, 10pt">
                                </label>
                                <range sidemarginsenabled="True" />
                                <numericoptions format="General" />
                            </axisx>
                            <axisy visibleinpanesserializable="-1">
                                <label textcolor="224, 224, 224">
                                </label>
                                <range sidemarginsenabled="True" />
                                <gridlines color="224, 224, 224">
                                </gridlines>
                                <numericoptions format="General" />
                            </axisy>
                            <defaultpane backcolor="Transparent">
                            </defaultpane>
                        </cc1:XYDiagram>
                    </diagramserializable>
                    <FillStyle><OptionsSerializable>
                    <cc1:solidfilloptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>

                        <legend visible="False"></legend>

                    <seriesserializable>
                        
                        
                    <cc1:series ArgumentDataMember="Description3" ArgumentScaleType="Qualitative" Name="Open WO" ValueDataMembersSerializable="Assigned_Priorities" LabelsVisibility="True">
                            
                            
                            
                        <viewserializable>
                                
                            <cc1:sidebysidebarseriesview>
                                </cc1:SideBySideBarSeriesView></viewserializable><labelserializable>
                                
                            <cc1:sidebysidebarserieslabel LineVisible="True" BackColor="Transparent" Font="Verdana, 10pt, style=Bold" Position="Center" TextColor="224, 224, 224">
                                    
                                    
                                <border visible="False" /><fillstyle>
                                        
                                    <optionsserializable>
                                            
                                        <cc1:solidfilloptions /></optionsserializable></fillstyle><pointoptionsserializable>
                                        
                                    <cc1:pointoptions>
                                            
                                            
                                        <argumentnumericoptions format="General" /><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:SideBySideBarSeriesLabel></labelserializable><legendpointoptionsserializable>
                                
                            <cc1:pointoptions>
                                    
                                    
                                <argumentnumericoptions format="General" /><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></legendpointoptionsserializable></cc1:Series><cc1:series ArgumentDataMember="Description4" ArgumentScaleType="Qualitative" Name="Completed" ValueDataMembersSerializable="Completed_Priorities" LabelsVisibility="True">
                            
                            
                            
                        <viewserializable>
                                
                            <cc1:sidebysidebarseriesview>
                                </cc1:SideBySideBarSeriesView></viewserializable><labelserializable>
                                
                            <cc1:sidebysidebarserieslabel LineVisible="True" BackColor="Transparent" Font="Verdana, 10pt, style=Bold" Position="Center" TextColor="25, 25, 25">
                                    
                                    
                                <border visible="False" /><fillstyle>
                                        
                                    <optionsserializable>
                                            
                                        <cc1:solidfilloptions /></optionsserializable></fillstyle><pointoptionsserializable>
                                        
                                    <cc1:pointoptions>
                                            
                                            
                                        <argumentnumericoptions format="General" /><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:SideBySideBarSeriesLabel></labelserializable><legendpointoptionsserializable>
                                
                            <cc1:pointoptions>
                                    
                                    
                                <argumentnumericoptions format="General" /><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></legendpointoptionsserializable></cc1:Series></seriesserializable>

                        <SeriesTemplate><ViewSerializable>
                        <cc1:sidebysidebarseriesview></cc1:SideBySideBarSeriesView>
                        </ViewSerializable>
                        <LabelSerializable>
                        <cc1:sidebysidebarserieslabel LineVisible="True">
                        <FillStyle><OptionsSerializable>
                        <cc1:solidfilloptions></cc1:SolidFillOptions>
                        </OptionsSerializable>
                        </FillStyle>
                        <PointOptionsSerializable>
                        <cc1:pointoptions>
                        <ArgumentNumericOptions Format="General"></ArgumentNumericOptions>

                        <ValueNumericOptions Format="General"></ValueNumericOptions>
                        </cc1:PointOptions>
                        </PointOptionsSerializable>
                        </cc1:SideBySideBarSeriesLabel>
                        </LabelSerializable>
                        <LegendPointOptionsSerializable>
                        <cc1:pointoptions>
                        <ArgumentNumericOptions Format="General"></ArgumentNumericOptions>

                        <ValueNumericOptions Format="General"></ValueNumericOptions>
                        </cc1:PointOptions>
                        </LegendPointOptionsSerializable>
                        </SeriesTemplate>

                                        <palettewrappers>
                                            <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                                <palette>
                                                    <cc1:PaletteEntry Color="75, 75, 75" Color2="75, 75, 75" />
                                                    <cc1:PaletteEntry Color="102, 179, 255" Color2="102, 179, 255" />
                                                </palette>
                                            </dxchartsui:PaletteWrapper>
                        </palettewrappers>

                        <CrosshairOptions ArgumentLineColor="222, 57, 205" ValueLineColor="222, 57, 205"><CommonLabelPositionSerializable>
                        <cc1:crosshairmouseposition></cc1:CrosshairMousePosition>
                        </CommonLabelPositionSerializable>
                        </CrosshairOptions>

                        <ToolTipOptions><ToolTipPositionSerializable>
                        <cc1:tooltipmouseposition></cc1:ToolTipMousePosition>
                        </ToolTipPositionSerializable>
                        </ToolTipOptions>
                    </dxchartsui:WebChartControl>
                   <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Data Source=CIRACETSRV002\CIRACETSRV002;Initial Catalog=CiracetNew;Integrated Security=True" SelectCommand="spS_Dashboard_Monthly_PM_History" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                 </div>
               </div><!-- END DIV: CHART 3 -->
             <!--</div> END DIV: ROW 2-->
           
<!-- DIV: ROW 3-->
         <!--<div class="row">-->
<!-- DIV: CHART 4 -->
               <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="10000"></asp:Timer>
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate>
                   <div id="chrt4" class="charts-content">
                     <header class="charts-header">             
                         <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Height="50px">
                             <EmptyImage Url="~/Images/Dashboard Imgs/User.jpg">
                             </EmptyImage>
                         </dx:ASPxBinaryImage>
                         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                         <p>BMET Compliance: <asp:Label ID="lblUserOverall" CssClass="overall" runat="server" Text=""></asp:Label><span>%</span></p>
                     </header>
                     <div class="charts_body">
                     <!--TO DO: ADD BODY CONTENT -->
        <!-- WEBCHARTCONTROL -->
                       <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="SqlDataSource1" Height="230px" PaletteName="Palette 1" Width="300px" BackColor="Transparent">
                           <emptycharttext text="." />
                           <borderoptions visible="False" />
                           <diagramserializable>
                               <cc1:xydiagram>
                                   <axisx visibleinpanesserializable="-1">
                                       <range sidemarginsenabled="True" />
                                       <numericoptions format="General" />
                                   </axisx>
                                   <axisy visibleinpanesserializable="-1" interlacedcolor="224, 224, 224">
                                       <label textcolor="224, 224, 224">
                                       </label>
                                       <range sidemarginsenabled="True" />
                                       <gridlines color="224, 224, 224">
                                       </gridlines>
                                       <numericoptions format="General" />
                                   </axisy>
                                   <defaultpane backcolor="Transparent">
                                   </defaultpane>
                               </cc1:XYDiagram>
                           </diagramserializable>
                           <FillStyle><OptionsSerializable>
                           <cc1:solidfilloptions></cc1:SolidFillOptions>
                           </OptionsSerializable>
                           </FillStyle>
                           <legend visible="False"></legend>
                           <seriesserializable>
                               <cc1:series ArgumentDataMember="Description1" ArgumentScaleType="Qualitative" Name="Assigned" ValueDataMembersSerializable="Assigned_PMs" LabelsVisibility="True">
                                   <viewserializable>
                                       <cc1:sidebysidebarseriesview>
                                       </cc1:SideBySideBarSeriesView>
                                   </viewserializable>
                                   <labelserializable>
                                       <cc1:sidebysidebarserieslabel LineVisible="True" BackColor="Transparent" Font="Verdana, 10pt, style=Bold" Position="Center" TextColor="224, 224, 224">
                                           <border visible="False" /><fillstyle>
                                               <optionsserializable>
                                                   <cc1:solidfilloptions />
                                               </optionsserializable>
                                           </fillstyle>
                                           <pointoptionsserializable>
                                               <cc1:pointoptions>
                                                   <argumentnumericoptions format="General" />
                                                   <valuenumericoptions format="Number" precision="0" />
                                               </cc1:PointOptions>
                                           </pointoptionsserializable>
                                       </cc1:SideBySideBarSeriesLabel>
                                   </labelserializable>
                                   <legendpointoptionsserializable>
                                       <cc1:pointoptions>
                                           <argumentnumericoptions format="General" />
                                           <valuenumericoptions format="Number" precision="0" />
                                       </cc1:PointOptions>
                                   </legendpointoptionsserializable>
                               </cc1:Series>
                               <cc1:series ArgumentDataMember="Description2" ArgumentScaleType="Qualitative" Name="Completed" ValueDataMembersSerializable="Completed_PMs" LabelsVisibility="True">
                                   <viewserializable>
                                       <cc1:sidebysidebarseriesview>
                                       </cc1:SideBySideBarSeriesView>
                                   </viewserializable>
                                   <labelserializable>
                                       <cc1:sidebysidebarserieslabel LineVisible="True" BackColor="Transparent" Font="Verdana, 10pt, style=Bold" Position="Center" TextColor="25, 25, 25">
                                           <fillstyle>
                                               <optionsserializable>
                                                   <cc1:solidfilloptions />
                                               </optionsserializable>
                                           </fillstyle>
                                           <pointoptionsserializable>
                                               <cc1:pointoptions>
                                                   <argumentnumericoptions format="General" />
                                                   <valuenumericoptions format="Number" precision="0" />
                                               </cc1:PointOptions>
                                           </pointoptionsserializable>
                                       </cc1:SideBySideBarSeriesLabel>
                                   </labelserializable>
                                   <legendpointoptionsserializable>
                                       <cc1:pointoptions>
                                           <argumentnumericoptions format="General" />
                                           <valuenumericoptions format="Number" precision="0" />
                                       </cc1:PointOptions>
                                   </legendpointoptionsserializable>
                               </cc1:Series>
                           </seriesserializable>

                            <SeriesTemplate><ViewSerializable>
                            <cc1:sidebysidebarseriesview></cc1:SideBySideBarSeriesView>
                            </ViewSerializable>
                            <LabelSerializable>
                            <cc1:sidebysidebarserieslabel LineVisible="True">
                            <FillStyle><OptionsSerializable>
                            <cc1:solidfilloptions></cc1:SolidFillOptions>
                            </OptionsSerializable>
                            </FillStyle>
                            <PointOptionsSerializable>
                            <cc1:pointoptions>
                            <ArgumentNumericOptions Format="General"></ArgumentNumericOptions>

                            <ValueNumericOptions Format="General"></ValueNumericOptions>
                            </cc1:PointOptions>
                            </PointOptionsSerializable>
                            </cc1:SideBySideBarSeriesLabel>
                            </LabelSerializable>
                            <LegendPointOptionsSerializable>
                            <cc1:pointoptions>
                            <ArgumentNumericOptions Format="General"></ArgumentNumericOptions>

                            <ValueNumericOptions Format="General"></ValueNumericOptions>
                            </cc1:PointOptions>
                            </LegendPointOptionsSerializable>
                            </SeriesTemplate>
                           <titles>
                               <cc1:ChartTitle Font="Tahoma, 14pt" Text="Monthly PM's" TextColor="224, 224, 224" />
                           </titles>
                           <palettewrappers>
                               <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                   <palette>
                                       <cc1:PaletteEntry Color="75, 75, 75" Color2="75, 75, 75" />
                                       <cc1:PaletteEntry Color="102, 179, 255" Color2="102, 179, 255" />
                                   </palette>
                               </dxchartsui:PaletteWrapper>
                           </palettewrappers>
                            <CrosshairOptions ArgumentLineColor="222, 57, 205" ValueLineColor="222, 57, 205"><CommonLabelPositionSerializable>
                            <cc1:crosshairmouseposition></cc1:CrosshairMousePosition>
                            </CommonLabelPositionSerializable>
                            </CrosshairOptions>

                            <ToolTipOptions><ToolTipPositionSerializable>
                            <cc1:tooltipmouseposition></cc1:ToolTipMousePosition>
                            </ToolTipPositionSerializable>
                            </ToolTipOptions>
                       </dxchartsui:WebChartControl>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=CIRACETSRV002\CIRACETSRV002;Initial Catalog=CiracetNew;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="spS_Report_BMET_Monthly_PM_History" SelectCommandType="StoredProcedure">
                           <SelectParameters>
                               <asp:Parameter Name="UserID" DefaultValue="" Type="Int32" />
                           </SelectParameters>
                         </asp:SqlDataSource>
        <!-- WEBCHARTCONTROL -->
                       <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" BackColor="Transparent" DataSourceID="SqlDataSource2" Height="230px" PaletteName="Palette 1" Width="420px">
                           <emptycharttext text="." />
                           <borderoptions visible="False" />
                           <diagramserializable>
                               <cc1:xydiagram>
                                   <axisx visibleinpanesserializable="-1">
                                       <range sidemarginsenabled="False" />
                                       <numericoptions format="General" />
                                   </axisx>
                                   <axisy visibleinpanesserializable="-1">
                                       <label textcolor="224, 224, 224">
                                       </label>
                                       <range sidemarginsenabled="True" />
                                       <gridlines color="224, 224, 224">
                                       </gridlines>
                                       <numericoptions format="General" />
                                   </axisy>
                                   <defaultpane backcolor="Transparent">
                                   </defaultpane>
                               </cc1:XYDiagram>
                           </diagramserializable>
                            <FillStyle><OptionsSerializable>
                            <cc1:solidfilloptions></cc1:SolidFillOptions>
                            </OptionsSerializable>
                            </FillStyle>

                           <legend visible="False"></legend>
                           <seriesserializable>
                               <cc1:series ArgumentDataMember="Month" ArgumentScaleType="Qualitative" Name="Series 1" ValueDataMembersSerializable="Percentage">
                                   <viewserializable>
                                       <cc1:areaseriesview>
                                           <markeroptions visible="True">
                                           </markeroptions>
                                       </cc1:AreaSeriesView>
                                   </viewserializable>
                                   <labelserializable>
                                       <cc1:pointserieslabel LineVisible="True">
                                           <fillstyle>
                                               <optionsserializable>
                                                   <cc1:solidfilloptions />
                                               </optionsserializable>
                                           </fillstyle>
                                           <pointoptionsserializable>
                                               <cc1:pointoptions>
                                                   <argumentnumericoptions format="General" />
                                                   <valuenumericoptions format="General" />
                                               </cc1:PointOptions>
                                           </pointoptionsserializable>
                                       </cc1:PointSeriesLabel>
                                   </labelserializable>
                                   <legendpointoptionsserializable>
                                       <cc1:pointoptions>
                                           <argumentnumericoptions format="General" />
                                           <valuenumericoptions format="General" />
                                       </cc1:PointOptions>
                                   </legendpointoptionsserializable>
                               </cc1:Series>
                           </seriesserializable>
                           <seriestemplate>
                               <viewserializable>
                                   <cc1:areaseriesview Transparency="0">
                                       <markeroptions visible="True">
                                       </markeroptions>
                                   </cc1:AreaSeriesView>
                               </viewserializable>
                               <labelserializable>
                                   <cc1:pointserieslabel LineVisible="True">
                                       <fillstyle>
                                           <optionsserializable>
                                               <cc1:solidfilloptions />
                                           </optionsserializable>
                                       </fillstyle>
                                       <pointoptionsserializable>
                                           <cc1:pointoptions>
                                               <argumentnumericoptions format="General" />
                                               <valuenumericoptions format="General" />
                                           </cc1:PointOptions>
                                       </pointoptionsserializable>
                                   </cc1:PointSeriesLabel>
                               </labelserializable>
                               <legendpointoptionsserializable>
                                   <cc1:pointoptions>
                                       <argumentnumericoptions format="General" />
                                       <valuenumericoptions format="General" />
                                   </cc1:PointOptions>
                               </legendpointoptionsserializable>
                           </seriestemplate>
                           <titles>
                               <cc1:ChartTitle Font="Tahoma, 14pt" Text="Monthly Compliance %" TextColor="224, 224, 224" />
                           </titles>
                           <palettewrappers>
                               <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                   <palette>
                                       <cc1:PaletteEntry Color="75, 75, 75" Color2="75, 75, 75" />
                                   </palette>
                               </dxchartsui:PaletteWrapper>
                           </palettewrappers>

                            <CrosshairOptions ArgumentLineColor="222, 57, 205" ValueLineColor="222, 57, 205"><CommonLabelPositionSerializable>
                            <cc1:crosshairmouseposition></cc1:CrosshairMousePosition>
                            </CommonLabelPositionSerializable>
                            </CrosshairOptions>

                            <ToolTipOptions><ToolTipPositionSerializable>
                            <cc1:tooltipmouseposition></cc1:ToolTipMousePosition>
                            </ToolTipPositionSerializable>
                            </ToolTipOptions>
                       </dxchartsui:WebChartControl>
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=CIRACETSRV002\CIRACETSRV002;Initial Catalog=CiracetNew;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="spS_Report_BMET_Yearly_PM_History" SelectCommandType="StoredProcedure">
                           <SelectParameters>
                               <asp:Parameter DefaultValue="36" Name="UserID" Type="Int32" />
                           </SelectParameters>
                         </asp:SqlDataSource>             
                     </div>
                   </div>
    <!-- DIV: CHART 5 -->
                 </ContentTemplate>
                   <Triggers>
                       <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                   </Triggers>
               </asp:UpdatePanel>
    <!-- TIMER CONTROL -->               
               <div id="chrt5" class="charts-content group">
                 <header class="charts-header">
                   <h3>Pending PickUp</h3>
                   <p>Total Pending <asp:Label ID="lblPendingPickUp2" CssClass="overall" runat="server" Text=""></asp:Label></p>
                 </header>
                 <div class="charts_body">
                   <dxchartsui:WebChartControl ID="WebChartControl6" runat="server" Height="230px" Width="470px" PaletteName="Palette 1" BackColor="Transparent" DataSourceID="SqlDataSource6">
                        <borderoptions visible="False" />
                    <diagramserializable>
                        <cc1:xydiagram>
                            <axisx visibleinpanesserializable="-1">
                                <label font="Tahoma, 10pt" angle="-90">
                                </label>
                                <range sidemarginsenabled="True" />
                                <numericoptions format="General" />
                            </axisx>
                            <axisy visibleinpanesserializable="-1">
                                <label textcolor="224, 224, 224">
                                </label>
                                <range sidemarginsenabled="True" />
                                <gridlines color="224, 224, 224">
                                </gridlines>
                                <numericoptions format="General" />
                            </axisy>
                            <defaultpane backcolor="Transparent">
                            </defaultpane>
                        </cc1:XYDiagram>
                    </diagramserializable>
                    <FillStyle><OptionsSerializable>
                    <cc1:solidfilloptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>

                        <legend visible="False"></legend>

                    <seriesserializable>
                        <cc1:series ArgumentDataMember="Hospital" ArgumentScaleType="Qualitative" Name="Hospitals" ValueDataMembersSerializable="Counter" LabelsVisibility="True">
                            <viewserializable>
                                <cc1:sidebysidebarseriesview>
                                </cc1:SideBySideBarSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:sidebysidebarserieslabel LineVisible="True" BackColor="Transparent" Font="Verdana, 10pt, style=Bold" TextColor="224, 224, 224">
                                    <border visible="False" /><fillstyle>
                                        <optionsserializable>
                                            <cc1:solidfilloptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:pointoptions>
                                            <argumentnumericoptions format="General" />
                                            <valuenumericoptions format="Number" precision="0" />
                                        </cc1:PointOptions>
                                    </pointoptionsserializable>
                                </cc1:SideBySideBarSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:pointoptions>
                                    <argumentnumericoptions format="General" />
                                    <valuenumericoptions format="Number" precision="0" />
                                </cc1:PointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>

                        <SeriesTemplate><ViewSerializable>
                        <cc1:sidebysidebarseriesview></cc1:SideBySideBarSeriesView>
                        </ViewSerializable>
                        <LabelSerializable>
                        <cc1:sidebysidebarserieslabel LineVisible="True">
                        <FillStyle><OptionsSerializable>
                        <cc1:solidfilloptions></cc1:SolidFillOptions>
                        </OptionsSerializable>
                        </FillStyle>
                        <PointOptionsSerializable>
                        <cc1:pointoptions>
                        <ArgumentNumericOptions Format="General"></ArgumentNumericOptions>

                        <ValueNumericOptions Format="General"></ValueNumericOptions>
                        </cc1:PointOptions>
                        </PointOptionsSerializable>
                        </cc1:SideBySideBarSeriesLabel>
                        </LabelSerializable>
                        <LegendPointOptionsSerializable>
                        <cc1:pointoptions>
                        <ArgumentNumericOptions Format="General"></ArgumentNumericOptions>

                        <ValueNumericOptions Format="General"></ValueNumericOptions>
                        </cc1:PointOptions>
                        </LegendPointOptionsSerializable>
                        </SeriesTemplate>

                                        <palettewrappers>
                                            <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                                <palette>
                                                    <cc1:PaletteEntry Color="75, 75, 75" Color2="75, 75, 75" />
                                                    <cc1:PaletteEntry Color="102, 179, 255" Color2="102, 179, 255" />
                                                </palette>
                                            </dxchartsui:PaletteWrapper>
                        </palettewrappers>

                        <CrosshairOptions ArgumentLineColor="222, 57, 205" ValueLineColor="222, 57, 205"><CommonLabelPositionSerializable>
                        <cc1:crosshairmouseposition></cc1:CrosshairMousePosition>
                        </CommonLabelPositionSerializable>
                        </CrosshairOptions>

                        <ToolTipOptions><ToolTipPositionSerializable>
                        <cc1:tooltipmouseposition></cc1:ToolTipMousePosition>
                        </ToolTipPositionSerializable>
                        </ToolTipOptions>
                    </dxchartsui:WebChartControl>
                   <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="Data Source=CIRACETSRV002\CIRACETSRV002;Initial Catalog=CiracetNew;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="Select h.InicialesHospital As 'Hospital', Count(w.id) As 'Counter'
                        From	WorkOrder w Inner Join
		                        Hospital h On w.idHospital = h.idInstitucion Inner Join
		                        QuotationHeader qh On w.id = qh.WorkOrderId Inner Join
		                        Parte p On qh.ParteID = p.iD
                        Where	qh.Status = 7		
                        Group By h.InicialesHospital
                        Order By h.InicialesHospital">
                   </asp:SqlDataSource>
                 </div>
               </div><!-- END DIV: CHART 5 -->
             </ContentTemplate>
           </asp:UpdatePanel>
         <!--</div> END DIV: ROW 3-->
       </div><!-- END DIV: DASH-BODY -->
      </div><!-- END DIV: MAIN-WRAPPER -->
<!-- HIDDEN FIELDS -->
      <asp:HiddenField ID="hidden_chrt1Width" runat="server" />
      <asp:HiddenField ID="hidden_chrt2Width" runat="server" />
      <asp:HiddenField ID="hidden_chrt3Width" runat="server" />
      <asp:HiddenField ID="hidden_chrt4Width" runat="server" Value="0" />
      <asp:HiddenField ID="hidden_chrt5Width" runat="server" Value="0" />         
</asp:Content>
