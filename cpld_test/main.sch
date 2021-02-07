VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "xbr"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL GCLK10
        SIGNAL XLXN_2
        SIGNAL XLXN_3(31:0)
        SIGNAL XLXN_4(31:0)
        SIGNAL XLXN_5(2:0)
        SIGNAL XLXN_6(1:0)
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL XLXN_11
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL XLXN_15
        SIGNAL XLXN_16(31:0)
        PORT Input GCLK10
        PORT Input XLXN_2
        PORT Input XLXN_3(31:0)
        PORT Input XLXN_4(31:0)
        PORT Input XLXN_5(2:0)
        PORT Input XLXN_6(1:0)
        PORT Output XLXN_7
        PORT Output XLXN_8
        PORT Output XLXN_9
        PORT Output XLXN_10
        PORT Output XLXN_11
        PORT Output XLXN_12
        PORT Output XLXN_13
        PORT Output XLXN_14
        PORT Output XLXN_15
        PORT Output XLXN_16(31:0)
        BEGIN BLOCKDEF fpu
            TIMESTAMP 2013 1 13 20 24 35
            RECTANGLE N 64 -640 368 0 
            LINE N 64 -608 0 -608 
            LINE N 64 -496 0 -496 
            RECTANGLE N 0 -396 64 -372 
            LINE N 64 -384 0 -384 
            RECTANGLE N 0 -284 64 -260 
            LINE N 64 -272 0 -272 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -60 64 -36 
            LINE N 64 -48 0 -48 
            LINE N 368 -608 432 -608 
            LINE N 368 -544 432 -544 
            LINE N 368 -480 432 -480 
            LINE N 368 -416 432 -416 
            LINE N 368 -352 432 -352 
            LINE N 368 -288 432 -288 
            LINE N 368 -224 432 -224 
            LINE N 368 -160 432 -160 
            LINE N 368 -96 432 -96 
            RECTANGLE N 368 -44 432 -20 
            LINE N 368 -32 432 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 fpu
            PIN clk_i GCLK10
            PIN start_i XLXN_2
            PIN opa_i(31:0) XLXN_3(31:0)
            PIN opb_i(31:0) XLXN_4(31:0)
            PIN fpu_op_i(2:0) XLXN_5(2:0)
            PIN rmode_i(1:0) XLXN_6(1:0)
            PIN ready_o XLXN_7
            PIN ine_o XLXN_8
            PIN overflow_o XLXN_9
            PIN underflow_o XLXN_10
            PIN div_zero_o XLXN_11
            PIN inf_o XLXN_12
            PIN zero_o XLXN_13
            PIN qnan_o XLXN_14
            PIN snan_o XLXN_15
            PIN output_o(31:0) XLXN_16(31:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 1056 1680 R0
        END INSTANCE
        BEGIN BRANCH GCLK10
            WIRE 1024 1072 1056 1072
        END BRANCH
        IOMARKER 1024 1072 GCLK10 R180 28
        BEGIN BRANCH XLXN_2
            WIRE 1024 1184 1056 1184
        END BRANCH
        IOMARKER 1024 1184 XLXN_2 R180 28
        BEGIN BRANCH XLXN_3(31:0)
            WIRE 1024 1296 1056 1296
        END BRANCH
        IOMARKER 1024 1296 XLXN_3(31:0) R180 28
        BEGIN BRANCH XLXN_4(31:0)
            WIRE 1024 1408 1056 1408
        END BRANCH
        IOMARKER 1024 1408 XLXN_4(31:0) R180 28
        BEGIN BRANCH XLXN_5(2:0)
            WIRE 1024 1520 1056 1520
        END BRANCH
        IOMARKER 1024 1520 XLXN_5(2:0) R180 28
        BEGIN BRANCH XLXN_6(1:0)
            WIRE 1024 1632 1056 1632
        END BRANCH
        IOMARKER 1024 1632 XLXN_6(1:0) R180 28
        BEGIN BRANCH XLXN_7
            WIRE 1488 1072 1520 1072
        END BRANCH
        IOMARKER 1520 1072 XLXN_7 R0 28
        BEGIN BRANCH XLXN_8
            WIRE 1488 1136 1520 1136
        END BRANCH
        IOMARKER 1520 1136 XLXN_8 R0 28
        BEGIN BRANCH XLXN_9
            WIRE 1488 1200 1520 1200
        END BRANCH
        IOMARKER 1520 1200 XLXN_9 R0 28
        BEGIN BRANCH XLXN_10
            WIRE 1488 1264 1520 1264
        END BRANCH
        IOMARKER 1520 1264 XLXN_10 R0 28
        BEGIN BRANCH XLXN_11
            WIRE 1488 1328 1520 1328
        END BRANCH
        IOMARKER 1520 1328 XLXN_11 R0 28
        BEGIN BRANCH XLXN_12
            WIRE 1488 1392 1520 1392
        END BRANCH
        IOMARKER 1520 1392 XLXN_12 R0 28
        BEGIN BRANCH XLXN_13
            WIRE 1488 1456 1520 1456
        END BRANCH
        IOMARKER 1520 1456 XLXN_13 R0 28
        BEGIN BRANCH XLXN_14
            WIRE 1488 1520 1520 1520
        END BRANCH
        IOMARKER 1520 1520 XLXN_14 R0 28
        BEGIN BRANCH XLXN_15
            WIRE 1488 1584 1520 1584
        END BRANCH
        IOMARKER 1520 1584 XLXN_15 R0 28
        BEGIN BRANCH XLXN_16(31:0)
            WIRE 1488 1648 1520 1648
        END BRANCH
        IOMARKER 1520 1648 XLXN_16(31:0) R0 28
    END SHEET
END SCHEMATIC
