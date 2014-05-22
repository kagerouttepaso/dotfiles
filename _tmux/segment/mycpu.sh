# Prints the CPU usage: user% sys% idle.

run_segment() {
    if shell_is_linux; then
        mem_total=`vmstat -s | sed -n 1p | sed -e "s/^ *\([^ ]\+\) .*/\1/"`
        stat=`vmstat 1 2 | sed -n 4p`
        cpu_stat=`echo ${stat}    | sed -e "s/^ *\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+ \+[^ ]\+\ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\ \+[^ ]\+\ \+[^ ]\+\).*$/\6/g"`
        memory_stat=`echo ${stat} | sed -e "s/^ *\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+ \+[^ ]\+\ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\ \+[^ ]\+\ \+[^ ]\+\).*$/\2/g"`

        cpu_idle=`echo $cpu_stat        | sed -e "s/^ *\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\).*$/\3/g"`
        memory_free=`echo $memory_stat  | sed -e "s/^ *\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\).*$/\2/g"`
        memory_buff=`echo $memory_stat  | sed -e "s/^ *\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\).*$/\3/g"`
        memory_cache=`echo $memory_stat | sed -e "s/^ *\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\).*$/\4/g"`

        mem_used=$(echo "scale=1; $mem_total - $memory_buff - $memory_free - $memory_cache " | bc)
        mem_per=$(echo "scale=1; ( $mem_used *100 ) / ( $mem_total ) " | bc)

        cpu_used=$(echo "scale=1; 100 - $cpu_idle" | bc)
    elif shell_is_osx; then 
        cpus_line=$(top -e -l 1 | grep "CPU usage:" | sed 's/CPU usage: //')
        cpu_idle=$(echo "$cpus_line" | awk '{print $5}'  | sed 's/%//' )
        cpu_used=$(echo "scale=1; 100 - $cpu_idle" | bc)
    fi

    if [ -n "$cpu_used" ] && [ -n "$mem_per" ]; then
        printf "C:%d%% M:%d%%" ${cpu_used} ${mem_per}
        return 0
    else
        return 1
    fi
}
aaa() {
    #vmstat 1 2
    #procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
    # r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
    # 2  0  14452 178844  45960 164608    0    1    64    70   98  173  1  7 92  0  0
    #vmstat -s
    #501600 K total memory
    #434996 K used memory
    #136460 K active memory
    #216500 K inactive memory
    #66604 K free memory
    #57920 K buffer memory
    #229568 K swap cache
    #782332 K total swap
    #14452 K used swap
    #767880 K free swap
    #21660 non-nice user cpu ticks
    #395 nice user cpu ticks
    #268072 system cpu ticks
    #3860721 idle cpu ticks
    #3855 IO-wait cpu ticks
    #16955 IRQ cpu ticks
    #0 softirq cpu ticks
    #0 stolen cpu ticks
    #2385980 pages paged in
    #2551422 pages paged out
    #2021 pages swapped in
    #5258 pages swapped out
    #3991794 interrupts
    #7066691 CPU context switches
    #1400738831 boot time
    #458657 forks


    mem_total=`vmstat -s | sed -n 1p | sed -e "s/^ *\([^ ]\+\) .*/\1/"`
    mem_used=`vmstat -s  | sed -n 2p | sed -e "s/^ *\([^ ]\+\) .*/\1/"`

    stat=`vmstat 1 2          | sed -n 4p`
    procs_stat=`echo ${stat}  | sed -e "s/^ *\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+ \+[^ ]\+\ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\ \+[^ ]\+\ \+[^ ]\+\).*$/\1/g"`
    memory_stat=`echo ${stat} | sed -e "s/^ *\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+ \+[^ ]\+\ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\ \+[^ ]\+\ \+[^ ]\+\).*$/\2/g"`
    swap_stat=`echo ${stat}   | sed -e "s/^ *\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+ \+[^ ]\+\ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\ \+[^ ]\+\ \+[^ ]\+\).*$/\3/g"`
    io_stat=`echo ${stat}     | sed -e "s/^ *\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+ \+[^ ]\+\ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\ \+[^ ]\+\ \+[^ ]\+\).*$/\4/g"`
    system_stat=`echo ${stat} | sed -e "s/^ *\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+ \+[^ ]\+\ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\ \+[^ ]\+\ \+[^ ]\+\).*$/\5/g"`
    cpu_stat=`echo ${stat}    | sed -e "s/^ *\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+ \+[^ ]\+\ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\) \+\([^ ]\+ \+[^ ]\+\ \+[^ ]\+\ \+[^ ]\+\).*$/\6/g"`

    memory_free=`echo $memory_stat  | sed -e "s/^ *\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\).*$/\2/g"`
    memory_buff=`echo $memory_stat  | sed -e "s/^ *\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\).*$/\3/g"`
    memory_cache=`echo $memory_stat | sed -e "s/^ *\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\).*$/\4/g"`
    cpu_idle=`echo $cpu_stat        | sed -e "s/^ *\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\) \+\([^ ]\+\).*$/\3/g"`
    cpu_used=$(echo "scale=1; 100 - $cpu_idle" | bc)
}
