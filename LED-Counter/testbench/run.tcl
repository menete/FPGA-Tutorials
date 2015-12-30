

quietly set INSTALL_HOME [file dirname [file nativename $::env(MODEL_TECH)]]

proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }

set TOP_LEVEL_NAME TestBench

# Make Libraries 
ensure_lib ./libraries
ensure_lib ./libraries/work
vmap       work ./libraries/work/



alias tb_com {
set vlog_cmd "vlog -incr \
   TestBench.sv \
   ../hdl/LED_Counter.sv \
   ../hdl/ResetSync.sv \
   "
eval $vlog_cmd
}

alias sim {
    # Compile additional TestBench files
    tb_com
    vsim -t ps -L work -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneve_ver $TOP_LEVEL_NAME
    do wave.do
}
