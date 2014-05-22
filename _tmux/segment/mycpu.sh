# Prints the CPU usage: user% sys% idle.

run_segment() {
	if shell_is_linux; then
		cpu_line=$(top -b -n 1 | grep "Cpu(s)" )
		cpu_idle=$(echo "$cpu_line" | grep -Po "(\d+(.\d+)?)(?=%?\s?(id(le)?))")
        cpu_used=$(echo "scale=1; 100 - $cpu_idle" | bc)
	elif shell_is_osx; then 
		cpus_line=$(top -e -l 1 | grep "CPU usage:" | sed 's/CPU usage: //')
		cpu_idle=$(echo "$cpus_line" | awk '{print $5}'  | sed 's/%//' )
        cpu_used=$(echo "scale=1; 100 - $cpu_idle" | bc)
	fi

	if [ -n "$cpu_used" ]; then
		echo "${cpu_used}" | awk -F', ' '{printf("CPU:%.1f%%",$1)}'
		return 0
	else
		return 1
	fi
}
