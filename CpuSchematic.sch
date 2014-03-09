<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(31:0)" />
        <signal name="XLXN_16(3:0)" />
        <signal name="XLXN_18(7:0)" />
        <signal name="XLXN_22(3:0)" />
        <signal name="XLXN_24(31:0)" />
        <signal name="XLXN_34(3:0)" />
        <signal name="XLXN_35(31:0)" />
        <signal name="XLXN_36(31:0)" />
        <signal name="XLXN_37(31:0)" />
        <signal name="XLXN_44(31:0)" />
        <signal name="XLXN_45(31:0)" />
        <signal name="XLXN_47(31:0)" />
        <signal name="XLXN_48(31:0)" />
        <signal name="XLXN_49(31:0)" />
        <signal name="XLXN_50(31:0)" />
        <signal name="XLXN_53(31:0)" />
        <signal name="XLXN_55(3:0)" />
        <signal name="XLXN_57(3:0)" />
        <signal name="XLXN_58(31:0)" />
        <signal name="XLXN_59(31:0)" />
        <signal name="XLXN_60(3:0)" />
        <blockdef name="Fetch">
            <timestamp>2014-2-24T13:59:43</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="Decode">
            <timestamp>2014-2-24T14:3:45</timestamp>
            <rect width="432" x="64" y="-896" height="896" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="496" y="-876" height="24" />
            <line x2="560" y1="-864" y2="-864" x1="496" />
            <rect width="64" x="496" y="-812" height="24" />
            <line x2="560" y1="-800" y2="-800" x1="496" />
            <rect width="64" x="496" y="-748" height="24" />
            <line x2="560" y1="-736" y2="-736" x1="496" />
            <rect width="64" x="496" y="-684" height="24" />
            <line x2="560" y1="-672" y2="-672" x1="496" />
            <rect width="64" x="496" y="-620" height="24" />
            <line x2="560" y1="-608" y2="-608" x1="496" />
            <rect width="64" x="496" y="-556" height="24" />
            <line x2="560" y1="-544" y2="-544" x1="496" />
            <rect width="64" x="496" y="-492" height="24" />
            <line x2="560" y1="-480" y2="-480" x1="496" />
            <rect width="64" x="496" y="-428" height="24" />
            <line x2="560" y1="-416" y2="-416" x1="496" />
            <rect width="64" x="496" y="-364" height="24" />
            <line x2="560" y1="-352" y2="-352" x1="496" />
            <rect width="64" x="496" y="-300" height="24" />
            <line x2="560" y1="-288" y2="-288" x1="496" />
            <rect width="64" x="496" y="-236" height="24" />
            <line x2="560" y1="-224" y2="-224" x1="496" />
            <rect width="64" x="496" y="-172" height="24" />
            <line x2="560" y1="-160" y2="-160" x1="496" />
            <rect width="64" x="496" y="-108" height="24" />
            <line x2="560" y1="-96" y2="-96" x1="496" />
            <rect width="64" x="496" y="-44" height="24" />
            <line x2="560" y1="-32" y2="-32" x1="496" />
        </blockdef>
        <blockdef name="MemoryAccess">
            <timestamp>2014-2-24T14:4:4</timestamp>
            <rect width="400" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
        </blockdef>
        <blockdef name="WriteBack">
            <timestamp>2014-2-24T14:4:30</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="Mux_LoadWord">
            <timestamp>2014-3-9T12:33:37</timestamp>
            <rect width="416" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="480" y="-172" height="24" />
            <line x2="544" y1="-160" y2="-160" x1="480" />
        </blockdef>
        <blockdef name="Execute">
            <timestamp>2014-3-9T12:39:15</timestamp>
            <rect width="448" x="64" y="-448" height="448" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="576" y1="-416" y2="-416" x1="512" />
            <line x2="576" y1="-288" y2="-288" x1="512" />
            <rect width="64" x="512" y="-172" height="24" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
        </blockdef>
        <block symbolname="Fetch" name="XLXI_1">
            <blockpin name="clock" />
            <blockpin name="pc(31:0)" />
            <blockpin signalname="XLXN_2(31:0)" name="instr(31:0)" />
        </block>
        <block symbolname="Decode" name="XLXI_3">
            <blockpin signalname="XLXN_2(31:0)" name="instruction(31:0)" />
            <blockpin signalname="XLXN_16(3:0)" name="op_type(3:0)" />
            <blockpin name="op_alu(7:0)" />
            <blockpin name="op_branch(7:0)" />
            <blockpin signalname="XLXN_18(7:0)" name="op_datamove(7:0)" />
            <blockpin name="op_system(7:0)" />
            <blockpin signalname="XLXN_60(3:0)" name="ALU_Rd_addr(3:0)" />
            <blockpin signalname="XLXN_59(31:0)" name="ALU_Rn1(31:0)" />
            <blockpin signalname="XLXN_37(31:0)" name="ALU_Rn2(31:0)" />
            <blockpin signalname="XLXN_55(3:0)" name="DataMove_Rd_addr(3:0)" />
            <blockpin signalname="XLXN_24(31:0)" name="DataMove_Rd(31:0)" />
            <blockpin signalname="XLXN_34(3:0)" name="addrmode(3:0)" />
            <blockpin signalname="XLXN_35(31:0)" name="immd_word(31:0)" />
            <blockpin signalname="XLXN_53(31:0)" name="memaddr_offset(31:0)" />
            <blockpin name="ExecNextPC(31:0)" />
        </block>
        <block symbolname="MemoryAccess" name="XLXI_4">
            <blockpin signalname="XLXN_18(7:0)" name="opcode(7:0)" />
            <blockpin signalname="XLXN_24(31:0)" name="Rd(31:0)" />
            <blockpin signalname="XLXN_44(31:0)" name="effective_addr(31:0)" />
            <blockpin signalname="XLXN_45(31:0)" name="mem_word(31:0)" />
        </block>
        <block symbolname="WriteBack" name="XLXI_6">
            <blockpin signalname="XLXN_16(3:0)" name="op_type(3:0)" />
            <blockpin signalname="XLXN_60(3:0)" name="ALU_Rd_addr(3:0)" />
            <blockpin signalname="XLXN_48(31:0)" name="Exec_out(31:0)" />
            <blockpin signalname="XLXN_55(3:0)" name="LDR_addr(3:0)" />
            <blockpin signalname="XLXN_47(31:0)" name="LDR_word(31:0)" />
        </block>
        <block symbolname="Mux_LoadWord" name="XLXI_9">
            <blockpin signalname="XLXN_34(3:0)" name="sel_src(3:0)" />
            <blockpin signalname="XLXN_35(31:0)" name="load_word_ID(31:0)" />
            <blockpin signalname="XLXN_45(31:0)" name="load_word_MEM(31:0)" />
            <blockpin signalname="XLXN_47(31:0)" name="load_word(31:0)" />
        </block>
        <block symbolname="Execute" name="XLXI_11">
            <blockpin name="op_alu(7:0)" />
            <blockpin name="op_branch(7:0)" />
            <blockpin name="op_datamove(7:0)" />
            <blockpin name="op_system(7:0)" />
            <blockpin signalname="XLXN_59(31:0)" name="ALU_op1(31:0)" />
            <blockpin signalname="XLXN_37(31:0)" name="ALU_op2(31:0)" />
            <blockpin signalname="XLXN_53(31:0)" name="memaddr_offset(31:0)" />
            <blockpin name="nextpc" />
            <blockpin name="endprogram" />
            <blockpin signalname="XLXN_48(31:0)" name="Exec_out(31:0)" />
            <blockpin signalname="XLXN_44(31:0)" name="effective_addr(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_2(31:0)">
            <wire x2="560" y1="416" y2="416" x1="544" />
            <wire x2="624" y1="176" y2="176" x1="560" />
            <wire x2="560" y1="176" y2="416" x1="560" />
        </branch>
        <instance x="160" y="512" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_16(3:0)">
            <wire x2="1376" y1="176" y2="176" x1="1184" />
            <wire x2="1376" y1="176" y2="1712" x1="1376" />
            <wire x2="2912" y1="1712" y2="1712" x1="1376" />
        </branch>
        <branch name="XLXN_18(7:0)">
            <wire x2="1696" y1="368" y2="368" x1="1184" />
            <wire x2="1696" y1="368" y2="688" x1="1696" />
            <wire x2="2496" y1="688" y2="688" x1="1696" />
        </branch>
        <branch name="XLXN_24(31:0)">
            <wire x2="2496" y1="752" y2="752" x1="1184" />
        </branch>
        <instance x="2016" y="1344" name="XLXI_9" orien="R0">
        </instance>
        <instance x="624" y="1040" name="XLXI_3" orien="R0">
        </instance>
        <instance x="2496" y="848" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_34(3:0)">
            <wire x2="1584" y1="816" y2="816" x1="1184" />
            <wire x2="1584" y1="816" y2="1184" x1="1584" />
            <wire x2="2016" y1="1184" y2="1184" x1="1584" />
        </branch>
        <branch name="XLXN_35(31:0)">
            <wire x2="1568" y1="880" y2="880" x1="1184" />
            <wire x2="1568" y1="880" y2="1248" x1="1568" />
            <wire x2="2016" y1="1248" y2="1248" x1="1568" />
        </branch>
        <branch name="XLXN_37(31:0)">
            <wire x2="1552" y1="624" y2="624" x1="1184" />
            <wire x2="1552" y1="416" y2="624" x1="1552" />
            <wire x2="1920" y1="416" y2="416" x1="1552" />
        </branch>
        <branch name="XLXN_44(31:0)">
            <wire x2="2496" y1="816" y2="816" x1="2480" />
            <wire x2="2480" y1="816" y2="912" x1="2480" />
            <wire x2="3088" y1="912" y2="912" x1="2480" />
            <wire x2="3088" y1="480" y2="480" x1="2496" />
            <wire x2="3088" y1="480" y2="912" x1="3088" />
        </branch>
        <branch name="XLXN_45(31:0)">
            <wire x2="2016" y1="1312" y2="1312" x1="1936" />
            <wire x2="1936" y1="1312" y2="1408" x1="1936" />
            <wire x2="3104" y1="1408" y2="1408" x1="1936" />
            <wire x2="3104" y1="688" y2="688" x1="3024" />
            <wire x2="3104" y1="688" y2="1408" x1="3104" />
        </branch>
        <branch name="XLXN_47(31:0)">
            <wire x2="2576" y1="1184" y2="1184" x1="2560" />
            <wire x2="2576" y1="1184" y2="1968" x1="2576" />
            <wire x2="2912" y1="1968" y2="1968" x1="2576" />
        </branch>
        <branch name="XLXN_48(31:0)">
            <wire x2="2512" y1="576" y2="576" x1="1952" />
            <wire x2="1952" y1="576" y2="1840" x1="1952" />
            <wire x2="2912" y1="1840" y2="1840" x1="1952" />
            <wire x2="2512" y1="352" y2="352" x1="2496" />
            <wire x2="2512" y1="352" y2="576" x1="2512" />
        </branch>
        <instance x="1920" y="512" name="XLXI_11" orien="R0">
        </instance>
        <branch name="XLXN_53(31:0)">
            <wire x2="1536" y1="944" y2="944" x1="1184" />
            <wire x2="1920" y1="480" y2="480" x1="1536" />
            <wire x2="1536" y1="480" y2="656" x1="1536" />
            <wire x2="1536" y1="656" y2="944" x1="1536" />
        </branch>
        <branch name="XLXN_55(3:0)">
            <wire x2="1200" y1="688" y2="688" x1="1184" />
            <wire x2="1200" y1="688" y2="1904" x1="1200" />
            <wire x2="2912" y1="1904" y2="1904" x1="1200" />
        </branch>
        <instance x="2912" y="2000" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_59(31:0)">
            <wire x2="1520" y1="560" y2="560" x1="1184" />
            <wire x2="1520" y1="352" y2="560" x1="1520" />
            <wire x2="1920" y1="352" y2="352" x1="1520" />
        </branch>
        <branch name="XLXN_60(3:0)">
            <wire x2="1264" y1="496" y2="496" x1="1184" />
            <wire x2="1264" y1="496" y2="1776" x1="1264" />
            <wire x2="2912" y1="1776" y2="1776" x1="1264" />
        </branch>
    </sheet>
</drawing>