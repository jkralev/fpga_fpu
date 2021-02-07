<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="E_TXD(0:3)" />
        <signal name="E_TX_CLK" />
        <signal name="led0" />
        <signal name="XLXN_151" />
        <signal name="XLXN_179" />
        <signal name="E_TX_EN" />
        <signal name="XLXN_181" />
        <signal name="XLXN_182" />
        <signal name="XLXN_183" />
        <signal name="XLXN_184" />
        <signal name="XLXN_191" />
        <signal name="XLXN_201(7:0)" />
        <signal name="XLXN_242(10:0)" />
        <signal name="XLXN_247" />
        <signal name="E_RXD(0:3)" />
        <signal name="E_RX_ER" />
        <signal name="E_RX_DV" />
        <signal name="E_RX_CLK" />
        <signal name="XLXN_269" />
        <signal name="XLXN_270" />
        <signal name="XLXN_272(10:0)" />
        <signal name="XLXN_277" />
        <signal name="XLXN_278" />
        <signal name="E_TX_ER" />
        <signal name="XLXN_271" />
        <signal name="XLXN_401" />
        <signal name="XLXN_448" />
        <signal name="XLXN_376" />
        <signal name="XLXN_705(11:0)" />
        <signal name="XLXN_706" />
        <signal name="XLXN_708" />
        <signal name="XLXN_709(11:0)" />
        <signal name="XLXN_710(31:0)" />
        <signal name="XLXN_326" />
        <signal name="XLXN_441" />
        <signal name="XLXN_716" />
        <signal name="XLXN_718(15:0)" />
        <signal name="XLXN_734(31:0)" />
        <signal name="XLXN_736(3:0)" />
        <signal name="XLXN_739" />
        <signal name="XLXN_741(13:0)" />
        <signal name="XLXN_743(7:0)" />
        <signal name="XLXN_740(7:0)" />
        <signal name="XLXN_751(13:0)" />
        <signal name="XLXN_753(7:0)" />
        <signal name="XLXN_276(0:7)" />
        <signal name="XLXN_737(10:0)" />
        <signal name="clk" />
        <signal name="XLXN_760(31:0)" />
        <signal name="XLXN_761(31:0)" />
        <signal name="XLXN_762(31:0)" />
        <signal name="XLXN_763(31:0)" />
        <signal name="XLXN_786(31:0)" />
        <signal name="XLXN_787(31:0)" />
        <signal name="a_cs(2:0)" />
        <signal name="a_clk" />
        <signal name="a_sdo" />
        <signal name="XLXN_805" />
        <signal name="XLXN_807(31:0)" />
        <signal name="XLXN_808(31:0)" />
        <signal name="a_sdi" />
        <signal name="XLXN_810(11:0)" />
        <signal name="XLXN_812(11:0)" />
        <signal name="XLXN_814(11:0)" />
        <signal name="XLXN_815(11:0)" />
        <port polarity="Output" name="E_TXD(0:3)" />
        <port polarity="Input" name="E_TX_CLK" />
        <port polarity="Output" name="led0" />
        <port polarity="Output" name="XLXN_179" />
        <port polarity="Output" name="E_TX_EN" />
        <port polarity="Output" name="XLXN_184" />
        <port polarity="Input" name="E_RXD(0:3)" />
        <port polarity="Input" name="E_RX_ER" />
        <port polarity="Input" name="E_RX_DV" />
        <port polarity="Input" name="E_RX_CLK" />
        <port polarity="Output" name="XLXN_269" />
        <port polarity="Output" name="XLXN_270" />
        <port polarity="Output" name="E_TX_ER" />
        <port polarity="Output" name="XLXN_401" />
        <port polarity="Output" name="XLXN_326" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="a_cs(2:0)" />
        <port polarity="Output" name="a_clk" />
        <port polarity="Input" name="a_sdo" />
        <port polarity="Output" name="a_sdi" />
        <blockdef name="test_lan">
            <timestamp>2012-12-17T20:24:54</timestamp>
            <rect width="304" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-320" y2="-320" x1="368" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <rect width="64" x="368" y="-140" height="24" />
            <line x2="432" y1="-128" y2="-128" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="Generator1">
            <timestamp>2012-11-2T12:31:30</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="ram1dual">
            <timestamp>2012-11-2T15:30:9</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
        </blockdef>
        <blockdef name="rom1">
            <timestamp>2012-12-17T20:22:43</timestamp>
            <rect width="352" x="64" y="-448" height="448" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="416" y="-428" height="24" />
            <line x2="480" y1="-416" y2="-416" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <blockdef name="ram1">
            <timestamp>2013-1-9T19:50:48</timestamp>
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="256" x="64" y="-320" height="448" />
        </blockdef>
        <blockdef name="test_rx">
            <timestamp>2012-11-2T12:32:57</timestamp>
            <rect width="320" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <rect width="64" x="384" y="-172" height="24" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
        </blockdef>
        <blockdef name="Timer10ms">
            <timestamp>2012-11-3T9:52:47</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="real_control">
            <timestamp>2012-11-15T8:43:44</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="prog_mem">
            <timestamp>2012-12-17T16:28:8</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="contr1_conv">
            <timestamp>2013-3-4T20:13:43</timestamp>
            <rect width="64" x="432" y="36" height="24" />
            <line x2="496" y1="48" y2="48" x1="432" />
            <rect width="64" x="432" y="84" height="24" />
            <line x2="496" y1="96" y2="96" x1="432" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <rect width="64" x="0" y="-12" height="24" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <rect width="64" x="432" y="-108" height="24" />
            <line x2="496" y1="-96" y2="-96" x1="432" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="496" y1="-992" y2="-992" x1="432" />
            <line x2="496" y1="-928" y2="-928" x1="432" />
            <rect width="64" x="432" y="-892" height="24" />
            <line x2="496" y1="-880" y2="-880" x1="432" />
            <rect width="64" x="432" y="-828" height="24" />
            <line x2="496" y1="-816" y2="-816" x1="432" />
            <rect width="64" x="432" y="-716" height="24" />
            <line x2="496" y1="-704" y2="-704" x1="432" />
            <rect width="64" x="432" y="-652" height="24" />
            <line x2="496" y1="-640" y2="-640" x1="432" />
            <line x2="496" y1="-512" y2="-512" x1="432" />
            <rect width="64" x="432" y="-476" height="24" />
            <line x2="496" y1="-464" y2="-464" x1="432" />
            <rect width="64" x="432" y="-412" height="24" />
            <line x2="496" y1="-400" y2="-400" x1="432" />
            <rect width="64" x="432" y="-252" height="24" />
            <line x2="496" y1="-240" y2="-240" x1="432" />
            <rect width="64" x="432" y="-188" height="24" />
            <line x2="496" y1="-176" y2="-176" x1="432" />
            <rect width="64" x="432" y="-1052" height="24" />
            <line x2="496" y1="-1040" y2="-1040" x1="432" />
            <rect width="64" x="0" y="-156" height="24" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-988" height="24" />
            <line x2="0" y1="-976" y2="-976" x1="64" />
            <line x2="0" y1="-896" y2="-896" x1="64" />
            <rect width="368" x="64" y="-1088" height="1264" />
        </blockdef>
        <blockdef name="fp_wrapper">
            <timestamp>2013-2-8T22:25:21</timestamp>
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="256" x="64" y="-128" height="192" />
        </blockdef>
        <blockdef name="int2single">
            <timestamp>2013-4-30T14:55:15</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="ab_contr">
            <timestamp>2013-5-7T16:53:29</timestamp>
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="0" y="148" height="24" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-256" height="448" />
        </blockdef>
        <blockdef name="single_int">
            <timestamp>2013-5-7T17:5:56</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="test_lan" name="XLXI_5">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_183" name="reset" />
            <blockpin signalname="XLXN_151" name="clk_enable" />
            <blockpin signalname="E_TX_CLK" name="TX_CLK" />
            <blockpin signalname="XLXN_182" name="btn_1" />
            <blockpin signalname="XLXN_201(7:0)" name="Data_out(7:0)" />
            <blockpin signalname="XLXN_179" name="ce_out" />
            <blockpin signalname="led0" name="led_0" />
            <blockpin signalname="E_TX_EN" name="tx_en" />
            <blockpin signalname="E_TXD(0:3)" name="tx_data(0:3)" />
            <blockpin signalname="XLXN_242(10:0)" name="Address(10:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_41">
            <blockpin signalname="XLXN_151" name="P" />
        </block>
        <block symbolname="Generator1" name="XLXI_53">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_181" name="reset" />
            <blockpin signalname="XLXN_191" name="clk_enable" />
            <blockpin signalname="E_TX_EN" name="event_r" />
            <blockpin signalname="XLXN_706" name="send" />
            <blockpin signalname="XLXN_184" name="ce_out" />
            <blockpin signalname="XLXN_182" name="out_event" />
            <blockpin signalname="XLXN_183" name="res_tr" />
        </block>
        <block symbolname="gnd" name="XLXI_40">
            <blockpin signalname="XLXN_181" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_54">
            <blockpin signalname="XLXN_191" name="P" />
        </block>
        <block symbolname="rom1" name="XLXI_56">
            <blockpin signalname="XLXN_242(10:0)" name="Address(10:0)" />
            <blockpin signalname="XLXN_736(3:0)" name="Select_mem(3:0)" />
            <blockpin signalname="XLXN_753(7:0)" name="Data_out1(7:0)" />
            <blockpin signalname="XLXN_201(7:0)" name="Data(7:0)" />
            <blockpin signalname="XLXN_751(13:0)" name="Address2(13:0)" />
        </block>
        <block symbolname="ram1dual" name="XLXI_55">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_739" name="we" />
            <blockpin signalname="XLXN_448" name="en" />
            <blockpin signalname="XLXN_741(13:0)" name="addrw(13:0)" />
            <blockpin signalname="XLXN_751(13:0)" name="addrr(13:0)" />
            <blockpin signalname="XLXN_740(7:0)" name="di(7:0)" />
            <blockpin signalname="XLXN_753(7:0)" name="do(7:0)" />
        </block>
        <block symbolname="ram1" name="XLXI_62">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_271" name="we" />
            <blockpin signalname="XLXN_247" name="en" />
            <blockpin signalname="XLXN_276(0:7)" name="di(7:0)" />
            <blockpin signalname="XLXN_743(7:0)" name="do(7:0)" />
            <blockpin signalname="XLXN_272(10:0)" name="addrw(10:0)" />
            <blockpin signalname="XLXN_737(10:0)" name="addrr(10:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_63">
            <blockpin signalname="XLXN_247" name="P" />
        </block>
        <block symbolname="test_rx" name="XLXI_66">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_278" name="reset" />
            <blockpin signalname="XLXN_277" name="clk_enable" />
            <blockpin signalname="E_RX_CLK" name="RX_CLK" />
            <blockpin signalname="E_RX_DV" name="RX_DV" />
            <blockpin signalname="E_RX_ER" name="RX_ER" />
            <blockpin signalname="E_RXD(0:3)" name="RX_D(0:3)" />
            <blockpin signalname="XLXN_269" name="ce_out" />
            <blockpin signalname="XLXN_270" name="BRAM_clk" />
            <blockpin signalname="XLXN_271" name="BRAM_en" />
            <blockpin signalname="XLXN_401" name="read_ev" />
            <blockpin signalname="XLXN_272(10:0)" name="BRAM_addr(10:0)" />
            <blockpin signalname="XLXN_276(0:7)" name="BRAM_data(0:7)" />
        </block>
        <block symbolname="vcc" name="XLXI_67">
            <blockpin signalname="XLXN_277" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_68">
            <blockpin signalname="XLXN_278" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_69">
            <blockpin signalname="E_TX_ER" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_95">
            <blockpin signalname="XLXN_448" name="P" />
        </block>
        <block symbolname="contr1_conv" name="XLXI_148">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_805" name="Timer_ISR" />
            <blockpin signalname="XLXN_718(15:0)" name="Instruction(15:0)" />
            <blockpin signalname="XLXN_734(31:0)" name="Data_RAM_in(31:0)" />
            <blockpin signalname="XLXN_762(31:0)" name="FPU_Result(31:0)" />
            <blockpin signalname="XLXN_743(7:0)" name="BRAM_out(7:0)" />
            <blockpin signalname="XLXN_807(31:0)" name="adc1(31:0)" />
            <blockpin signalname="XLXN_808(31:0)" name="adc2(31:0)" />
            <blockpin signalname="XLXN_708" name="Write_RAM" />
            <blockpin signalname="XLXN_706" name="trig_pack" />
            <blockpin signalname="XLXN_739" name="write_outram" />
            <blockpin signalname="XLXN_705(11:0)" name="Instruction_address(11:0)" />
            <blockpin signalname="XLXN_709(11:0)" name="RAM_Addr(11:0)" />
            <blockpin signalname="XLXN_710(31:0)" name="Data_RAM(31:0)" />
            <blockpin signalname="XLXN_760(31:0)" name="FPU_Op1(31:0)" />
            <blockpin signalname="XLXN_761(31:0)" name="FPU_Op2(31:0)" />
            <blockpin signalname="XLXN_763(31:0)" name="FPU_Op3(31:0)" />
            <blockpin signalname="XLXN_737(10:0)" name="BRAM_addr(10:0)" />
            <blockpin signalname="XLXN_736(3:0)" name="select_mem(3:0)" />
            <blockpin signalname="XLXN_740(7:0)" name="data_outram(7:0)" />
            <blockpin signalname="XLXN_741(13:0)" name="addr_outram(13:0)" />
            <blockpin signalname="XLXN_786(31:0)" name="dac1(31:0)" />
            <blockpin signalname="XLXN_787(31:0)" name="dac2(31:0)" />
        </block>
        <block symbolname="real_control" name="XLXI_78">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_708" name="we" />
            <blockpin signalname="XLXN_376" name="en" />
            <blockpin signalname="XLXN_709(11:0)" name="addr(11:0)" />
            <blockpin signalname="XLXN_710(31:0)" name="di(31:0)" />
            <blockpin signalname="XLXN_734(31:0)" name="do(31:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_79">
            <blockpin signalname="XLXN_376" name="P" />
        </block>
        <block symbolname="prog_mem" name="XLXI_80">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_376" name="en" />
            <blockpin signalname="XLXN_705(11:0)" name="addr(11:0)" />
            <blockpin signalname="XLXN_718(15:0)" name="do(15:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_74">
            <blockpin signalname="XLXN_441" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_75">
            <blockpin signalname="XLXN_716" name="G" />
        </block>
        <block symbolname="Timer10ms" name="XLXI_70">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_716" name="reset" />
            <blockpin signalname="XLXN_441" name="clk_enable" />
            <blockpin signalname="XLXN_326" name="ce_out" />
            <blockpin signalname="XLXN_805" name="ModelTick" />
        </block>
        <block symbolname="fp_wrapper" name="XLXI_150">
            <blockpin signalname="XLXN_760(31:0)" name="A(31:0)" />
            <blockpin signalname="XLXN_761(31:0)" name="B(31:0)" />
            <blockpin signalname="XLXN_762(31:0)" name="C(31:0)" />
            <blockpin signalname="XLXN_763(31:0)" name="ACC(31:0)" />
        </block>
        <block symbolname="int2single" name="XLXI_161">
            <blockpin signalname="XLXN_812(11:0)" name="sig_buf_i(11:0)" />
            <blockpin signalname="XLXN_807(31:0)" name="sig(31:0)" />
        </block>
        <block symbolname="ab_contr" name="XLXI_162">
            <blockpin signalname="a_sdo" name="sdo" />
            <blockpin signalname="XLXN_805" name="tick" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="a_sdi" name="sdi" />
            <blockpin signalname="a_clk" name="spic" />
            <blockpin signalname="a_cs(2:0)" name="csl(2:0)" />
            <blockpin signalname="XLXN_812(11:0)" name="adc1(11:0)" />
            <blockpin signalname="XLXN_810(11:0)" name="adc2(11:0)" />
            <blockpin signalname="XLXN_814(11:0)" name="dac1(11:0)" />
            <blockpin signalname="XLXN_815(11:0)" name="dac2(11:0)" />
        </block>
        <block symbolname="int2single" name="XLXI_163">
            <blockpin signalname="XLXN_810(11:0)" name="sig_buf_i(11:0)" />
            <blockpin signalname="XLXN_808(31:0)" name="sig(31:0)" />
        </block>
        <block symbolname="single_int" name="XLXI_164">
            <blockpin signalname="XLXN_786(31:0)" name="sigf(31:0)" />
            <blockpin signalname="XLXN_814(11:0)" name="sigi(11:0)" />
        </block>
        <block symbolname="single_int" name="XLXI_165">
            <blockpin signalname="XLXN_787(31:0)" name="sigf(31:0)" />
            <blockpin signalname="XLXN_815(11:0)" name="sigi(11:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="4512" y="2400" name="XLXI_5" orien="R0">
        </instance>
        <branch name="E_TX_CLK">
            <wire x2="4512" y1="2176" y2="2176" x1="4480" />
        </branch>
        <branch name="led0">
            <wire x2="5088" y1="2080" y2="2080" x1="4944" />
        </branch>
        <instance x="4160" y="1920" name="XLXI_41" orien="R0" />
        <branch name="XLXN_151">
            <wire x2="4224" y1="1920" y2="2112" x1="4224" />
            <wire x2="4512" y1="2112" y2="2112" x1="4224" />
        </branch>
        <branch name="XLXN_179">
            <wire x2="5088" y1="1984" y2="1984" x1="4944" />
        </branch>
        <branch name="E_TX_EN">
            <wire x2="3232" y1="1760" y2="2256" x1="3232" />
            <wire x2="3312" y1="2256" y2="2256" x1="3232" />
            <wire x2="4928" y1="1760" y2="1760" x1="3232" />
            <wire x2="4928" y1="1760" y2="1904" x1="4928" />
            <wire x2="5008" y1="1904" y2="1904" x1="4928" />
            <wire x2="5008" y1="1904" y2="2176" x1="5008" />
            <wire x2="5088" y1="2176" y2="2176" x1="5008" />
            <wire x2="5008" y1="2176" y2="2176" x1="4944" />
        </branch>
        <instance x="3312" y="2352" name="XLXI_53" orien="R0">
        </instance>
        <instance x="3072" y="2064" name="XLXI_40" orien="R90" />
        <branch name="XLXN_181">
            <wire x2="3312" y1="2128" y2="2128" x1="3200" />
        </branch>
        <branch name="XLXN_182">
            <wire x2="4096" y1="2192" y2="2192" x1="3696" />
            <wire x2="4096" y1="2192" y2="2240" x1="4096" />
            <wire x2="4512" y1="2240" y2="2240" x1="4096" />
        </branch>
        <branch name="XLXN_183">
            <wire x2="4080" y1="2320" y2="2320" x1="3696" />
            <wire x2="4080" y1="2048" y2="2320" x1="4080" />
            <wire x2="4512" y1="2048" y2="2048" x1="4080" />
        </branch>
        <branch name="XLXN_184">
            <wire x2="3728" y1="2064" y2="2064" x1="3696" />
        </branch>
        <instance x="3120" y="2256" name="XLXI_54" orien="R270" />
        <branch name="XLXN_191">
            <wire x2="3312" y1="2192" y2="2192" x1="3120" />
        </branch>
        <instance x="3584" y="2912" name="XLXI_56" orien="R0">
        </instance>
        <branch name="XLXN_201(7:0)">
            <wire x2="4224" y1="2496" y2="2496" x1="4064" />
            <wire x2="4224" y1="2304" y2="2496" x1="4224" />
            <wire x2="4512" y1="2304" y2="2304" x1="4224" />
        </branch>
        <instance x="2880" y="3168" name="XLXI_55" orien="R0">
        </instance>
        <instance x="2176" y="1856" name="XLXI_62" orien="R0">
        </instance>
        <branch name="XLXN_242(10:0)">
            <wire x2="3504" y1="2448" y2="2496" x1="3504" />
            <wire x2="3584" y1="2496" y2="2496" x1="3504" />
            <wire x2="5024" y1="2448" y2="2448" x1="3504" />
            <wire x2="5024" y1="2368" y2="2368" x1="4944" />
            <wire x2="5024" y1="2368" y2="2448" x1="5024" />
        </branch>
        <instance x="2080" y="1760" name="XLXI_63" orien="R270" />
        <branch name="XLXN_247">
            <wire x2="2176" y1="1696" y2="1696" x1="2080" />
        </branch>
        <instance x="1440" y="1312" name="XLXI_66" orien="R0">
        </instance>
        <branch name="E_RXD(0:3)">
            <wire x2="1440" y1="1280" y2="1280" x1="1408" />
        </branch>
        <branch name="E_RX_ER">
            <wire x2="1440" y1="1216" y2="1216" x1="1408" />
        </branch>
        <branch name="E_RX_DV">
            <wire x2="1440" y1="1152" y2="1152" x1="1408" />
        </branch>
        <branch name="E_RX_CLK">
            <wire x2="1440" y1="1088" y2="1088" x1="1408" />
        </branch>
        <branch name="XLXN_269">
            <wire x2="1920" y1="896" y2="896" x1="1888" />
        </branch>
        <branch name="XLXN_270">
            <wire x2="1920" y1="960" y2="960" x1="1888" />
        </branch>
        <branch name="XLXN_272(10:0)">
            <wire x2="2000" y1="1440" y2="1440" x1="1328" />
            <wire x2="1328" y1="1440" y2="1888" x1="1328" />
            <wire x2="2176" y1="1888" y2="1888" x1="1328" />
            <wire x2="2000" y1="1152" y2="1152" x1="1888" />
            <wire x2="2000" y1="1152" y2="1440" x1="2000" />
        </branch>
        <instance x="1264" y="1088" name="XLXI_67" orien="R270" />
        <branch name="XLXN_277">
            <wire x2="1440" y1="1024" y2="1024" x1="1264" />
        </branch>
        <instance x="1200" y="896" name="XLXI_68" orien="R90" />
        <branch name="XLXN_278">
            <wire x2="1440" y1="960" y2="960" x1="1328" />
        </branch>
        <instance x="4976" y="1712" name="XLXI_69" orien="R90" />
        <branch name="E_TX_ER">
            <wire x2="5136" y1="1776" y2="1776" x1="5104" />
        </branch>
        <branch name="XLXN_271">
            <wire x2="2112" y1="1024" y2="1024" x1="1888" />
            <wire x2="2112" y1="1024" y2="1632" x1="2112" />
            <wire x2="2176" y1="1632" y2="1632" x1="2112" />
        </branch>
        <branch name="XLXN_401">
            <wire x2="1920" y1="1088" y2="1088" x1="1888" />
        </branch>
        <instance x="2784" y="3008" name="XLXI_95" orien="R270" />
        <branch name="XLXN_448">
            <wire x2="2880" y1="2944" y2="2944" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="4480" y="2176" name="E_TX_CLK" orien="R180" />
        <iomarker fontsize="28" x="3728" y="2064" name="XLXN_184" orien="R0" />
        <iomarker fontsize="28" x="5088" y="2176" name="E_TX_EN" orien="R0" />
        <iomarker fontsize="28" x="1408" y="1280" name="E_RXD(0:3)" orien="R180" />
        <iomarker fontsize="28" x="1408" y="1216" name="E_RX_ER" orien="R180" />
        <iomarker fontsize="28" x="1408" y="1152" name="E_RX_DV" orien="R180" />
        <iomarker fontsize="28" x="1408" y="1088" name="E_RX_CLK" orien="R180" />
        <iomarker fontsize="28" x="1920" y="896" name="XLXN_269" orien="R0" />
        <iomarker fontsize="28" x="1920" y="960" name="XLXN_270" orien="R0" />
        <iomarker fontsize="28" x="5136" y="1776" name="E_TX_ER" orien="R0" />
        <iomarker fontsize="28" x="5088" y="2272" name="E_TXD(0:3)" orien="R0" />
        <iomarker fontsize="28" x="5088" y="2080" name="led0" orien="R0" />
        <iomarker fontsize="28" x="5088" y="1984" name="XLXN_179" orien="R0" />
        <iomarker fontsize="28" x="1920" y="1088" name="XLXN_401" orien="R0" />
        <branch name="E_TXD(0:3)">
            <wire x2="5088" y1="2272" y2="2272" x1="4944" />
        </branch>
        <instance x="1200" y="3328" name="XLXI_148" orien="R0">
        </instance>
        <instance x="2096" y="2928" name="XLXI_78" orien="R0">
        </instance>
        <branch name="XLXN_376">
            <wire x2="2048" y1="3056" y2="3056" x1="2032" />
            <wire x2="2048" y1="3056" y2="3232" x1="2048" />
            <wire x2="2128" y1="3232" y2="3232" x1="2048" />
            <wire x2="2048" y1="2768" y2="3056" x1="2048" />
            <wire x2="2096" y1="2768" y2="2768" x1="2048" />
        </branch>
        <instance x="2128" y="3328" name="XLXI_80" orien="R0">
        </instance>
        <iomarker fontsize="28" x="448" y="896" name="clk" orien="R180" />
        <branch name="XLXN_705(11:0)">
            <wire x2="1904" y1="2288" y2="2288" x1="1696" />
            <wire x2="1904" y1="2288" y2="3296" x1="1904" />
            <wire x2="2128" y1="3296" y2="3296" x1="1904" />
        </branch>
        <branch name="XLXN_706">
            <wire x2="2496" y1="2336" y2="2336" x1="1696" />
            <wire x2="2496" y1="2320" y2="2336" x1="2496" />
            <wire x2="3312" y1="2320" y2="2320" x1="2496" />
        </branch>
        <branch name="XLXN_708">
            <wire x2="1888" y1="2816" y2="2816" x1="1696" />
            <wire x2="1888" y1="2704" y2="2816" x1="1888" />
            <wire x2="2096" y1="2704" y2="2704" x1="1888" />
        </branch>
        <branch name="XLXN_709(11:0)">
            <wire x2="1888" y1="2864" y2="2864" x1="1696" />
            <wire x2="1888" y1="2832" y2="2864" x1="1888" />
            <wire x2="2096" y1="2832" y2="2832" x1="1888" />
        </branch>
        <branch name="XLXN_710(31:0)">
            <wire x2="1888" y1="2928" y2="2928" x1="1696" />
            <wire x2="1888" y1="2896" y2="2928" x1="1888" />
            <wire x2="2096" y1="2896" y2="2896" x1="1888" />
        </branch>
        <branch name="XLXN_326">
            <wire x2="464" y1="2816" y2="2816" x1="384" />
        </branch>
        <instance x="672" y="3184" name="XLXI_74" orien="R270" />
        <instance x="656" y="3120" name="XLXI_75" orien="R90" />
        <instance x="848" y="2976" name="XLXI_70" orien="M0">
        </instance>
        <branch name="XLXN_441">
            <wire x2="896" y1="3120" y2="3120" x1="672" />
            <wire x2="896" y1="2944" y2="2944" x1="848" />
            <wire x2="896" y1="2944" y2="3120" x1="896" />
        </branch>
        <iomarker fontsize="28" x="384" y="2816" name="XLXN_326" orien="R180" />
        <branch name="XLXN_716">
            <wire x2="912" y1="3184" y2="3184" x1="784" />
            <wire x2="912" y1="2880" y2="2880" x1="848" />
            <wire x2="912" y1="2880" y2="3184" x1="912" />
        </branch>
        <branch name="XLXN_718(15:0)">
            <wire x2="1200" y1="2352" y2="2352" x1="960" />
            <wire x2="960" y1="2352" y2="3552" x1="960" />
            <wire x2="2592" y1="3552" y2="3552" x1="960" />
            <wire x2="2592" y1="3168" y2="3168" x1="2512" />
            <wire x2="2592" y1="3168" y2="3552" x1="2592" />
        </branch>
        <branch name="XLXN_734(31:0)">
            <wire x2="1024" y1="2128" y2="2784" x1="1024" />
            <wire x2="1200" y1="2784" y2="2784" x1="1024" />
            <wire x2="2576" y1="2128" y2="2128" x1="1024" />
            <wire x2="2576" y1="2128" y2="2640" x1="2576" />
            <wire x2="2576" y1="2640" y2="2640" x1="2480" />
        </branch>
        <branch name="XLXN_736(3:0)">
            <wire x2="1968" y1="2688" y2="2688" x1="1696" />
            <wire x2="2544" y1="2528" y2="2528" x1="1968" />
            <wire x2="2544" y1="2528" y2="2624" x1="2544" />
            <wire x2="3584" y1="2624" y2="2624" x1="2544" />
            <wire x2="1968" y1="2528" y2="2688" x1="1968" />
        </branch>
        <branch name="XLXN_739">
            <wire x2="2528" y1="2400" y2="2400" x1="1696" />
            <wire x2="2528" y1="2400" y2="2880" x1="2528" />
            <wire x2="2880" y1="2880" y2="2880" x1="2528" />
        </branch>
        <branch name="XLXN_741(13:0)">
            <wire x2="1760" y1="2512" y2="2512" x1="1696" />
            <wire x2="1760" y1="2512" y2="3008" x1="1760" />
            <wire x2="2880" y1="3008" y2="3008" x1="1760" />
        </branch>
        <instance x="2032" y="3120" name="XLXI_79" orien="R270" />
        <branch name="XLXN_740(7:0)">
            <wire x2="2608" y1="2448" y2="2448" x1="1696" />
            <wire x2="2608" y1="2448" y2="3136" x1="2608" />
            <wire x2="2880" y1="3136" y2="3136" x1="2608" />
        </branch>
        <branch name="XLXN_751(13:0)">
            <wire x2="2880" y1="3072" y2="3072" x1="2752" />
            <wire x2="2752" y1="3072" y2="3296" x1="2752" />
            <wire x2="4160" y1="3296" y2="3296" x1="2752" />
            <wire x2="4160" y1="2880" y2="2880" x1="4064" />
            <wire x2="4160" y1="2880" y2="3296" x1="4160" />
        </branch>
        <branch name="XLXN_743(7:0)">
            <wire x2="1184" y1="2016" y2="2592" x1="1184" />
            <wire x2="1200" y1="2592" y2="2592" x1="1184" />
            <wire x2="2624" y1="2016" y2="2016" x1="1184" />
            <wire x2="2624" y1="1568" y2="1568" x1="2560" />
            <wire x2="2624" y1="1568" y2="2016" x1="2624" />
        </branch>
        <branch name="XLXN_753(7:0)">
            <wire x2="3584" y1="2816" y2="2816" x1="3264" />
        </branch>
        <branch name="XLXN_276(0:7)">
            <wire x2="1920" y1="1216" y2="1216" x1="1888" />
            <wire x2="1920" y1="1216" y2="1824" x1="1920" />
            <wire x2="2176" y1="1824" y2="1824" x1="1920" />
        </branch>
        <branch name="XLXN_737(10:0)">
            <wire x2="1792" y1="2624" y2="2624" x1="1696" />
            <wire x2="1792" y1="1952" y2="2624" x1="1792" />
            <wire x2="2176" y1="1952" y2="1952" x1="1792" />
        </branch>
        <instance x="1856" y="3792" name="XLXI_150" orien="R0">
        </instance>
        <branch name="XLXN_760(31:0)">
            <wire x2="1776" y1="3088" y2="3088" x1="1696" />
            <wire x2="1776" y1="3088" y2="3696" x1="1776" />
            <wire x2="1856" y1="3696" y2="3696" x1="1776" />
        </branch>
        <branch name="XLXN_761(31:0)">
            <wire x2="1760" y1="3152" y2="3152" x1="1696" />
            <wire x2="1760" y1="3152" y2="3760" x1="1760" />
            <wire x2="1856" y1="3760" y2="3760" x1="1760" />
        </branch>
        <branch name="XLXN_762(31:0)">
            <wire x2="1200" y1="3184" y2="3184" x1="1152" />
            <wire x2="1152" y1="3184" y2="3872" x1="1152" />
            <wire x2="2416" y1="3872" y2="3872" x1="1152" />
            <wire x2="2416" y1="3696" y2="3696" x1="2240" />
            <wire x2="2416" y1="3696" y2="3872" x1="2416" />
        </branch>
        <branch name="XLXN_763(31:0)">
            <wire x2="1728" y1="3232" y2="3232" x1="1696" />
            <wire x2="1728" y1="3232" y2="3824" x1="1728" />
            <wire x2="1856" y1="3824" y2="3824" x1="1728" />
        </branch>
        <branch name="clk">
            <wire x2="1040" y1="3296" y2="3296" x1="272" />
            <wire x2="272" y1="3296" y2="4192" x1="272" />
            <wire x2="1088" y1="4192" y2="4192" x1="272" />
            <wire x2="704" y1="896" y2="896" x1="448" />
            <wire x2="1440" y1="896" y2="896" x1="704" />
            <wire x2="704" y1="896" y2="1568" x1="704" />
            <wire x2="2176" y1="1568" y2="1568" x1="704" />
            <wire x2="704" y1="1568" y2="2272" x1="704" />
            <wire x2="864" y1="2272" y2="2272" x1="704" />
            <wire x2="960" y1="2272" y2="2272" x1="864" />
            <wire x2="1200" y1="2272" y2="2272" x1="960" />
            <wire x2="864" y1="2272" y2="2816" x1="864" />
            <wire x2="1040" y1="2816" y2="2816" x1="864" />
            <wire x2="1040" y1="2816" y2="3296" x1="1040" />
            <wire x2="864" y1="2816" y2="2816" x1="848" />
            <wire x2="2064" y1="2064" y2="2064" x1="960" />
            <wire x2="2064" y1="2064" y2="2640" x1="2064" />
            <wire x2="2096" y1="2640" y2="2640" x1="2064" />
            <wire x2="2064" y1="2640" y2="3168" x1="2064" />
            <wire x2="2128" y1="3168" y2="3168" x1="2064" />
            <wire x2="2688" y1="2064" y2="2064" x1="2064" />
            <wire x2="2688" y1="2064" y2="2816" x1="2688" />
            <wire x2="2880" y1="2816" y2="2816" x1="2688" />
            <wire x2="3040" y1="2064" y2="2064" x1="2688" />
            <wire x2="3312" y1="2064" y2="2064" x1="3040" />
            <wire x2="960" y1="2064" y2="2272" x1="960" />
            <wire x2="3728" y1="1904" y2="1904" x1="3040" />
            <wire x2="3728" y1="1904" y2="1984" x1="3728" />
            <wire x2="4512" y1="1984" y2="1984" x1="3728" />
            <wire x2="3040" y1="1904" y2="2064" x1="3040" />
        </branch>
        <branch name="XLXN_786(31:0)">
            <wire x2="336" y1="4288" y2="4816" x1="336" />
            <wire x2="2528" y1="4816" y2="4816" x1="336" />
            <wire x2="576" y1="4288" y2="4288" x1="336" />
            <wire x2="2528" y1="3376" y2="3376" x1="1696" />
            <wire x2="2528" y1="3376" y2="4816" x1="2528" />
        </branch>
        <branch name="XLXN_787(31:0)">
            <wire x2="368" y1="4432" y2="4768" x1="368" />
            <wire x2="2496" y1="4768" y2="4768" x1="368" />
            <wire x2="576" y1="4432" y2="4432" x1="368" />
            <wire x2="2496" y1="3424" y2="3424" x1="1696" />
            <wire x2="2496" y1="3424" y2="4768" x1="2496" />
        </branch>
        <branch name="a_cs(2:0)">
            <wire x2="1824" y1="4128" y2="4128" x1="1472" />
        </branch>
        <branch name="a_clk">
            <wire x2="1632" y1="4064" y2="4064" x1="1472" />
        </branch>
        <branch name="a_sdo">
            <wire x2="1088" y1="4000" y2="4000" x1="1056" />
        </branch>
        <branch name="XLXN_805">
            <wire x2="400" y1="2944" y2="2944" x1="192" />
            <wire x2="464" y1="2944" y2="2944" x1="400" />
            <wire x2="192" y1="2944" y2="4096" x1="192" />
            <wire x2="1088" y1="4096" y2="4096" x1="192" />
            <wire x2="400" y1="2432" y2="2944" x1="400" />
            <wire x2="1200" y1="2432" y2="2432" x1="400" />
        </branch>
        <instance x="512" y="3488" name="XLXI_161" orien="R0">
        </instance>
        <instance x="512" y="3664" name="XLXI_163" orien="R0">
        </instance>
        <branch name="XLXN_807(31:0)">
            <wire x2="1056" y1="3456" y2="3456" x1="896" />
            <wire x2="1056" y1="3280" y2="3456" x1="1056" />
            <wire x2="1200" y1="3280" y2="3280" x1="1056" />
        </branch>
        <branch name="XLXN_808(31:0)">
            <wire x2="1040" y1="3632" y2="3632" x1="896" />
            <wire x2="1040" y1="3328" y2="3632" x1="1040" />
            <wire x2="1200" y1="3328" y2="3328" x1="1040" />
        </branch>
        <instance x="1088" y="4224" name="XLXI_162" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1056" y="4000" name="a_sdo" orien="R180" />
        <iomarker fontsize="28" x="1824" y="4128" name="a_cs(2:0)" orien="R0" />
        <iomarker fontsize="28" x="1632" y="4064" name="a_clk" orien="R0" />
        <branch name="a_sdi">
            <wire x2="1488" y1="4000" y2="4000" x1="1472" />
            <wire x2="1664" y1="3952" y2="3952" x1="1488" />
            <wire x2="1488" y1="3952" y2="4000" x1="1488" />
        </branch>
        <iomarker fontsize="28" x="1664" y="3952" name="a_sdi" orien="R0" />
        <branch name="XLXN_810(11:0)">
            <wire x2="512" y1="3632" y2="3632" x1="416" />
            <wire x2="416" y1="3632" y2="4496" x1="416" />
            <wire x2="1536" y1="4496" y2="4496" x1="416" />
            <wire x2="1536" y1="4256" y2="4256" x1="1472" />
            <wire x2="1536" y1="4256" y2="4496" x1="1536" />
        </branch>
        <branch name="XLXN_812(11:0)">
            <wire x2="512" y1="3456" y2="3456" x1="384" />
            <wire x2="384" y1="3456" y2="4528" x1="384" />
            <wire x2="1568" y1="4528" y2="4528" x1="384" />
            <wire x2="1568" y1="4192" y2="4192" x1="1472" />
            <wire x2="1568" y1="4192" y2="4528" x1="1568" />
        </branch>
        <instance x="576" y="4464" name="XLXI_165" orien="R0">
        </instance>
        <instance x="576" y="4320" name="XLXI_164" orien="R0">
        </instance>
        <branch name="XLXN_814(11:0)">
            <wire x2="1024" y1="4288" y2="4288" x1="960" />
            <wire x2="1024" y1="4288" y2="4320" x1="1024" />
            <wire x2="1088" y1="4320" y2="4320" x1="1024" />
        </branch>
        <branch name="XLXN_815(11:0)">
            <wire x2="1024" y1="4432" y2="4432" x1="960" />
            <wire x2="1024" y1="4384" y2="4432" x1="1024" />
            <wire x2="1088" y1="4384" y2="4384" x1="1024" />
        </branch>
    </sheet>
</drawing>