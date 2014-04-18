<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_218(31:0)" />
        <signal name="XLXN_219(31:0)" />
        <signal name="XLXN_220(31:0)" />
        <signal name="XLXN_221(31:0)" />
        <signal name="XLXN_222(3:0)" />
        <signal name="XLXN_223(3:0)" />
        <signal name="XLXN_224(7:0)" />
        <signal name="XLXN_225(7:0)" />
        <signal name="XLXN_226(3:0)" />
        <blockdef name="Fetch">
            <timestamp>2014-4-18T16:22:23</timestamp>
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="256" x="64" y="-128" height="256" />
        </blockdef>
        <blockdef name="MemoryAccess">
            <timestamp>2014-4-18T16:23:42</timestamp>
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
        <blockdef name="Decode">
            <timestamp>2014-4-18T16:22:51</timestamp>
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
        <blockdef name="Execute">
            <timestamp>2014-4-18T16:23:23</timestamp>
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
        <blockdef name="WriteBack">
            <timestamp>2014-4-18T16:24:17</timestamp>
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
            <timestamp>2014-4-18T16:23:54</timestamp>
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
        <blockdef name="PipelineControl_ID_EX">
            <timestamp>2014-4-18T16:23:8</timestamp>
            <rect width="848" x="64" y="-896" height="896" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
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
            <line x2="976" y1="-864" y2="-864" x1="912" />
            <rect width="64" x="912" y="-812" height="24" />
            <line x2="976" y1="-800" y2="-800" x1="912" />
            <rect width="64" x="912" y="-748" height="24" />
            <line x2="976" y1="-736" y2="-736" x1="912" />
            <rect width="64" x="912" y="-684" height="24" />
            <line x2="976" y1="-672" y2="-672" x1="912" />
            <rect width="64" x="912" y="-620" height="24" />
            <line x2="976" y1="-608" y2="-608" x1="912" />
            <rect width="64" x="912" y="-556" height="24" />
            <line x2="976" y1="-544" y2="-544" x1="912" />
            <rect width="64" x="912" y="-492" height="24" />
            <line x2="976" y1="-480" y2="-480" x1="912" />
            <rect width="64" x="912" y="-428" height="24" />
            <line x2="976" y1="-416" y2="-416" x1="912" />
            <rect width="64" x="912" y="-364" height="24" />
            <line x2="976" y1="-352" y2="-352" x1="912" />
            <rect width="64" x="912" y="-300" height="24" />
            <line x2="976" y1="-288" y2="-288" x1="912" />
            <rect width="64" x="912" y="-236" height="24" />
            <line x2="976" y1="-224" y2="-224" x1="912" />
            <rect width="64" x="912" y="-172" height="24" />
            <line x2="976" y1="-160" y2="-160" x1="912" />
            <rect width="64" x="912" y="-108" height="24" />
            <line x2="976" y1="-96" y2="-96" x1="912" />
        </blockdef>
        <blockdef name="PipelineControl_IF_ID">
            <timestamp>2014-4-18T16:21:49</timestamp>
            <rect width="544" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="608" y="-108" height="24" />
            <line x2="672" y1="-96" y2="-96" x1="608" />
        </blockdef>
        <blockdef name="Pipelinecontrol_EX_MEM">
            <timestamp>2014-4-18T16:23:32</timestamp>
            <rect width="864" x="64" y="-768" height="768" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
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
            <line x2="992" y1="-736" y2="-736" x1="928" />
            <rect width="64" x="928" y="-684" height="24" />
            <line x2="992" y1="-672" y2="-672" x1="928" />
            <rect width="64" x="928" y="-620" height="24" />
            <line x2="992" y1="-608" y2="-608" x1="928" />
            <rect width="64" x="928" y="-556" height="24" />
            <line x2="992" y1="-544" y2="-544" x1="928" />
            <rect width="64" x="928" y="-492" height="24" />
            <line x2="992" y1="-480" y2="-480" x1="928" />
            <rect width="64" x="928" y="-428" height="24" />
            <line x2="992" y1="-416" y2="-416" x1="928" />
            <rect width="64" x="928" y="-364" height="24" />
            <line x2="992" y1="-352" y2="-352" x1="928" />
            <rect width="64" x="928" y="-300" height="24" />
            <line x2="992" y1="-288" y2="-288" x1="928" />
            <rect width="64" x="928" y="-236" height="24" />
            <line x2="992" y1="-224" y2="-224" x1="928" />
            <rect width="64" x="928" y="-172" height="24" />
            <line x2="992" y1="-160" y2="-160" x1="928" />
            <rect width="64" x="928" y="-108" height="24" />
            <line x2="992" y1="-96" y2="-96" x1="928" />
        </blockdef>
        <blockdef name="PipelineControl_MEM_WB">
            <timestamp>2014-4-18T16:24:3</timestamp>
            <rect width="1008" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
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
            <line x2="1136" y1="-480" y2="-480" x1="1072" />
            <rect width="64" x="1072" y="-428" height="24" />
            <line x2="1136" y1="-416" y2="-416" x1="1072" />
            <rect width="64" x="1072" y="-364" height="24" />
            <line x2="1136" y1="-352" y2="-352" x1="1072" />
            <rect width="64" x="1072" y="-300" height="24" />
            <line x2="1136" y1="-288" y2="-288" x1="1072" />
            <rect width="64" x="1072" y="-236" height="24" />
            <line x2="1136" y1="-224" y2="-224" x1="1072" />
            <rect width="64" x="1072" y="-172" height="24" />
            <line x2="1136" y1="-160" y2="-160" x1="1072" />
            <rect width="64" x="1072" y="-108" height="24" />
            <line x2="1136" y1="-96" y2="-96" x1="1072" />
        </blockdef>
        <block symbolname="Fetch" name="XLXI_12">
            <blockpin name="clock" />
            <blockpin name="pc(31:0)" />
            <blockpin signalname="XLXN_218(31:0)" name="instr(31:0)" />
            <blockpin name="sel_getnextpc" />
        </block>
        <block symbolname="MemoryAccess" name="XLXI_13">
            <blockpin name="opcode(7:0)" />
            <blockpin name="Rd(31:0)" />
            <blockpin name="effective_addr(31:0)" />
            <blockpin name="mem_word(31:0)" />
        </block>
        <block symbolname="Decode" name="XLXI_14">
            <blockpin signalname="XLXN_219(31:0)" name="instruction(31:0)" />
            <blockpin name="getnextpc" />
            <blockpin signalname="XLXN_222(3:0)" name="op_type(3:0)" />
            <blockpin signalname="XLXN_224(7:0)" name="op_alu(7:0)" />
            <blockpin signalname="XLXN_225(7:0)" name="op_datamove(7:0)" />
            <blockpin signalname="XLXN_226(3:0)" name="ALU_Rd_addr(3:0)" />
            <blockpin name="ALU_Rn1(31:0)" />
            <blockpin name="ALU_Rn2(31:0)" />
            <blockpin name="DataMove_Rd_addr(3:0)" />
            <blockpin name="DataMove_Rd(31:0)" />
            <blockpin name="addrmode(3:0)" />
            <blockpin name="immd_word(31:0)" />
            <blockpin name="memaddr_offset(31:0)" />
            <blockpin name="ExecNextPC(31:0)" />
        </block>
        <block symbolname="Execute" name="XLXI_15">
            <blockpin name="op_alu(7:0)" />
            <blockpin name="ALU_op1(31:0)" />
            <blockpin name="ALU_op2(31:0)" />
            <blockpin name="memaddr_offset(31:0)" />
            <blockpin name="Exec_out(31:0)" />
            <blockpin name="effective_addr(31:0)" />
        </block>
        <block symbolname="WriteBack" name="XLXI_16">
            <blockpin name="op_type(3:0)" />
            <blockpin name="ALU_Rd_addr(3:0)" />
            <blockpin name="Exec_out(31:0)" />
            <blockpin name="LDR_addr(3:0)" />
            <blockpin name="LDR_word(31:0)" />
        </block>
        <block symbolname="Mux_LoadWord" name="XLXI_17">
            <blockpin name="sel_src(3:0)" />
            <blockpin name="load_word_ID(31:0)" />
            <blockpin name="load_word_MEM(31:0)" />
            <blockpin name="load_word(31:0)" />
        </block>
        <block symbolname="PipelineControl_ID_EX" name="XLXI_18">
            <blockpin name="clock" />
            <blockpin name="in_REG_ID_EX_getnextpc" />
            <blockpin signalname="XLXN_222(3:0)" name="in_REG_ID_EX_op_type(3:0)" />
            <blockpin signalname="XLXN_224(7:0)" name="in_REG_ID_EX_op_alu(7:0)" />
            <blockpin signalname="XLXN_225(7:0)" name="in_REG_ID_EX_op_datamove(7:0)" />
            <blockpin signalname="XLXN_226(3:0)" name="in_REG_ID_EX_ALU_Rd_addr(3:0)" />
            <blockpin name="in_REG_ID_EX_ALU_Rn1(31:0)" />
            <blockpin name="in_REG_ID_EX_ALU_Rn2(31:0)" />
            <blockpin name="in_REG_ID_EX_DataMove_Rd_addr(3:0)" />
            <blockpin name="in_REG_ID_EX_DataMove_Rd(31:0)" />
            <blockpin name="in_REG_ID_EX_addrmode(3:0)" />
            <blockpin name="in_REG_ID_EX_immd_word(31:0)" />
            <blockpin name="in_REG_ID_EX_memaddr_offset(31:0)" />
            <blockpin name="in_REG_ID_EX_ExecNextPC(31:0)" />
            <blockpin name="out_REG_ID_EX_getnextpc" />
            <blockpin name="out_REG_ID_EX_op_type(3:0)" />
            <blockpin name="out_REG_ID_EX_op_alu(7:0)" />
            <blockpin name="out_REG_ID_EX_op_datamove(7:0)" />
            <blockpin name="out_REG_ID_EX_ALU_Rd_addr(3:0)" />
            <blockpin name="out_REG_ID_EX_ALU_Rn1(31:0)" />
            <blockpin name="out_REG_ID_EX_ALU_Rn2(31:0)" />
            <blockpin name="out_REG_ID_EX_DataMove_Rd_addr(3:0)" />
            <blockpin name="out_REG_ID_EX_DataMove_Rd(31:0)" />
            <blockpin name="out_REG_ID_EX_addrmode(3:0)" />
            <blockpin name="out_REG_ID_EX_immd_word(31:0)" />
            <blockpin name="out_REG_ID_EX_memaddr_offset(31:0)" />
            <blockpin name="out_REG_ID_EX_ExecNextPC(31:0)" />
        </block>
        <block symbolname="PipelineControl_IF_ID" name="XLXI_19">
            <blockpin name="clock" />
            <blockpin signalname="XLXN_218(31:0)" name="in_REG_IF_ID_instr(31:0)" />
            <blockpin signalname="XLXN_219(31:0)" name="out_REG_IF_ID_instr(31:0)" />
        </block>
        <block symbolname="Pipelinecontrol_EX_MEM" name="XLXI_21">
            <blockpin name="clock" />
            <blockpin name="in_REG_ID_EX_getnextpc" />
            <blockpin name="in_REG_EX_MEM_Exec_out(31:0)" />
            <blockpin name="in_REG_EX_MEM_effective_addr(31:0)" />
            <blockpin name="in_REG_ID_EX_op_type(3:0)" />
            <blockpin name="in_REG_ID_EX_op_datamove(7:0)" />
            <blockpin name="in_REG_ID_EX_ALU_Rd_addr(3:0)" />
            <blockpin name="in_REG_ID_EX_DataMove_Rd_addr(3:0)" />
            <blockpin name="in_REG_ID_EX_DataMove_Rd(31:0)" />
            <blockpin name="in_REG_ID_EX_addrmode(3:0)" />
            <blockpin name="in_REG_ID_EX_immd_word(31:0)" />
            <blockpin name="in_REG_ID_EX_ExecNextPC(31:0)" />
            <blockpin name="out_REG_ID_EX_MEM_getnextpc" />
            <blockpin name="out_REG_EX_MEM_Exec_out(31:0)" />
            <blockpin name="out_REG_EX_MEM_effective_addr(31:0)" />
            <blockpin name="out_REG_EX_MEM_op_type(3:0)" />
            <blockpin name="out_REG_EX_MEM_op_datamove(7:0)" />
            <blockpin name="out_REG_EX_MEM_ALU_Rd_addr(3:0)" />
            <blockpin name="out_REG_EX_MEM_DataMove_Rd_addr(3:0)" />
            <blockpin name="out_REG_EX_MEM_DataMove_Rd(31:0)" />
            <blockpin name="out_REG_EX_MEM_addrmode(3:0)" />
            <blockpin name="out_REG_EX_MEM_immd_word(31:0)" />
            <blockpin name="out_REG_ID_EX_MEM_ExecNextPC(31:0)" />
        </block>
        <block symbolname="PipelineControl_MEM_WB" name="XLXI_22">
            <blockpin name="clock" />
            <blockpin name="in_REG_ID_EX_MEM_getnextpc" />
            <blockpin name="in_MEM_load_mem_word(31:0)" />
            <blockpin name="in_REG_EX_MEM_Exec_out(31:0)" />
            <blockpin name="in_REG_ID_EX_MEM_op_type(3:0)" />
            <blockpin name="in_REG_ID_EX_MEM_ALU_Rd_addr(3:0)" />
            <blockpin name="in_REG_ID_EX_MEM_DataMove_Rd_addr(3:0)" />
            <blockpin name="in_REG_ID_EX_MEM_ExecNextPC(31:0)" />
            <blockpin name="out_REG_ID_EX_MEM_WB_getnextpc" />
            <blockpin name="out_MEM_WB_load_mem_word(31:0)" />
            <blockpin name="out_REG_EX_MEM_WB_Exec_out(31:0)" />
            <blockpin name="out_REG_ID_EX_MEM_WB_op_type(3:0)" />
            <blockpin name="out_REG_ID_EX_MEM_WB_ALU_Rd_addr(3:0)" />
            <blockpin name="out_REG_ID_EX_MEM_WB_DataMove_Rd_addr(3:0)" />
            <blockpin name="out_REG_ID_EX_MEM_WB_ExecNextPC(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7609" height="5382">
        <attr value="CM" name="LengthUnitName" />
        <attr value="4" name="GridsPerUnit" />
        <instance x="3008" y="944" name="XLXI_15" orien="R0">
        </instance>
        <instance x="3088" y="2944" name="XLXI_21" orien="R0">
        </instance>
        <instance x="4432" y="2704" name="XLXI_22" orien="R0">
        </instance>
        <instance x="4448" y="720" name="XLXI_13" orien="R0">
        </instance>
        <instance x="5136" y="1424" name="XLXI_17" orien="R0">
        </instance>
        <instance x="6384" y="1040" name="XLXI_16" orien="R0">
        </instance>
        <instance x="1424" y="1216" name="XLXI_14" orien="R0">
        </instance>
        <branch name="XLXN_218(31:0)">
            <wire x2="880" y1="1296" y2="1296" x1="448" />
            <wire x2="448" y1="1296" y2="2096" x1="448" />
            <wire x2="528" y1="2096" y2="2096" x1="448" />
            <wire x2="880" y1="336" y2="336" x1="864" />
            <wire x2="880" y1="336" y2="1296" x1="880" />
        </branch>
        <branch name="XLXN_219(31:0)">
            <wire x2="1312" y1="2032" y2="2032" x1="1200" />
            <wire x2="1312" y1="352" y2="2032" x1="1312" />
            <wire x2="1424" y1="352" y2="352" x1="1312" />
        </branch>
        <instance x="480" y="432" name="XLXI_12" orien="R0">
        </instance>
        <instance x="528" y="2128" name="XLXI_19" orien="R0">
        </instance>
        <branch name="XLXN_222(3:0)">
            <wire x2="2416" y1="1472" y2="1472" x1="1856" />
            <wire x2="1856" y1="1472" y2="2160" x1="1856" />
            <wire x2="1920" y1="2160" y2="2160" x1="1856" />
            <wire x2="2416" y1="352" y2="352" x1="1984" />
            <wire x2="2416" y1="352" y2="1472" x1="2416" />
        </branch>
        <instance x="1920" y="2896" name="XLXI_18" orien="R0">
        </instance>
        <branch name="XLXN_224(7:0)">
            <wire x2="1808" y1="1392" y2="2224" x1="1808" />
            <wire x2="1920" y1="2224" y2="2224" x1="1808" />
            <wire x2="2352" y1="1392" y2="1392" x1="1808" />
            <wire x2="2352" y1="416" y2="416" x1="1984" />
            <wire x2="2352" y1="416" y2="1392" x1="2352" />
        </branch>
        <branch name="XLXN_225(7:0)">
            <wire x2="1888" y1="1952" y2="2288" x1="1888" />
            <wire x2="1920" y1="2288" y2="2288" x1="1888" />
            <wire x2="2048" y1="1952" y2="1952" x1="1888" />
            <wire x2="2048" y1="480" y2="480" x1="1984" />
            <wire x2="2048" y1="480" y2="1952" x1="2048" />
        </branch>
        <branch name="XLXN_226(3:0)">
            <wire x2="1920" y1="2352" y2="2352" x1="1856" />
            <wire x2="1856" y1="2352" y2="2960" x1="1856" />
            <wire x2="2976" y1="2960" y2="2960" x1="1856" />
            <wire x2="2976" y1="544" y2="544" x1="1984" />
            <wire x2="2976" y1="544" y2="2960" x1="2976" />
        </branch>
    </sheet>
</drawing>