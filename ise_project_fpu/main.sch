<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_39" />
        <signal name="XLXN_42" />
        <signal name="XLXN_57" />
        <signal name="XLXN_65" />
        <signal name="XLXN_67" />
        <signal name="clk" />
        <signal name="led0" />
        <signal name="a_clk" />
        <signal name="XLXN_84(7:0)" />
        <signal name="a_cs(2:0)" />
        <signal name="XLXN_86" />
        <signal name="XLXN_90" />
        <signal name="btn_north" />
        <signal name="XLXN_101" />
        <signal name="XLXN_98" />
        <signal name="Q(15:0)" />
        <signal name="a_sdo" />
        <signal name="XLXN_113" />
        <signal name="XLXN_114" />
        <signal name="XLXN_115" />
        <signal name="XLXN_116" />
        <signal name="Q(11:0)" />
        <signal name="Q1(11:0)" />
        <signal name="XLXN_124(11:0)" />
        <signal name="XLXN_125" />
        <signal name="XLXN_126" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="a_clk" />
        <port polarity="Output" name="a_cs(2:0)" />
        <port polarity="Input" name="btn_north" />
        <port polarity="Input" name="a_sdo" />
        <port polarity="Output" name="Q1(11:0)" />
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="dcm_sp">
            <timestamp>2007-4-11T22:49:47</timestamp>
            <line x2="0" y1="-832" y2="-832" x1="64" />
            <rect width="256" x="64" y="-1024" height="960" />
            <line x2="320" y1="-960" y2="-960" x1="384" />
            <line x2="320" y1="-896" y2="-896" x1="384" />
            <line x2="320" y1="-832" y2="-832" x1="384" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-768" y2="-768" x1="384" />
            <line x2="320" y1="-640" y2="-640" x1="384" />
            <line x2="320" y1="-704" y2="-704" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <rect width="64" x="320" y="-336" height="32" />
            <line x2="80" y1="-944" y2="-960" x1="64" />
            <line x2="64" y1="-960" y2="-976" x1="80" />
            <line x2="64" y1="-288" y2="-288" x1="320" />
            <line x2="80" y1="-880" y2="-896" x1="64" />
            <line x2="64" y1="-896" y2="-912" x1="80" />
        </blockdef>
        <blockdef name="cb8ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="fdrs">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-352" y2="-352" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-320" y2="-352" x1="192" />
            <line x2="64" y1="-352" y2="-352" x1="192" />
        </blockdef>
        <blockdef name="waveform_formation">
            <timestamp>2013-4-30T13:6:11</timestamp>
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-192" height="256" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="sr16rled">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <rect width="64" x="0" y="-524" height="24" />
            <rect width="64" x="320" y="-396" height="24" />
            <rect width="256" x="64" y="-640" height="576" />
        </blockdef>
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <block symbolname="dcm_sp" name="XLXI_14">
            <attr value="25" name="CLKFX_DIVIDE">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <blockpin signalname="XLXN_67" name="CLKFB" />
            <blockpin signalname="XLXN_65" name="CLKIN" />
            <blockpin signalname="XLXN_42" name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin name="PSEN" />
            <blockpin name="PSINCDEC" />
            <blockpin signalname="XLXN_57" name="RST" />
            <blockpin signalname="XLXN_67" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin name="CLKDV" />
            <blockpin signalname="XLXN_90" name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="dcm_sp" name="XLXI_11">
            <attr value="20" name="CLKFX_DIVIDE">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <blockpin signalname="XLXN_39" name="CLKFB" />
            <blockpin signalname="clk" name="CLKIN" />
            <blockpin signalname="XLXN_42" name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin signalname="XLXN_57" name="PSEN" />
            <blockpin signalname="XLXN_57" name="PSINCDEC" />
            <blockpin signalname="XLXN_57" name="RST" />
            <blockpin signalname="XLXN_39" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin name="CLKDV" />
            <blockpin signalname="XLXN_65" name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_12">
            <blockpin signalname="XLXN_57" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_13">
            <blockpin signalname="XLXN_42" name="P" />
        </block>
        <block symbolname="cb8ce" name="XLXI_15">
            <blockpin signalname="XLXN_90" name="C" />
            <blockpin signalname="led0" name="CE" />
            <blockpin signalname="XLXN_98" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="XLXN_84(7:0)" name="Q(7:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="fdrs" name="XLXI_17">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="led0" name="D" />
            <blockpin signalname="XLXN_101" name="R" />
            <blockpin signalname="btn_north" name="S" />
            <blockpin signalname="led0" name="Q" />
        </block>
        <block symbolname="waveform_formation" name="XLXI_21">
            <blockpin signalname="XLXN_90" name="clk" />
            <blockpin signalname="XLXN_84(7:0)" name="count(7:0)" />
            <blockpin signalname="a_clk" name="spi_clk" />
            <blockpin signalname="XLXN_86" name="shift_a1" />
            <blockpin signalname="a_cs(2:0)" name="CS_low(2:0)" />
            <blockpin signalname="XLXN_101" name="stop" />
        </block>
        <block symbolname="or2" name="XLXI_22">
            <blockpin signalname="btn_north" name="I0" />
            <blockpin signalname="XLXN_101" name="I1" />
            <blockpin signalname="XLXN_98" name="O" />
        </block>
        <block symbolname="sr16rled" name="XLXI_27">
            <blockpin signalname="XLXN_90" name="C" />
            <blockpin signalname="XLXN_86" name="CE" />
            <blockpin name="D(15:0)" />
            <blockpin signalname="XLXN_115" name="L" />
            <blockpin signalname="XLXN_116" name="LEFT" />
            <blockpin signalname="XLXN_98" name="R" />
            <blockpin signalname="a_sdo" name="SLI" />
            <blockpin name="SRI" />
            <blockpin signalname="Q(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_28">
            <blockpin signalname="XLXN_115" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_29">
            <blockpin signalname="XLXN_116" name="P" />
        </block>
        <block symbolname="fd" name="XLXI_33(11:0)">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="Q(11:0)" name="D" />
            <blockpin signalname="Q1(11:0)" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="432" y="1280" name="XLXI_11" orien="R0" />
        <branch name="XLXN_39">
            <wire x2="272" y1="112" y2="384" x1="272" />
            <wire x2="432" y1="384" y2="384" x1="272" />
            <wire x2="848" y1="112" y2="112" x1="272" />
            <wire x2="848" y1="112" y2="320" x1="848" />
            <wire x2="848" y1="320" y2="320" x1="816" />
        </branch>
        <instance x="240" y="1040" name="XLXI_12" orien="R0" />
        <instance x="112" y="416" name="XLXI_13" orien="R0" />
        <branch name="XLXN_42">
            <wire x2="176" y1="416" y2="448" x1="176" />
            <wire x2="432" y1="448" y2="448" x1="176" />
            <wire x2="176" y1="448" y2="1568" x1="176" />
            <wire x2="960" y1="1568" y2="1568" x1="176" />
        </branch>
        <branch name="XLXN_57">
            <wire x2="304" y1="896" y2="912" x1="304" />
            <wire x2="400" y1="896" y2="896" x1="304" />
            <wire x2="432" y1="896" y2="896" x1="400" />
            <wire x2="400" y1="896" y2="1024" x1="400" />
            <wire x2="400" y1="1024" y2="1088" x1="400" />
            <wire x2="400" y1="1088" y2="2016" x1="400" />
            <wire x2="960" y1="2016" y2="2016" x1="400" />
            <wire x2="432" y1="1088" y2="1088" x1="400" />
            <wire x2="432" y1="1024" y2="1024" x1="400" />
        </branch>
        <instance x="960" y="2400" name="XLXI_14" orien="R0" />
        <branch name="XLXN_65">
            <wire x2="880" y1="768" y2="768" x1="816" />
            <wire x2="880" y1="768" y2="1440" x1="880" />
            <wire x2="960" y1="1440" y2="1440" x1="880" />
        </branch>
        <branch name="XLXN_67">
            <wire x2="928" y1="1232" y2="1504" x1="928" />
            <wire x2="960" y1="1504" y2="1504" x1="928" />
            <wire x2="1360" y1="1232" y2="1232" x1="928" />
            <wire x2="1360" y1="1232" y2="1440" x1="1360" />
            <wire x2="1360" y1="1440" y2="1440" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="160" y="208" name="clk" orien="R180" />
        <branch name="XLXN_84(7:0)">
            <wire x2="2448" y1="1664" y2="1664" x1="2336" />
        </branch>
        <instance x="2448" y="1696" name="XLXI_21" orien="R0">
        </instance>
        <branch name="a_cs(2:0)">
            <wire x2="2864" y1="1664" y2="1664" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="2864" y="1664" name="a_cs(2:0)" orien="R0" />
        <branch name="XLXN_86">
            <wire x2="3216" y1="560" y2="560" x1="1552" />
            <wire x2="3216" y1="560" y2="1600" x1="3216" />
            <wire x2="1552" y1="560" y2="1104" x1="1552" />
            <wire x2="1968" y1="1104" y2="1104" x1="1552" />
            <wire x2="3216" y1="1600" y2="1600" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="2912" y="1536" name="a_clk" orien="R0" />
        <branch name="a_clk">
            <wire x2="2912" y1="1536" y2="1536" x1="2832" />
        </branch>
        <branch name="XLXN_90">
            <wire x2="1584" y1="1888" y2="1888" x1="1344" />
            <wire x2="1584" y1="1168" y2="1536" x1="1584" />
            <wire x2="1584" y1="1536" y2="1792" x1="1584" />
            <wire x2="1584" y1="1792" y2="1888" x1="1584" />
            <wire x2="1952" y1="1792" y2="1792" x1="1584" />
            <wire x2="2448" y1="1536" y2="1536" x1="1584" />
            <wire x2="1968" y1="1168" y2="1168" x1="1584" />
        </branch>
        <branch name="btn_north">
            <wire x2="1664" y1="2032" y2="2032" x1="1600" />
            <wire x2="1600" y1="2032" y2="2128" x1="1600" />
            <wire x2="1744" y1="2128" y2="2128" x1="1600" />
            <wire x2="1744" y1="2128" y2="2272" x1="1744" />
            <wire x2="1872" y1="2128" y2="2128" x1="1744" />
            <wire x2="1744" y1="2272" y2="2272" x1="1680" />
        </branch>
        <instance x="1952" y="1920" name="XLXI_15" orien="R0" />
        <instance x="1664" y="2096" name="XLXI_22" orien="R0" />
        <branch name="led0">
            <wire x2="1872" y1="2224" y2="2224" x1="1808" />
            <wire x2="1808" y1="2224" y2="2512" x1="1808" />
            <wire x2="2400" y1="2512" y2="2512" x1="1808" />
            <wire x2="1952" y1="1728" y2="1728" x1="1888" />
            <wire x2="1888" y1="1728" y2="1920" x1="1888" />
            <wire x2="2400" y1="1920" y2="1920" x1="1888" />
            <wire x2="2400" y1="1920" y2="2224" x1="2400" />
            <wire x2="2400" y1="2224" y2="2512" x1="2400" />
            <wire x2="2400" y1="2224" y2="2224" x1="2256" />
        </branch>
        <branch name="XLXN_101">
            <wire x2="1600" y1="1904" y2="1968" x1="1600" />
            <wire x2="1664" y1="1968" y2="1968" x1="1600" />
            <wire x2="2912" y1="1904" y2="1904" x1="1600" />
            <wire x2="2912" y1="1904" y2="2496" x1="2912" />
            <wire x2="1872" y1="2448" y2="2496" x1="1872" />
            <wire x2="2912" y1="2496" y2="2496" x1="1872" />
            <wire x2="2912" y1="1728" y2="1728" x1="2832" />
            <wire x2="2912" y1="1728" y2="1904" x1="2912" />
        </branch>
        <instance x="1872" y="2480" name="XLXI_17" orien="R0" />
        <iomarker fontsize="28" x="1680" y="2272" name="btn_north" orien="R180" />
        <branch name="XLXN_98">
            <wire x2="1968" y1="1264" y2="1264" x1="1840" />
            <wire x2="1840" y1="1264" y2="1936" x1="1840" />
            <wire x2="1952" y1="1936" y2="1936" x1="1840" />
            <wire x2="1952" y1="1936" y2="2000" x1="1952" />
            <wire x2="1952" y1="2000" y2="2000" x1="1920" />
            <wire x2="1952" y1="1888" y2="1936" x1="1952" />
        </branch>
        <branch name="Q(15:0)">
            <wire x2="2512" y1="912" y2="912" x1="2352" />
            <wire x2="2512" y1="912" y2="992" x1="2512" />
            <wire x2="2512" y1="992" y2="1008" x1="2512" />
        </branch>
        <bustap x2="2608" y1="992" y2="992" x1="2512" />
        <instance x="1968" y="1296" name="XLXI_27" orien="R0" />
        <branch name="a_sdo">
            <wire x2="1968" y1="720" y2="720" x1="1776" />
        </branch>
        <iomarker fontsize="28" x="1776" y="720" name="a_sdo" orien="R180" />
        <instance x="1648" y="1024" name="XLXI_28" orien="R0" />
        <branch name="XLXN_115">
            <wire x2="1712" y1="816" y2="896" x1="1712" />
            <wire x2="1792" y1="816" y2="816" x1="1712" />
            <wire x2="1792" y1="816" y2="896" x1="1792" />
            <wire x2="1872" y1="896" y2="896" x1="1792" />
            <wire x2="1872" y1="896" y2="976" x1="1872" />
            <wire x2="1968" y1="976" y2="976" x1="1872" />
        </branch>
        <instance x="1744" y="1040" name="XLXI_29" orien="R0" />
        <branch name="XLXN_116">
            <wire x2="1808" y1="1040" y2="1088" x1="1808" />
            <wire x2="1904" y1="1088" y2="1088" x1="1808" />
            <wire x2="1904" y1="1040" y2="1088" x1="1904" />
            <wire x2="1968" y1="1040" y2="1040" x1="1904" />
        </branch>
        <branch name="Q(11:0)">
            <wire x2="2656" y1="992" y2="992" x1="2608" />
        </branch>
        <instance x="2656" y="1248" name="XLXI_33(11:0)" orien="R0" />
        <branch name="Q1(11:0)">
            <wire x2="3232" y1="992" y2="992" x1="3040" />
            <wire x2="3232" y1="992" y2="1008" x1="3232" />
            <wire x2="3312" y1="1008" y2="1008" x1="3232" />
        </branch>
        <iomarker fontsize="28" x="3312" y="1008" name="Q1(11:0)" orien="R0" />
        <branch name="clk">
            <wire x2="368" y1="208" y2="208" x1="160" />
            <wire x2="416" y1="208" y2="208" x1="368" />
            <wire x2="416" y1="208" y2="320" x1="416" />
            <wire x2="432" y1="320" y2="320" x1="416" />
            <wire x2="368" y1="208" y2="2352" x1="368" />
            <wire x2="1872" y1="2352" y2="2352" x1="368" />
            <wire x2="368" y1="176" y2="208" x1="368" />
            <wire x2="1424" y1="176" y2="176" x1="368" />
            <wire x2="1424" y1="176" y2="1360" x1="1424" />
            <wire x2="2448" y1="1360" y2="1360" x1="1424" />
            <wire x2="2656" y1="1120" y2="1120" x1="2448" />
            <wire x2="2448" y1="1120" y2="1360" x1="2448" />
        </branch>
    </sheet>
</drawing>