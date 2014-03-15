<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_16(3:0)" />
        <signal name="XLXN_18(7:0)" />
        <signal name="XLXN_24(31:0)" />
        <signal name="XLXN_34(3:0)" />
        <signal name="XLXN_35(31:0)" />
        <signal name="XLXN_37(31:0)" />
        <signal name="XLXN_44(31:0)" />
        <signal name="XLXN_99(31:0)" />
        <signal name="XLXN_45(31:0)" />
        <signal name="XLXN_101(31:0)" />
        <signal name="XLXN_47(31:0)" />
        <signal name="XLXN_53(31:0)" />
        <signal name="XLXN_104(31:0)" />
        <signal name="XLXN_55(3:0)" />
        <signal name="XLXN_59(31:0)" />
        <signal name="XLXN_85(3:0)" />
        <signal name="XLXN_88(31:0)" />
        <signal name="XLXN_109(31:0)" />
        <signal name="XLXN_110" />
        <signal name="XLXN_89" />
        <signal name="XLXN_114(7:0)" />
        <signal name="XLXN_116(31:0)" />
        <signal name="XLXN_117(31:0)" />
        <signal name="XLXN_146(31:0)" />
        <signal name="XLXN_147(31:0)" />
        <blockdef name="Fetch">
            <timestamp>2014-3-15T6:13:29</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="256" x="64" y="-128" height="192" />
        </blockdef>
        <blockdef name="Decode">
            <timestamp>2014-3-15T6:15:47</timestamp>
            <line x2="560" y1="32" y2="32" x1="496" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="496" y="-876" height="24" />
            <line x2="560" y1="-864" y2="-864" x1="496" />
            <rect width="64" x="496" y="-812" height="24" />
            <line x2="560" y1="-800" y2="-800" x1="496" />
            <rect width="64" x="496" y="-684" height="24" />
            <line x2="560" y1="-672" y2="-672" x1="496" />
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
            <rect width="432" x="64" y="-896" height="960" />
        </blockdef>
        <blockdef name="MemoryAccess">
            <timestamp>2014-3-15T6:19:0</timestamp>
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
            <timestamp>2014-3-15T6:20:4</timestamp>
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
            <timestamp>2014-3-15T6:19:25</timestamp>
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
            <timestamp>2014-3-15T7:35:44</timestamp>
            <rect width="448" x="64" y="-448" height="448" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="512" y="-172" height="24" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
        </blockdef>
        <block symbolname="Mux_LoadWord" name="XLXI_9">
            <blockpin signalname="XLXN_34(3:0)" name="sel_src(3:0)" />
            <blockpin signalname="XLXN_35(31:0)" name="load_word_ID(31:0)" />
            <blockpin signalname="XLXN_45(31:0)" name="load_word_MEM(31:0)" />
            <blockpin signalname="XLXN_47(31:0)" name="load_word(31:0)" />
        </block>
        <block symbolname="MemoryAccess" name="XLXI_4">
            <blockpin signalname="XLXN_18(7:0)" name="opcode(7:0)" />
            <blockpin signalname="XLXN_24(31:0)" name="Rd(31:0)" />
            <blockpin signalname="XLXN_44(31:0)" name="effective_addr(31:0)" />
            <blockpin signalname="XLXN_45(31:0)" name="mem_word(31:0)" />
        </block>
        <block symbolname="WriteBack" name="XLXI_6">
            <blockpin signalname="XLXN_16(3:0)" name="op_type(3:0)" />
            <blockpin signalname="XLXN_85(3:0)" name="ALU_Rd_addr(3:0)" />
            <blockpin signalname="XLXN_88(31:0)" name="Exec_out(31:0)" />
            <blockpin signalname="XLXN_55(3:0)" name="LDR_addr(3:0)" />
            <blockpin signalname="XLXN_47(31:0)" name="LDR_word(31:0)" />
        </block>
        <block symbolname="Execute" name="XLXI_11">
            <blockpin signalname="XLXN_114(7:0)" name="op_alu(7:0)" />
            <blockpin signalname="XLXN_59(31:0)" name="ALU_op1(31:0)" />
            <blockpin signalname="XLXN_37(31:0)" name="ALU_op2(31:0)" />
            <blockpin signalname="XLXN_53(31:0)" name="memaddr_offset(31:0)" />
            <blockpin signalname="XLXN_88(31:0)" name="Exec_out(31:0)" />
            <blockpin signalname="XLXN_44(31:0)" name="effective_addr(31:0)" />
        </block>
        <block symbolname="Decode" name="XLXI_3">
            <blockpin signalname="XLXN_147(31:0)" name="instruction(31:0)" />
            <blockpin signalname="XLXN_89" name="getnextpc" />
            <blockpin signalname="XLXN_16(3:0)" name="op_type(3:0)" />
            <blockpin signalname="XLXN_114(7:0)" name="op_alu(7:0)" />
            <blockpin signalname="XLXN_18(7:0)" name="op_datamove(7:0)" />
            <blockpin signalname="XLXN_85(3:0)" name="ALU_Rd_addr(3:0)" />
            <blockpin signalname="XLXN_59(31:0)" name="ALU_Rn1(31:0)" />
            <blockpin signalname="XLXN_37(31:0)" name="ALU_Rn2(31:0)" />
            <blockpin signalname="XLXN_55(3:0)" name="DataMove_Rd_addr(3:0)" />
            <blockpin signalname="XLXN_24(31:0)" name="DataMove_Rd(31:0)" />
            <blockpin signalname="XLXN_34(3:0)" name="addrmode(3:0)" />
            <blockpin signalname="XLXN_35(31:0)" name="immd_word(31:0)" />
            <blockpin signalname="XLXN_53(31:0)" name="memaddr_offset(31:0)" />
            <blockpin signalname="XLXN_116(31:0)" name="ExecNextPC(31:0)" />
        </block>
        <block symbolname="Fetch" name="XLXI_1">
            <blockpin name="clock" />
            <blockpin signalname="XLXN_89" name="getnextpc" />
            <blockpin signalname="XLXN_117(31:0)" name="pc(31:0)" />
            <blockpin signalname="XLXN_146(31:0)" name="instr(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2080" y="1360" name="XLXI_9" orien="R0">
        </instance>
        <instance x="2560" y="864" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_34(3:0)">
            <wire x2="2064" y1="832" y2="832" x1="1104" />
            <wire x2="2064" y1="832" y2="1200" x1="2064" />
            <wire x2="2080" y1="1200" y2="1200" x1="2064" />
        </branch>
        <branch name="XLXN_44(31:0)">
            <wire x2="2560" y1="832" y2="832" x1="2544" />
            <wire x2="2544" y1="832" y2="912" x1="2544" />
            <wire x2="3136" y1="912" y2="912" x1="2544" />
            <wire x2="3136" y1="528" y2="528" x1="2560" />
            <wire x2="3136" y1="528" y2="912" x1="3136" />
        </branch>
        <branch name="XLXN_45(31:0)">
            <wire x2="1984" y1="1328" y2="1424" x1="1984" />
            <wire x2="3168" y1="1424" y2="1424" x1="1984" />
            <wire x2="2080" y1="1328" y2="1328" x1="1984" />
            <wire x2="3168" y1="704" y2="704" x1="3088" />
            <wire x2="3168" y1="704" y2="1424" x1="3168" />
        </branch>
        <branch name="XLXN_47(31:0)">
            <wire x2="2640" y1="1200" y2="1200" x1="2624" />
            <wire x2="2640" y1="1200" y2="2176" x1="2640" />
            <wire x2="3104" y1="2176" y2="2176" x1="2640" />
        </branch>
        <branch name="XLXN_53(31:0)">
            <wire x2="1968" y1="960" y2="960" x1="1104" />
            <wire x2="1968" y1="528" y2="960" x1="1968" />
            <wire x2="1984" y1="528" y2="528" x1="1968" />
        </branch>
        <instance x="3104" y="2208" name="XLXI_6" orien="R0">
        </instance>
        <instance x="112" y="864" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_89">
            <wire x2="112" y1="896" y2="1184" x1="112" />
            <wire x2="1120" y1="1184" y2="1184" x1="112" />
            <wire x2="1120" y1="1088" y2="1088" x1="1104" />
            <wire x2="1120" y1="1088" y2="1184" x1="1120" />
        </branch>
        <rect width="284" x="492" y="1388" height="108" />
        <text style="fontsize:30;fontname:Arial" x="536" y="1440">Next PC (R1)</text>
        <branch name="XLXN_117(31:0)">
            <wire x2="112" y1="832" y2="832" x1="48" />
            <wire x2="48" y1="832" y2="1440" x1="48" />
            <wire x2="496" y1="1440" y2="1440" x1="48" />
        </branch>
        <branch name="XLXN_18(7:0)">
            <wire x2="1824" y1="384" y2="384" x1="1104" />
            <wire x2="1824" y1="384" y2="704" x1="1824" />
            <wire x2="2560" y1="704" y2="704" x1="1824" />
        </branch>
        <text style="fontsize:30;fontname:Arial" x="176" y="356">Instruction (R2)</text>
        <rect width="284" x="140" y="296" height="108" />
        <branch name="XLXN_35(31:0)">
            <wire x2="1584" y1="896" y2="896" x1="1104" />
            <wire x2="1584" y1="896" y2="1264" x1="1584" />
            <wire x2="2080" y1="1264" y2="1264" x1="1584" />
        </branch>
        <branch name="XLXN_24(31:0)">
            <wire x2="2560" y1="768" y2="768" x1="1104" />
        </branch>
        <branch name="XLXN_55(3:0)">
            <wire x2="1200" y1="704" y2="704" x1="1104" />
            <wire x2="1200" y1="704" y2="2112" x1="1200" />
            <wire x2="3104" y1="2112" y2="2112" x1="1200" />
        </branch>
        <branch name="XLXN_37(31:0)">
            <wire x2="1552" y1="640" y2="640" x1="1104" />
            <wire x2="1552" y1="464" y2="640" x1="1552" />
            <wire x2="1984" y1="464" y2="464" x1="1552" />
        </branch>
        <branch name="XLXN_85(3:0)">
            <wire x2="1264" y1="512" y2="512" x1="1104" />
            <wire x2="1264" y1="512" y2="1984" x1="1264" />
            <wire x2="3104" y1="1984" y2="1984" x1="1264" />
        </branch>
        <branch name="XLXN_16(3:0)">
            <wire x2="1136" y1="192" y2="192" x1="1104" />
            <wire x2="1136" y1="192" y2="1920" x1="1136" />
            <wire x2="3104" y1="1920" y2="1920" x1="1136" />
        </branch>
        <instance x="544" y="1056" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_116(31:0)">
            <wire x2="1168" y1="1440" y2="1440" x1="784" />
            <wire x2="1168" y1="1024" y2="1024" x1="1104" />
            <wire x2="1168" y1="1024" y2="1440" x1="1168" />
        </branch>
        <branch name="XLXN_146(31:0)">
            <wire x2="96" y1="336" y2="576" x1="96" />
            <wire x2="512" y1="576" y2="576" x1="96" />
            <wire x2="512" y1="576" y2="768" x1="512" />
            <wire x2="144" y1="336" y2="336" x1="96" />
            <wire x2="512" y1="768" y2="768" x1="496" />
        </branch>
        <branch name="XLXN_147(31:0)">
            <wire x2="464" y1="336" y2="336" x1="432" />
            <wire x2="544" y1="192" y2="192" x1="464" />
            <wire x2="464" y1="192" y2="336" x1="464" />
        </branch>
        <branch name="XLXN_88(31:0)">
            <wire x2="2016" y1="640" y2="2048" x1="2016" />
            <wire x2="3104" y1="2048" y2="2048" x1="2016" />
            <wire x2="2608" y1="640" y2="640" x1="2016" />
            <wire x2="2608" y1="400" y2="400" x1="2560" />
            <wire x2="2608" y1="400" y2="640" x1="2608" />
        </branch>
        <branch name="XLXN_59(31:0)">
            <wire x2="1120" y1="576" y2="576" x1="1104" />
            <wire x2="1488" y1="576" y2="576" x1="1120" />
            <wire x2="1488" y1="400" y2="576" x1="1488" />
            <wire x2="1984" y1="400" y2="400" x1="1488" />
        </branch>
        <branch name="XLXN_114(7:0)">
            <wire x2="1120" y1="256" y2="256" x1="1104" />
            <wire x2="1536" y1="256" y2="256" x1="1120" />
            <wire x2="1536" y1="144" y2="256" x1="1536" />
            <wire x2="1984" y1="144" y2="144" x1="1536" />
        </branch>
        <instance x="1984" y="560" name="XLXI_11" orien="R0">
        </instance>
    </sheet>
</drawing>