<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_16(3:0)" />
        <signal name="XLXN_45(31:0)" />
        <signal name="XLXN_47(31:0)" />
        <signal name="XLXN_88(31:0)" />
        <signal name="XLXN_117(31:0)" />
        <signal name="XLXN_179(31:0)" />
        <signal name="XLXN_180(7:0)" />
        <signal name="XLXN_181(3:0)" />
        <signal name="XLXN_182(31:0)" />
        <signal name="XLXN_186(31:0)" />
        <signal name="XLXN_192(31:0)" />
        <signal name="XLXN_193(3:0)" />
        <signal name="XLXN_194(31:0)" />
        <signal name="XLXN_195(3:0)" />
        <signal name="XLXN_196(31:0)" />
        <signal name="XLXN_197(31:0)" />
        <signal name="XLXN_200(7:0)" />
        <signal name="XLXN_203(31:0)" />
        <signal name="XLXN_206" />
        <signal name="XLXN_213(31:0)" />
        <signal name="XLXN_214(31:0)" />
        <signal name="XLXN_215(31:0)" />
        <signal name="XLXN_217(31:0)" />
        <signal name="XLXN_211(31:0)" />
        <signal name="XLXN_230(31:0)" />
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
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="496" y="-876" height="24" />
            <line x2="560" y1="-864" y2="-864" x1="496" />
            <rect width="64" x="496" y="-812" height="24" />
            <line x2="560" y1="-800" y2="-800" x1="496" />
            <rect width="432" x="64" y="-896" height="852" />
            <rect width="64" x="496" y="-748" height="24" />
            <line x2="560" y1="-736" y2="-736" x1="496" />
            <line x2="560" y1="-96" y2="-96" x1="496" />
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
            <timestamp>2014-3-15T8:41:24</timestamp>
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-348" height="24" />
            <rect width="64" x="0" y="-284" height="24" />
            <rect width="64" x="0" y="-220" height="24" />
            <rect width="64" x="512" y="-348" height="24" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="576" y1="-336" y2="-336" x1="512" />
            <rect width="448" x="64" y="-448" height="296" />
            <rect width="64" x="512" y="-284" height="24" />
            <line x2="576" y1="-272" y2="-272" x1="512" />
        </blockdef>
        <block symbolname="Mux_LoadWord" name="XLXI_9">
            <blockpin signalname="XLXN_195(3:0)" name="sel_src(3:0)" />
            <blockpin signalname="XLXN_196(31:0)" name="load_word_ID(31:0)" />
            <blockpin signalname="XLXN_45(31:0)" name="load_word_MEM(31:0)" />
            <blockpin signalname="XLXN_47(31:0)" name="load_word(31:0)" />
        </block>
        <block symbolname="MemoryAccess" name="XLXI_4">
            <blockpin signalname="XLXN_180(7:0)" name="opcode(7:0)" />
            <blockpin signalname="XLXN_194(31:0)" name="Rd(31:0)" />
            <blockpin signalname="XLXN_192(31:0)" name="effective_addr(31:0)" />
            <blockpin signalname="XLXN_45(31:0)" name="mem_word(31:0)" />
        </block>
        <block symbolname="WriteBack" name="XLXI_6">
            <blockpin signalname="XLXN_16(3:0)" name="op_type(3:0)" />
            <blockpin signalname="XLXN_181(3:0)" name="ALU_Rd_addr(3:0)" />
            <blockpin signalname="XLXN_88(31:0)" name="Exec_out(31:0)" />
            <blockpin signalname="XLXN_193(3:0)" name="LDR_addr(3:0)" />
            <blockpin signalname="XLXN_47(31:0)" name="LDR_word(31:0)" />
        </block>
        <block symbolname="Execute" name="XLXI_11">
            <blockpin signalname="XLXN_200(7:0)" name="op_alu(7:0)" />
            <blockpin signalname="XLXN_179(31:0)" name="ALU_op1(31:0)" />
            <blockpin signalname="XLXN_182(31:0)" name="ALU_op2(31:0)" />
            <blockpin signalname="XLXN_197(31:0)" name="memaddr_offset(31:0)" />
            <blockpin signalname="XLXN_88(31:0)" name="Exec_out(31:0)" />
            <blockpin name="effective_addr(31:0)" />
        </block>
        <block symbolname="Decode" name="XLXI_3">
            <blockpin signalname="XLXN_217(31:0)" name="instruction(31:0)" />
            <blockpin signalname="XLXN_16(3:0)" name="op_type(3:0)" />
            <blockpin signalname="XLXN_200(7:0)" name="op_alu(7:0)" />
            <blockpin signalname="XLXN_180(7:0)" name="op_datamove(7:0)" />
            <blockpin signalname="XLXN_206" name="getnextpc" />
            <blockpin signalname="XLXN_181(3:0)" name="ALU_Rd_addr(3:0)" />
            <blockpin signalname="XLXN_179(31:0)" name="ALU_Rn1(31:0)" />
            <blockpin signalname="XLXN_182(31:0)" name="ALU_Rn2(31:0)" />
            <blockpin signalname="XLXN_193(3:0)" name="DataMove_Rd_addr(3:0)" />
            <blockpin signalname="XLXN_194(31:0)" name="DataMove_Rd(31:0)" />
            <blockpin signalname="XLXN_195(3:0)" name="addrmode(3:0)" />
            <blockpin signalname="XLXN_196(31:0)" name="immd_word(31:0)" />
            <blockpin signalname="XLXN_197(31:0)" name="memaddr_offset(31:0)" />
            <blockpin signalname="XLXN_211(31:0)" name="ExecNextPC(31:0)" />
        </block>
        <block symbolname="Fetch" name="XLXI_1">
            <blockpin name="clock" />
            <blockpin signalname="XLXN_206" name="getnextpc" />
            <blockpin signalname="XLXN_117(31:0)" name="pc(31:0)" />
            <blockpin signalname="XLXN_203(31:0)" name="instr(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_45(31:0)">
            <wire x2="2384" y1="1024" y2="1328" x1="2384" />
            <wire x2="2432" y1="1328" y2="1328" x1="2384" />
            <wire x2="2992" y1="1024" y2="1024" x1="2384" />
            <wire x2="2992" y1="704" y2="704" x1="2944" />
            <wire x2="2992" y1="704" y2="1024" x1="2992" />
        </branch>
        <branch name="XLXN_47(31:0)">
            <wire x2="3040" y1="1200" y2="1200" x1="2976" />
            <wire x2="3040" y1="1200" y2="2176" x1="3040" />
            <wire x2="3136" y1="2176" y2="2176" x1="3040" />
        </branch>
        <instance x="112" y="864" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_117(31:0)">
            <wire x2="112" y1="832" y2="832" x1="48" />
            <wire x2="48" y1="832" y2="1216" x1="48" />
            <wire x2="160" y1="1216" y2="1216" x1="48" />
        </branch>
        <branch name="XLXN_16(3:0)">
            <wire x2="1360" y1="192" y2="192" x1="1152" />
            <wire x2="1360" y1="192" y2="1920" x1="1360" />
            <wire x2="3136" y1="1920" y2="1920" x1="1360" />
        </branch>
        <branch name="XLXN_88(31:0)">
            <wire x2="3088" y1="272" y2="272" x1="2208" />
            <wire x2="3088" y1="272" y2="2048" x1="3088" />
            <wire x2="3136" y1="2048" y2="2048" x1="3088" />
        </branch>
        <instance x="2416" y="864" name="XLXI_4" orien="R0">
        </instance>
        <instance x="2432" y="1360" name="XLXI_9" orien="R0">
        </instance>
        <instance x="592" y="1056" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_179(31:0)">
            <wire x2="1520" y1="448" y2="448" x1="1152" />
            <wire x2="1632" y1="272" y2="272" x1="1520" />
            <wire x2="1520" y1="272" y2="448" x1="1520" />
        </branch>
        <branch name="XLXN_180(7:0)">
            <wire x2="1328" y1="320" y2="320" x1="1152" />
            <wire x2="1328" y1="320" y2="704" x1="1328" />
            <wire x2="2416" y1="704" y2="704" x1="1328" />
        </branch>
        <branch name="XLXN_181(3:0)">
            <wire x2="1296" y1="384" y2="384" x1="1152" />
            <wire x2="1296" y1="384" y2="1984" x1="1296" />
            <wire x2="3136" y1="1984" y2="1984" x1="1296" />
        </branch>
        <branch name="XLXN_182(31:0)">
            <wire x2="1552" y1="512" y2="512" x1="1152" />
            <wire x2="1552" y1="336" y2="512" x1="1552" />
            <wire x2="1632" y1="336" y2="336" x1="1552" />
        </branch>
        <branch name="XLXN_192(31:0)">
            <wire x2="2368" y1="336" y2="336" x1="2144" />
            <wire x2="2368" y1="336" y2="832" x1="2368" />
            <wire x2="2416" y1="832" y2="832" x1="2368" />
        </branch>
        <branch name="XLXN_193(3:0)">
            <wire x2="2144" y1="576" y2="576" x1="1152" />
            <wire x2="2144" y1="576" y2="2112" x1="2144" />
            <wire x2="3136" y1="2112" y2="2112" x1="2144" />
        </branch>
        <branch name="XLXN_194(31:0)">
            <wire x2="2320" y1="640" y2="640" x1="1152" />
            <wire x2="2320" y1="640" y2="768" x1="2320" />
            <wire x2="2416" y1="768" y2="768" x1="2320" />
        </branch>
        <branch name="XLXN_195(3:0)">
            <wire x2="1264" y1="704" y2="704" x1="1152" />
            <wire x2="1264" y1="704" y2="1200" x1="1264" />
            <wire x2="2432" y1="1200" y2="1200" x1="1264" />
        </branch>
        <branch name="XLXN_196(31:0)">
            <wire x2="1760" y1="768" y2="768" x1="1152" />
            <wire x2="1760" y1="768" y2="1264" x1="1760" />
            <wire x2="2432" y1="1264" y2="1264" x1="1760" />
        </branch>
        <branch name="XLXN_197(31:0)">
            <wire x2="1584" y1="832" y2="832" x1="1152" />
            <wire x2="1584" y1="400" y2="832" x1="1584" />
            <wire x2="1632" y1="400" y2="400" x1="1584" />
        </branch>
        <branch name="XLXN_200(7:0)">
            <wire x2="1568" y1="256" y2="256" x1="1152" />
            <wire x2="1632" y1="192" y2="192" x1="1568" />
            <wire x2="1568" y1="192" y2="256" x1="1568" />
        </branch>
        <branch name="XLXN_203(31:0)">
            <wire x2="512" y1="352" y2="352" x1="400" />
            <wire x2="512" y1="352" y2="768" x1="512" />
            <wire x2="512" y1="768" y2="768" x1="496" />
        </branch>
        <text style="fontsize:30;fontname:Arial" x="176" y="356">Instruction (R2)</text>
        <rect width="240" x="160" y="320" height="84" />
        <branch name="XLXN_206">
            <wire x2="112" y1="896" y2="896" x1="96" />
            <wire x2="96" y1="896" y2="1088" x1="96" />
            <wire x2="1168" y1="1088" y2="1088" x1="96" />
            <wire x2="1168" y1="960" y2="960" x1="1152" />
            <wire x2="1168" y1="960" y2="1088" x1="1168" />
        </branch>
        <text style="fontsize:30;fontname:Arial" x="204" y="1208">Next PC (R1)</text>
        <rect width="264" x="164" y="1156" height="108" />
        <instance x="3136" y="2208" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_217(31:0)">
            <wire x2="592" y1="192" y2="192" x1="96" />
            <wire x2="96" y1="192" y2="352" x1="96" />
            <wire x2="160" y1="352" y2="352" x1="96" />
        </branch>
        <branch name="XLXN_211(31:0)">
            <wire x2="1232" y1="1216" y2="1216" x1="432" />
            <wire x2="1168" y1="896" y2="896" x1="1152" />
            <wire x2="1232" y1="896" y2="896" x1="1168" />
            <wire x2="1232" y1="896" y2="1216" x1="1232" />
        </branch>
        <instance x="1632" y="608" name="XLXI_11" orien="R0">
        </instance>
    </sheet>
</drawing>