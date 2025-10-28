# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#     Author: Jozef Pupava
##########################################
*** Settings ***
Library    Process
Library    OperatingSystem
Library    ../../lib/LinuxLab_HRT_Lib.py

Documentation    Compare static sysctl parameter values with the default values of the GA version of the OS release.

*** Test Cases ***
### BEGIN ###  Depends of the RAM resources
Sysctl_fs_epoll_max_user_watches
    [Documentation]    Depends of the RAM resources bsc#1183339#c11
    Sysctl Check Param Int    fs.epoll.max_user_watches    400000:450000
Sysctl_kernel_threads-max
    [Documentation]    Depends of the RAM resources bsc#1183339#c11
    Sysctl Check Param Int    kernel.threads-max    15000:16000
Sysctl_net_ipv4_tcp_max_orphans
    [Documentation]    Depends of the RAM resources
    Sysctl Check Param Int    net.ipv4.tcp_max_orphans    8192
Sysctl_net_ipv4_tcp_max_syn_backlog
    [Documentation]    Depends of the RAM resources
    Sysctl Check Param Int    net.ipv4.tcp_max_syn_backlog    128
Sysctl_net_ipv4_tcp_max_tw_buckets
    [Documentation]    Depends of the RAM resources
    Sysctl Check Param Int    net.ipv4.tcp_max_tw_buckets    8192
Sysctl_net_ipv4_tcp_mem
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1212403#c11 bsc#1252014#c1
    Sysctl Check Param Int    net.ipv4.tcp_mem    21800:23000 29300:31000 44000:46000
Sysctl_net_ipv4_udp_mem
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1202375#c1 bsc#1202375#c4 bsc#1252014#c1
    Sysctl Check Param Int    net.ipv4.udp_mem    44000:46000 58000:61000 88000:91000
Sysctl_user_max_cgroup_namespaces
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1202375#c1 bsc#1252014#c1
    Sysctl Check Param Int    user.max_cgroup_namespaces    7500:7800
Sysctl_user_max_ipc_namespaces
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1202375#c1 bsc#1252014#c1
    Sysctl Check Param Int    user.max_ipc_namespaces    7500:7800
Sysctl_user_max_mnt_namespaces
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1202375#c1 bsc#1252014#c1
    Sysctl Check Param Int    user.max_mnt_namespaces    7500:7800
Sysctl_user_max_net_namespaces
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1202375#c1 bsc#1252014#c1
    Sysctl Check Param Int    user.max_net_namespaces    7500:7800
Sysctl_user_max_pid_namespaces
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1202375#c1 bsc#1252014#c1
    Sysctl Check Param Int    user.max_pid_namespaces    7500:7800
Sysctl_user_max_time_namespaces
    Sysctl Check Param Int    user.max_time_namespaces    7500:7800
Sysctl_user_max_user_namespaces
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1202375#c1 bsc#1252014#c1
    Sysctl Check Param Int    user.max_user_namespaces    7500:7800
Sysctl_user_max_uts_namespaces
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1202375#c1 bsc#1252014#c1
    Sysctl Check Param Int    user.max_uts_namespaces    7500:7800
Sysctl_vm_user_reserve_kbytes
    [Documentation]    Depends of the RAM resources bsc#1252014#c1
    Sysctl Check Param Int    vm.user_reserve_kbytes    60000:63000
### END ###  Depends of the RAM resources
Sysctl_abi_vsyscall32
    Sysctl Check Param Int    abi.vsyscall32    1
Sysctl_crypto_fips_enabled
    Sysctl Check Param Int    crypto.fips_enabled    0
Sysctl_debug_exception-trace
    Sysctl Check Param Int    debug.exception-trace    1
Sysctl_debug_kprobes-optimization
    Sysctl Check Param Int    debug.kprobes-optimization    1
Sysctl_dev_hpet_max-user-freq
    Sysctl Check Param Int    dev.hpet.max-user-freq    64
Sysctl_dev_scsi_logging_level
    Sysctl Check Param Int    dev.scsi.logging_level    0
Sysctl_dev_tty_ldisc_autoload
    Sysctl Check Param Int    dev.tty.ldisc_autoload    1
Sysctl_fs_aio-max-nr
    Sysctl Check Param Int    fs.aio-max-nr    65536
Sysctl_fs_aio-nr
    Sysctl Check Param Int    fs.aio-nr    0
Sysctl_fs_binfmt_misc_status
    Sysctl Check Param Str    fs.binfmt_misc.status    enabled
Sysctl_fs_dir-notify-enable
    Sysctl Check Param Int    fs.dir-notify-enable    1
Sysctl_fs_file-max
    Sysctl Check Param Int    fs.file-max    9223372036854775807
Sysctl_fs_inotify_max_queued_events
    Sysctl Check Param Int    fs.inotify.max_queued_events    16384
Sysctl_fs_inotify_max_user_instances
    Sysctl Check Param Int    fs.inotify.max_user_instances    8192
Sysctl_fs_inotify_max_user_watches
    [Documentation]    Depends of the RAM resources bsc#1183339#c11
    Sysctl Check Param Int    fs.inotify.max_user_watches    15070%0.5
Sysctl_fs_lease-break-time
    Sysctl Check Param Int    fs.lease-break-time    45
Sysctl_fs_leases-enable
    Sysctl Check Param Int    fs.leases-enable    1
Sysctl_fs_mount-max
    Sysctl Check Param Int    fs.mount-max    100000
Sysctl_fs_mqueue_msg_default
    Sysctl Check Param Int    fs.mqueue.msg_default    10
Sysctl_fs_mqueue_msg_max
    Sysctl Check Param Int    fs.mqueue.msg_max    10
Sysctl_fs_mqueue_msgsize_default
    Sysctl Check Param Int    fs.mqueue.msgsize_default    8192
Sysctl_fs_mqueue_msgsize_max
    Sysctl Check Param Int    fs.mqueue.msgsize_max    8192
Sysctl_fs_mqueue_queues_max
    Sysctl Check Param Int    fs.mqueue.queues_max    256
Sysctl_fs_nr_open
    Sysctl Check Param Int    fs.nr_open    1048576
Sysctl_fs_pipe-max-size
    Sysctl Check Param Int    fs.pipe-max-size    1048576
Sysctl_fs_pipe-user-pages-hard
    Sysctl Check Param Int    fs.pipe-user-pages-hard    0
Sysctl_fs_pipe-user-pages-soft
    Sysctl Check Param Int    fs.pipe-user-pages-soft    16384
Sysctl_fs_protected_fifos
    Sysctl Check Param Int    fs.protected_fifos    2
Sysctl_fs_protected_hardlinks
    Sysctl Check Param Int    fs.protected_hardlinks    1
Sysctl_fs_protected_regular
    Sysctl Check Param Int    fs.protected_regular    2
Sysctl_fs_protected_symlinks
    Sysctl Check Param Int    fs.protected_symlinks    1
Sysctl_fs_quota_allocated_dquots
    Sysctl Check Param Int    fs.quota.allocated_dquots    0
Sysctl_fs_quota_cache_hits
    Sysctl Check Param Int    fs.quota.cache_hits    0
Sysctl_fs_quota_drops
    Sysctl Check Param Int    fs.quota.drops    0
Sysctl_fs_quota_free_dquots
    Sysctl Check Param Int    fs.quota.free_dquots    0
Sysctl_fs_quota_lookups
    Sysctl Check Param Int    fs.quota.lookups    0
Sysctl_fs_quota_reads
    Sysctl Check Param Int    fs.quota.reads    0
Sysctl_fs_quota_syncs
    Sysctl Check Param Int    fs.quota.syncs    0
Sysctl_fs_quota_writes
    Sysctl Check Param Int    fs.quota.writes    0
Sysctl_fs_suid_dumpable
    Sysctl Check Param Int    fs.suid_dumpable    2
Sysctl_kernel_acct
    Sysctl Check Param Int    kernel.acct    4 2 30
Sysctl_kernel_acpi_video_flags
    Sysctl Check Param Int    kernel.acpi_video_flags    0
Sysctl_kernel_auto_msgmni
    Sysctl Check Param Int    kernel.auto_msgmni    0
Sysctl_kernel_bootloader_type
    Sysctl Check Param Int    kernel.bootloader_type    6
Sysctl_kernel_bootloader_version
    Sysctl Check Param Int    kernel.bootloader_version    38
Sysctl_kernel_bpf_stats_enabled
    Sysctl Check Param Int    kernel.bpf_stats_enabled    0
Sysctl_kernel_cad_pid
    Sysctl Check Param Int    kernel.cad_pid    1
Sysctl_kernel_cap_last_cap
    Sysctl Check Param Int    kernel.cap_last_cap    40
Sysctl_kernel_core_pattern
    Sysctl Check Param Str    kernel.core_pattern    |/usr/lib/systemd/systemd-coredump %P %u %g %s %t %c %h %d %F
Sysctl_kernel_core_pipe_limit
    Sysctl Check Param Int    kernel.core_pipe_limit    16
Sysctl_kernel_core_uses_pid
    Sysctl Check Param Int    kernel.core_uses_pid    0
Sysctl_kernel_ctrl-alt-del
    Sysctl Check Param Int    kernel.ctrl-alt-del    0
Sysctl_kernel_dmesg_restrict
    Sysctl Check Param Int    kernel.dmesg_restrict    0
Sysctl_kernel_domainname
    Sysctl Check Param Str    kernel.domainname    (none)
Sysctl_kernel_firmware_config_force_sysfs_fallback
    Sysctl Check Param Int    kernel.firmware_config.force_sysfs_fallback    0
Sysctl_kernel_firmware_config_ignore_sysfs_fallback
    Sysctl Check Param Int    kernel.firmware_config.ignore_sysfs_fallback    0
Sysctl_kernel_ftrace_dump_on_oops
    Sysctl Check Param Int    kernel.ftrace_dump_on_oops    0
Sysctl_kernel_ftrace_enabled
    Sysctl Check Param Int    kernel.ftrace_enabled    1
Sysctl_kernel_hardlockup_all_cpu_backtrace
    Sysctl Check Param Int    kernel.hardlockup_all_cpu_backtrace    0
Sysctl_kernel_hardlockup_panic
    Sysctl Check Param Int    kernel.hardlockup_panic    1
Sysctl_kernel_hotplug
    Sysctl Check Param Empty    kernel.hotplug
Sysctl_kernel_hung_task_check_count
    Sysctl Check Param Int    kernel.hung_task_check_count    4194304
Sysctl_kernel_hung_task_check_interval_secs
    Sysctl Check Param Int    kernel.hung_task_check_interval_secs    0
Sysctl_kernel_hung_task_panic
    Sysctl Check Param Int    kernel.hung_task_panic    0
Sysctl_kernel_hung_task_timeout_secs
    Sysctl Check Param Int    kernel.hung_task_timeout_secs    0
Sysctl_kernel_hung_task_warnings
    Sysctl Check Param Int    kernel.hung_task_warnings    10
Sysctl_kernel_io_delay_type
    Sysctl Check Param Int    kernel.io_delay_type    0
Sysctl_kernel_kexec_load_disabled
    Sysctl Check Param Int    kernel.kexec_load_disabled    0
Sysctl_kernel_keys_gc_delay
    Sysctl Check Param Int    kernel.keys.gc_delay    300
Sysctl_kernel_keys_maxbytes
    Sysctl Check Param Int    kernel.keys.maxbytes    20000
Sysctl_kernel_keys_maxkeys
    Sysctl Check Param Int    kernel.keys.maxkeys    200
Sysctl_kernel_keys_persistent_keyring_expiry
    Sysctl Check Param Int    kernel.keys.persistent_keyring_expiry    259200
Sysctl_kernel_keys_root_maxbytes
    Sysctl Check Param Int    kernel.keys.root_maxbytes    25000000
Sysctl_kernel_keys_root_maxkeys
    Sysctl Check Param Int    kernel.keys.root_maxkeys    1000000
Sysctl_kernel_kptr_restrict
    Sysctl Check Param Int    kernel.kptr_restrict    1
Sysctl_kernel_max_lock_depth
    Sysctl Check Param Int    kernel.max_lock_depth    1024
Sysctl_kernel_modprobe
    Sysctl Check Param Str    kernel.modprobe    /usr/sbin/modprobe
Sysctl_kernel_modules_disabled
    Sysctl Check Param Int    kernel.modules_disabled    0
Sysctl_kernel_msg_next_id
    Sysctl Check Param Int    kernel.msg_next_id    -1
Sysctl_kernel_msgmax
    Sysctl Check Param Int    kernel.msgmax    65536
Sysctl_kernel_msgmnb
    Sysctl Check Param Int    kernel.msgmnb    65536
Sysctl_kernel_msgmni
    Sysctl Check Param Int    kernel.msgmni    32000
Sysctl_kernel_ngroups_max
    Sysctl Check Param Int    kernel.ngroups_max    65536
Sysctl_kernel_nmi_watchdog
    Sysctl Check Param Int    kernel.nmi_watchdog    0
Sysctl_kernel_numa_balancing
    Sysctl Check Param Int    kernel.numa_balancing    0
Sysctl_kernel_numa_balancing_promote_rate_limit_MBps
    Sysctl Check Param Int    kernel.numa_balancing_promote_rate_limit_MBps    65536
Sysctl_kernel_ostype
    Sysctl Check Param Str    kernel.ostype    Linux
Sysctl_kernel_overflowgid
    Sysctl Check Param Int    kernel.overflowgid    65534
Sysctl_kernel_overflowuid
    Sysctl Check Param Int    kernel.overflowuid    65534
Sysctl_kernel_panic
    Sysctl Check Param Int    kernel.panic    90
Sysctl_kernel_panic_on_io_nmi
    Sysctl Check Param Int    kernel.panic_on_io_nmi    0
Sysctl_kernel_panic_on_oops
    Sysctl Check Param Int    kernel.panic_on_oops    0
Sysctl_kernel_panic_on_rcu_stall
    Sysctl Check Param Int    kernel.panic_on_rcu_stall    0
Sysctl_kernel_panic_on_unrecovered_nmi
    Sysctl Check Param Int    kernel.panic_on_unrecovered_nmi    0
Sysctl_kernel_panic_on_warn
    Sysctl Check Param Int    kernel.panic_on_warn    0
Sysctl_kernel_panic_print
    Sysctl Check Param Int    kernel.panic_print    0
Sysctl_kernel_perf_cpu_time_max_percent
    Sysctl Check Param Int    kernel.perf_cpu_time_max_percent    25
Sysctl_kernel_perf_event_max_contexts_per_stack
    Sysctl Check Param Int    kernel.perf_event_max_contexts_per_stack    8
Sysctl_kernel_perf_event_max_sample_rate
    Sysctl Check Param Int    kernel.perf_event_max_sample_rate    100000
Sysctl_kernel_perf_event_max_stack
    Sysctl Check Param Int    kernel.perf_event_max_stack    127
Sysctl_kernel_perf_event_mlock_kb
    Sysctl Check Param Int    kernel.perf_event_mlock_kb    516
Sysctl_kernel_perf_event_paranoid
    Sysctl Check Param Int    kernel.perf_event_paranoid    2
Sysctl_kernel_pid_max
    Sysctl Check Param Int    kernel.pid_max    4194304
Sysctl_kernel_poweroff_cmd
    Sysctl Check Param Str    kernel.poweroff_cmd    /sbin/poweroff
Sysctl_kernel_print-fatal-signals
    Sysctl Check Param Int    kernel.print-fatal-signals    0
Sysctl_kernel_printk
    Sysctl Check Param Int    kernel.printk    7 4 1 7
Sysctl_kernel_printk_delay
    Sysctl Check Param Int    kernel.printk_delay    0
Sysctl_kernel_printk_devkmsg
    Sysctl Check Param Str    kernel.printk_devkmsg    on
Sysctl_kernel_printk_ratelimit
    Sysctl Check Param Int    kernel.printk_ratelimit    5
Sysctl_kernel_printk_ratelimit_burst
    Sysctl Check Param Int    kernel.printk_ratelimit_burst    10
Sysctl_kernel_pty_max
    Sysctl Check Param Int    kernel.pty.max    4096
Sysctl_kernel_pty_nr
    Sysctl Check Param Int    kernel.pty.nr    0
Sysctl_kernel_pty_reserve
    Sysctl Check Param Int    kernel.pty.reserve    1024
Sysctl_kernel_random_urandom_min_reseed_secs
    Sysctl Check Param Int    kernel.random.urandom_min_reseed_secs    60
Sysctl_kernel_random_write_wakeup_threshold
    Sysctl Check Param Int    kernel.random.write_wakeup_threshold    256
Sysctl_kernel_real-root-dev
    Sysctl Check Param Int    kernel.real-root-dev    0
Sysctl_kernel_sched_cfs_bandwidth_slice_us
    Sysctl Check Param Int    kernel.sched_cfs_bandwidth_slice_us    5000
Sysctl_kernel_sched_energy_aware
    [Documentation]    Return an empty string in case EAS is not supported bsc#1219132
    Sysctl Check Param Empty    kernel.sched_energy_aware
Sysctl_kernel_sched_rr_timeslice_ms
    [Documentation]    Brought back from #6
    Sysctl Check Param Int    kernel.sched_rr_timeslice_ms   90:100
Sysctl_kernel_sched_rt_period_us
    Sysctl Check Param Int    kernel.sched_rt_period_us    1000000
Sysctl_kernel_sched_rt_runtime_us
    Sysctl Check Param Int    kernel.sched_rt_runtime_us    950000
Sysctl_kernel_sched_schedstats
    Sysctl Check Param Int    kernel.sched_schedstats    0
Sysctl_kernel_seccomp_actions_avail
    Sysctl Check Param Str    kernel.seccomp.actions_avail    kill_process kill_thread trap errno user_notif trace log allow
Sysctl_kernel_seccomp_actions_logged
    Sysctl Check Param Str    kernel.seccomp.actions_logged    kill_process kill_thread trap errno user_notif trace log
Sysctl_kernel_sem
    Sysctl Check Param Int    kernel.sem    32000 1024000000 500 32000
Sysctl_kernel_sem_next_id
    Sysctl Check Param Int    kernel.sem_next_id    -1
Sysctl_kernel_shm_next_id
    Sysctl Check Param Int    kernel.shm_next_id    -1
Sysctl_kernel_shm_rmid_forced
    Sysctl Check Param Int    kernel.shm_rmid_forced    0
Sysctl_kernel_shmall
    Sysctl Check Param Int    kernel.shmall    1152921504606846720
Sysctl_kernel_shmmax
    Sysctl Check Param Int    kernel.shmmax    18446744073709551615
Sysctl_kernel_shmmni
    Sysctl Check Param Int    kernel.shmmni    4096
Sysctl_kernel_soft_watchdog
    Sysctl Check Param Int    kernel.soft_watchdog    1
Sysctl_kernel_softlockup_all_cpu_backtrace
    Sysctl Check Param Int    kernel.softlockup_all_cpu_backtrace    0
Sysctl_kernel_softlockup_panic
    Sysctl Check Param Int    kernel.softlockup_panic    0
Sysctl_kernel_stack_tracer_enabled
    Sysctl Check Param Int    kernel.stack_tracer_enabled    0
Sysctl_kernel_sysctl_writes_strict
    Sysctl Check Param Int    kernel.sysctl_writes_strict    1
Sysctl_kernel_sysrq
    Sysctl Check Param Int    kernel.sysrq    184
Sysctl_kernel_tainted
    Sysctl Check Param Int    kernel.tainted    0
Sysctl_kernel_timer_migration
    Sysctl Check Param Int    kernel.timer_migration    1
Sysctl_kernel_traceoff_on_warning
    Sysctl Check Param Int    kernel.traceoff_on_warning    0
Sysctl_kernel_tracepoint_printk
    Sysctl Check Param Int    kernel.tracepoint_printk    0
Sysctl_kernel_unknown_nmi_panic
    Sysctl Check Param Int    kernel.unknown_nmi_panic    0
Sysctl_kernel_unprivileged_bpf_disabled
    Sysctl Check Param Int    kernel.unprivileged_bpf_disabled    2
Sysctl_kernel_usermodehelper_bset
    Sysctl Check Param Int    kernel.usermodehelper.bset    4294967295 511
Sysctl_kernel_usermodehelper_inheritable
    Sysctl Check Param Int    kernel.usermodehelper.inheritable    4294967295 511
Sysctl_kernel_watchdog
    Sysctl Check Param Int    kernel.watchdog    1
Sysctl_kernel_watchdog_cpumask
    Sysctl Check Param Str    kernel.watchdog_cpumask    0
Sysctl_kernel_watchdog_thresh
    Sysctl Check Param Int    kernel.watchdog_thresh    10
Sysctl_kernel_yama_ptrace_scope
    Sysctl Check Param Int    kernel.yama.ptrace_scope    1
Sysctl_net_core_bpf_jit_enable
    Sysctl Check Param Int    net.core.bpf_jit_enable    1
Sysctl_net_core_bpf_jit_harden
    Sysctl Check Param Int    net.core.bpf_jit_harden    0
Sysctl_net_core_bpf_jit_kallsyms
    Sysctl Check Param Int    net.core.bpf_jit_kallsyms    1
Sysctl_net_core_bpf_jit_limit
    Sysctl Check Param Int    net.core.bpf_jit_limit    528482304
Sysctl_net_core_busy_poll
    Sysctl Check Param Int    net.core.busy_poll    0
Sysctl_net_core_busy_read
    Sysctl Check Param Int    net.core.busy_read    0
Sysctl_net_core_default_qdisc
    Sysctl Check Param Str    net.core.default_qdisc    pfifo_fast
Sysctl_net_core_dev_weight
    Sysctl Check Param Int    net.core.dev_weight    64
Sysctl_net_core_dev_weight_rx_bias
    Sysctl Check Param Int    net.core.dev_weight_rx_bias    1
Sysctl_net_core_dev_weight_tx_bias
    Sysctl Check Param Int    net.core.dev_weight_tx_bias    1
Sysctl_net_core_devconf_inherit_init_net
    Sysctl Check Param Int    net.core.devconf_inherit_init_net    0
Sysctl_net_core_fb_tunnels_only_for_init_net
    Sysctl Check Param Int    net.core.fb_tunnels_only_for_init_net    0
Sysctl_net_core_flow_limit_cpu_bitmap
    Sysctl Check Param Str    net.core.flow_limit_cpu_bitmap    0
Sysctl_net_core_flow_limit_table_len
    Sysctl Check Param Int    net.core.flow_limit_table_len    4096
Sysctl_net_core_gro_normal_batch
    Sysctl Check Param Int    net.core.gro_normal_batch    8
Sysctl_net_core_high_order_alloc_disable
    Sysctl Check Param Int    net.core.high_order_alloc_disable    0
Sysctl_net_core_max_skb_frags
    Sysctl Check Param Int    net.core.max_skb_frags    17
Sysctl_net_core_message_burst
    Sysctl Check Param Int    net.core.message_burst    10
Sysctl_net_core_message_cost
    Sysctl Check Param Int    net.core.message_cost    5
Sysctl_net_core_netdev_budget
    Sysctl Check Param Int    net.core.netdev_budget    300
Sysctl_net_core_netdev_budget_usecs
    Sysctl Check Param Int    net.core.netdev_budget_usecs    2000
Sysctl_net_core_netdev_max_backlog
    Sysctl Check Param Int    net.core.netdev_max_backlog    1000
Sysctl_net_core_netdev_rss_key
    Sysctl Check Param Str    net.core.netdev_rss_key    00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00
Sysctl_net_core_netdev_tstamp_prequeue
    Sysctl Check Param Int    net.core.netdev_tstamp_prequeue    1
Sysctl_net_core_netdev_unregister_timeout_secs
    Sysctl Check Param Int    net.core.netdev_unregister_timeout_secs    10
Sysctl_net_core_optmem_max
    Sysctl Check Param Int    net.core.optmem_max    131072
Sysctl_net_core_rmem_default
    Sysctl Check Param Int    net.core.rmem_default    212992
Sysctl_net_core_rmem_max
    Sysctl Check Param Int    net.core.rmem_max    212992
Sysctl_net_core_rps_sock_flow_entries
    Sysctl Check Param Int    net.core.rps_sock_flow_entries    0
Sysctl_net_core_skb_defer_max
    Sysctl Check Param Int    net.core.skb_defer_max    64
Sysctl_net_core_somaxconn
    Sysctl Check Param Int    net.core.somaxconn    4096
Sysctl_net_core_tstamp_allow_data
    Sysctl Check Param Int    net.core.tstamp_allow_data    1
Sysctl_net_core_txrehash
    Sysctl Check Param Int    net.core.txrehash    1
Sysctl_net_core_warnings
    Sysctl Check Param Int    net.core.warnings    0
Sysctl_net_core_wmem_default
    Sysctl Check Param Int    net.core.wmem_default    212992
Sysctl_net_core_wmem_max
    Sysctl Check Param Int    net.core.wmem_max    212992
Sysctl_net_core_xfrm_acq_expires
    Sysctl Check Param Int    net.core.xfrm_acq_expires    30
Sysctl_net_core_xfrm_aevent_etime
    Sysctl Check Param Int    net.core.xfrm_aevent_etime    10
Sysctl_net_core_xfrm_aevent_rseqth
    Sysctl Check Param Int    net.core.xfrm_aevent_rseqth    2
Sysctl_net_core_xfrm_larval_drop
    Sysctl Check Param Int    net.core.xfrm_larval_drop    1
Sysctl_net_ipv4_cipso_cache_bucket_size
    Sysctl Check Param Int    net.ipv4.cipso_cache_bucket_size    10
Sysctl_net_ipv4_cipso_cache_enable
    Sysctl Check Param Int    net.ipv4.cipso_cache_enable    1
Sysctl_net_ipv4_cipso_rbm_optfmt
    Sysctl Check Param Int    net.ipv4.cipso_rbm_optfmt    0
Sysctl_net_ipv4_cipso_rbm_strictvalid
    Sysctl Check Param Int    net.ipv4.cipso_rbm_strictvalid    1
Sysctl_net_ipv4_conf_all_accept_local
    Sysctl Check Param Int    net.ipv4.conf.all.accept_local    0
Sysctl_net_ipv4_conf_all_accept_redirects
    Sysctl Check Param Int    net.ipv4.conf.all.accept_redirects    0
Sysctl_net_ipv4_conf_all_accept_source_route
    Sysctl Check Param Int    net.ipv4.conf.all.accept_source_route    0
Sysctl_net_ipv4_conf_all_arp_accept
    Sysctl Check Param Int    net.ipv4.conf.all.arp_accept    0
Sysctl_net_ipv4_conf_all_arp_announce
    Sysctl Check Param Int    net.ipv4.conf.all.arp_announce    0
Sysctl_net_ipv4_conf_all_arp_evict_nocarrier
    Sysctl Check Param Int    net.ipv4.conf.all.arp_evict_nocarrier    1
Sysctl_net_ipv4_conf_all_arp_filter
    Sysctl Check Param Int    net.ipv4.conf.all.arp_filter    0
Sysctl_net_ipv4_conf_all_arp_ignore
    Sysctl Check Param Int    net.ipv4.conf.all.arp_ignore    0
Sysctl_net_ipv4_conf_all_arp_notify
    Sysctl Check Param Int    net.ipv4.conf.all.arp_notify    0
Sysctl_net_ipv4_conf_all_bc_forwarding
    Sysctl Check Param Int    net.ipv4.conf.all.bc_forwarding    0
Sysctl_net_ipv4_conf_all_bootp_relay
    Sysctl Check Param Int    net.ipv4.conf.all.bootp_relay    0
Sysctl_net_ipv4_conf_all_disable_policy
    Sysctl Check Param Int    net.ipv4.conf.all.disable_policy    0
Sysctl_net_ipv4_conf_all_disable_xfrm
    Sysctl Check Param Int    net.ipv4.conf.all.disable_xfrm    0
Sysctl_net_ipv4_conf_all_drop_gratuitous_arp
    Sysctl Check Param Int    net.ipv4.conf.all.drop_gratuitous_arp    0
Sysctl_net_ipv4_conf_all_drop_unicast_in_l2_multicast
    Sysctl Check Param Int    net.ipv4.conf.all.drop_unicast_in_l2_multicast    0
Sysctl_net_ipv4_conf_all_force_igmp_version
    Sysctl Check Param Int    net.ipv4.conf.all.force_igmp_version    0
Sysctl_net_ipv4_conf_all_forwarding
    Sysctl Check Param Int    net.ipv4.conf.all.forwarding    0
Sysctl_net_ipv4_conf_all_igmpv2_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv4.conf.all.igmpv2_unsolicited_report_interval    10000
Sysctl_net_ipv4_conf_all_igmpv3_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv4.conf.all.igmpv3_unsolicited_report_interval    1000
Sysctl_net_ipv4_conf_all_ignore_routes_with_linkdown
    Sysctl Check Param Int    net.ipv4.conf.all.ignore_routes_with_linkdown    0
Sysctl_net_ipv4_conf_all_log_martians
    Sysctl Check Param Int    net.ipv4.conf.all.log_martians    0
Sysctl_net_ipv4_conf_all_mc_forwarding
    Sysctl Check Param Int    net.ipv4.conf.all.mc_forwarding    0
Sysctl_net_ipv4_conf_all_medium_id
    Sysctl Check Param Int    net.ipv4.conf.all.medium_id    0
Sysctl_net_ipv4_conf_all_promote_secondaries
    Sysctl Check Param Int    net.ipv4.conf.all.promote_secondaries    0
Sysctl_net_ipv4_conf_all_proxy_arp
    Sysctl Check Param Int    net.ipv4.conf.all.proxy_arp    0
Sysctl_net_ipv4_conf_all_proxy_arp_pvlan
    Sysctl Check Param Int    net.ipv4.conf.all.proxy_arp_pvlan    0
Sysctl_net_ipv4_conf_all_route_localnet
    Sysctl Check Param Int    net.ipv4.conf.all.route_localnet    0
Sysctl_net_ipv4_conf_all_rp_filter
    Sysctl Check Param Int    net.ipv4.conf.all.rp_filter    0
Sysctl_net_ipv4_conf_all_secure_redirects
    Sysctl Check Param Int    net.ipv4.conf.all.secure_redirects    1
Sysctl_net_ipv4_conf_all_send_redirects
    Sysctl Check Param Int    net.ipv4.conf.all.send_redirects    1
Sysctl_net_ipv4_conf_all_shared_media
    Sysctl Check Param Int    net.ipv4.conf.all.shared_media    1
Sysctl_net_ipv4_conf_all_src_valid_mark
    Sysctl Check Param Int    net.ipv4.conf.all.src_valid_mark    0
Sysctl_net_ipv4_conf_all_tag
    Sysctl Check Param Int    net.ipv4.conf.all.tag    0
Sysctl_net_ipv4_conf_default_accept_local
    Sysctl Check Param Int    net.ipv4.conf.default.accept_local    0
Sysctl_net_ipv4_conf_default_accept_redirects
    Sysctl Check Param Int    net.ipv4.conf.default.accept_redirects    0
Sysctl_net_ipv4_conf_default_accept_source_route
    Sysctl Check Param Int    net.ipv4.conf.default.accept_source_route    0
Sysctl_net_ipv4_conf_default_arp_accept
    Sysctl Check Param Int    net.ipv4.conf.default.arp_accept    0
Sysctl_net_ipv4_conf_default_arp_announce
    Sysctl Check Param Int    net.ipv4.conf.default.arp_announce    0
Sysctl_net_ipv4_conf_default_arp_evict_nocarrier
    Sysctl Check Param Int    net.ipv4.conf.default.arp_evict_nocarrier    1
Sysctl_net_ipv4_conf_default_arp_filter
    Sysctl Check Param Int    net.ipv4.conf.default.arp_filter    0
Sysctl_net_ipv4_conf_default_arp_ignore
    Sysctl Check Param Int    net.ipv4.conf.default.arp_ignore    0
Sysctl_net_ipv4_conf_default_arp_notify
    Sysctl Check Param Int    net.ipv4.conf.default.arp_notify    0
Sysctl_net_ipv4_conf_default_bc_forwarding
    Sysctl Check Param Int    net.ipv4.conf.default.bc_forwarding    0
Sysctl_net_ipv4_conf_default_bootp_relay
    Sysctl Check Param Int    net.ipv4.conf.default.bootp_relay    0
Sysctl_net_ipv4_conf_default_disable_policy
    Sysctl Check Param Int    net.ipv4.conf.default.disable_policy    0
Sysctl_net_ipv4_conf_default_disable_xfrm
    Sysctl Check Param Int    net.ipv4.conf.default.disable_xfrm    0
Sysctl_net_ipv4_conf_default_drop_gratuitous_arp
    Sysctl Check Param Int    net.ipv4.conf.default.drop_gratuitous_arp    0
Sysctl_net_ipv4_conf_default_drop_unicast_in_l2_multicast
    Sysctl Check Param Int    net.ipv4.conf.default.drop_unicast_in_l2_multicast    0
Sysctl_net_ipv4_conf_default_force_igmp_version
    Sysctl Check Param Int    net.ipv4.conf.default.force_igmp_version    0
Sysctl_net_ipv4_conf_default_forwarding
    Sysctl Check Param Int    net.ipv4.conf.default.forwarding    0
Sysctl_net_ipv4_conf_default_igmpv2_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv4.conf.default.igmpv2_unsolicited_report_interval    10000
Sysctl_net_ipv4_conf_default_igmpv3_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv4.conf.default.igmpv3_unsolicited_report_interval    1000
Sysctl_net_ipv4_conf_default_ignore_routes_with_linkdown
    Sysctl Check Param Int    net.ipv4.conf.default.ignore_routes_with_linkdown    0
Sysctl_net_ipv4_conf_default_log_martians
    Sysctl Check Param Int    net.ipv4.conf.default.log_martians    0
Sysctl_net_ipv4_conf_default_mc_forwarding
    Sysctl Check Param Int    net.ipv4.conf.default.mc_forwarding    0
Sysctl_net_ipv4_conf_default_medium_id
    Sysctl Check Param Int    net.ipv4.conf.default.medium_id    0
Sysctl_net_ipv4_conf_default_promote_secondaries
    Sysctl Check Param Int    net.ipv4.conf.default.promote_secondaries    1
Sysctl_net_ipv4_conf_default_proxy_arp
    Sysctl Check Param Int    net.ipv4.conf.default.proxy_arp    0
Sysctl_net_ipv4_conf_default_proxy_arp_pvlan
    Sysctl Check Param Int    net.ipv4.conf.default.proxy_arp_pvlan    0
Sysctl_net_ipv4_conf_default_route_localnet
    Sysctl Check Param Int    net.ipv4.conf.default.route_localnet    0
Sysctl_net_ipv4_conf_default_rp_filter
    Sysctl Check Param Int    net.ipv4.conf.default.rp_filter    2
Sysctl_net_ipv4_conf_default_secure_redirects
    Sysctl Check Param Int    net.ipv4.conf.default.secure_redirects    1
Sysctl_net_ipv4_conf_default_send_redirects
    Sysctl Check Param Int    net.ipv4.conf.default.send_redirects    1
Sysctl_net_ipv4_conf_default_shared_media
    Sysctl Check Param Int    net.ipv4.conf.default.shared_media    1
Sysctl_net_ipv4_conf_default_src_valid_mark
    Sysctl Check Param Int    net.ipv4.conf.default.src_valid_mark    0
Sysctl_net_ipv4_conf_default_tag
    Sysctl Check Param Int    net.ipv4.conf.default.tag    0
Sysctl_net_ipv4_conf_ens4_accept_local
    Sysctl Check Param Int    net.ipv4.conf.ens4.accept_local    0
Sysctl_net_ipv4_conf_ens4_accept_redirects
    Sysctl Check Param Int    net.ipv4.conf.ens4.accept_redirects    0
Sysctl_net_ipv4_conf_ens4_accept_source_route
    Sysctl Check Param Int    net.ipv4.conf.ens4.accept_source_route    0
Sysctl_net_ipv4_conf_ens4_arp_accept
    Sysctl Check Param Int    net.ipv4.conf.ens4.arp_accept    0
Sysctl_net_ipv4_conf_ens4_arp_announce
    Sysctl Check Param Int    net.ipv4.conf.ens4.arp_announce    0
Sysctl_net_ipv4_conf_ens4_arp_evict_nocarrier
    Sysctl Check Param Int    net.ipv4.conf.ens4.arp_evict_nocarrier    1
Sysctl_net_ipv4_conf_ens4_arp_filter
    Sysctl Check Param Int    net.ipv4.conf.ens4.arp_filter    0
Sysctl_net_ipv4_conf_ens4_arp_ignore
    Sysctl Check Param Int    net.ipv4.conf.ens4.arp_ignore    0
Sysctl_net_ipv4_conf_ens4_arp_notify
    Sysctl Check Param Int    net.ipv4.conf.ens4.arp_notify    0
Sysctl_net_ipv4_conf_ens4_bc_forwarding
    Sysctl Check Param Int    net.ipv4.conf.ens4.bc_forwarding    0
Sysctl_net_ipv4_conf_ens4_bootp_relay
    Sysctl Check Param Int    net.ipv4.conf.ens4.bootp_relay    0
Sysctl_net_ipv4_conf_ens4_disable_policy
    Sysctl Check Param Int    net.ipv4.conf.ens4.disable_policy    0
Sysctl_net_ipv4_conf_ens4_disable_xfrm
    Sysctl Check Param Int    net.ipv4.conf.ens4.disable_xfrm    0
Sysctl_net_ipv4_conf_ens4_drop_gratuitous_arp
    Sysctl Check Param Int    net.ipv4.conf.ens4.drop_gratuitous_arp    0
Sysctl_net_ipv4_conf_ens4_drop_unicast_in_l2_multicast
    Sysctl Check Param Int    net.ipv4.conf.ens4.drop_unicast_in_l2_multicast    0
Sysctl_net_ipv4_conf_ens4_force_igmp_version
    Sysctl Check Param Int    net.ipv4.conf.ens4.force_igmp_version    0
Sysctl_net_ipv4_conf_ens4_forwarding
    Sysctl Check Param Int    net.ipv4.conf.ens4.forwarding    0
Sysctl_net_ipv4_conf_ens4_igmpv2_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv4.conf.ens4.igmpv2_unsolicited_report_interval    10000
Sysctl_net_ipv4_conf_ens4_igmpv3_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv4.conf.ens4.igmpv3_unsolicited_report_interval    1000
Sysctl_net_ipv4_conf_ens4_ignore_routes_with_linkdown
    Sysctl Check Param Int    net.ipv4.conf.ens4.ignore_routes_with_linkdown    0
Sysctl_net_ipv4_conf_ens4_log_martians
    Sysctl Check Param Int    net.ipv4.conf.ens4.log_martians    0
Sysctl_net_ipv4_conf_ens4_mc_forwarding
    Sysctl Check Param Int    net.ipv4.conf.ens4.mc_forwarding    0
Sysctl_net_ipv4_conf_ens4_medium_id
    Sysctl Check Param Int    net.ipv4.conf.ens4.medium_id    0
Sysctl_net_ipv4_conf_ens4_promote_secondaries
    Sysctl Check Param Int    net.ipv4.conf.ens4.promote_secondaries    1
Sysctl_net_ipv4_conf_ens4_proxy_arp
    Sysctl Check Param Int    net.ipv4.conf.ens4.proxy_arp    0
Sysctl_net_ipv4_conf_ens4_proxy_arp_pvlan
    Sysctl Check Param Int    net.ipv4.conf.ens4.proxy_arp_pvlan    0
Sysctl_net_ipv4_conf_ens4_route_localnet
    Sysctl Check Param Int    net.ipv4.conf.ens4.route_localnet    0
Sysctl_net_ipv4_conf_ens4_rp_filter
    Sysctl Check Param Int    net.ipv4.conf.ens4.rp_filter    2
Sysctl_net_ipv4_conf_ens4_secure_redirects
    Sysctl Check Param Int    net.ipv4.conf.ens4.secure_redirects    1
Sysctl_net_ipv4_conf_ens4_send_redirects
    Sysctl Check Param Int    net.ipv4.conf.ens4.send_redirects    1
Sysctl_net_ipv4_conf_ens4_shared_media
    Sysctl Check Param Int    net.ipv4.conf.ens4.shared_media    1
Sysctl_net_ipv4_conf_ens4_src_valid_mark
    Sysctl Check Param Int    net.ipv4.conf.ens4.src_valid_mark    0
Sysctl_net_ipv4_conf_ens4_tag
    Sysctl Check Param Int    net.ipv4.conf.ens4.tag    0
Sysctl_net_ipv4_conf_lo_accept_local
    Sysctl Check Param Int    net.ipv4.conf.lo.accept_local    0
Sysctl_net_ipv4_conf_lo_accept_redirects
    Sysctl Check Param Int    net.ipv4.conf.lo.accept_redirects    1
Sysctl_net_ipv4_conf_lo_accept_source_route
    Sysctl Check Param Int    net.ipv4.conf.lo.accept_source_route    1
Sysctl_net_ipv4_conf_lo_arp_accept
    Sysctl Check Param Int    net.ipv4.conf.lo.arp_accept    0
Sysctl_net_ipv4_conf_lo_arp_announce
    Sysctl Check Param Int    net.ipv4.conf.lo.arp_announce    0
Sysctl_net_ipv4_conf_lo_arp_evict_nocarrier
    Sysctl Check Param Int    net.ipv4.conf.lo.arp_evict_nocarrier    1
Sysctl_net_ipv4_conf_lo_arp_filter
    Sysctl Check Param Int    net.ipv4.conf.lo.arp_filter    0
Sysctl_net_ipv4_conf_lo_arp_ignore
    Sysctl Check Param Int    net.ipv4.conf.lo.arp_ignore    0
Sysctl_net_ipv4_conf_lo_arp_notify
    Sysctl Check Param Int    net.ipv4.conf.lo.arp_notify    0
Sysctl_net_ipv4_conf_lo_bc_forwarding
    Sysctl Check Param Int    net.ipv4.conf.lo.bc_forwarding    0
Sysctl_net_ipv4_conf_lo_bootp_relay
    Sysctl Check Param Int    net.ipv4.conf.lo.bootp_relay    0
Sysctl_net_ipv4_conf_lo_disable_policy
    Sysctl Check Param Int    net.ipv4.conf.lo.disable_policy    1
Sysctl_net_ipv4_conf_lo_disable_xfrm
    Sysctl Check Param Int    net.ipv4.conf.lo.disable_xfrm    1
Sysctl_net_ipv4_conf_lo_drop_gratuitous_arp
    Sysctl Check Param Int    net.ipv4.conf.lo.drop_gratuitous_arp    0
Sysctl_net_ipv4_conf_lo_drop_unicast_in_l2_multicast
    Sysctl Check Param Int    net.ipv4.conf.lo.drop_unicast_in_l2_multicast    0
Sysctl_net_ipv4_conf_lo_force_igmp_version
    Sysctl Check Param Int    net.ipv4.conf.lo.force_igmp_version    0
Sysctl_net_ipv4_conf_lo_forwarding
    Sysctl Check Param Int    net.ipv4.conf.lo.forwarding    0
Sysctl_net_ipv4_conf_lo_igmpv2_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv4.conf.lo.igmpv2_unsolicited_report_interval    10000
Sysctl_net_ipv4_conf_lo_igmpv3_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv4.conf.lo.igmpv3_unsolicited_report_interval    1000
Sysctl_net_ipv4_conf_lo_ignore_routes_with_linkdown
    Sysctl Check Param Int    net.ipv4.conf.lo.ignore_routes_with_linkdown    0
Sysctl_net_ipv4_conf_lo_log_martians
    Sysctl Check Param Int    net.ipv4.conf.lo.log_martians    0
Sysctl_net_ipv4_conf_lo_mc_forwarding
    Sysctl Check Param Int    net.ipv4.conf.lo.mc_forwarding    0
Sysctl_net_ipv4_conf_lo_medium_id
    Sysctl Check Param Int    net.ipv4.conf.lo.medium_id    0
Sysctl_net_ipv4_conf_lo_promote_secondaries
    Sysctl Check Param Int    net.ipv4.conf.lo.promote_secondaries    1
Sysctl_net_ipv4_conf_lo_proxy_arp
    Sysctl Check Param Int    net.ipv4.conf.lo.proxy_arp    0
Sysctl_net_ipv4_conf_lo_proxy_arp_pvlan
    Sysctl Check Param Int    net.ipv4.conf.lo.proxy_arp_pvlan    0
Sysctl_net_ipv4_conf_lo_route_localnet
    Sysctl Check Param Int    net.ipv4.conf.lo.route_localnet    0
Sysctl_net_ipv4_conf_lo_rp_filter
    Sysctl Check Param Int    net.ipv4.conf.lo.rp_filter    2
Sysctl_net_ipv4_conf_lo_secure_redirects
    Sysctl Check Param Int    net.ipv4.conf.lo.secure_redirects    1
Sysctl_net_ipv4_conf_lo_send_redirects
    Sysctl Check Param Int    net.ipv4.conf.lo.send_redirects    1
Sysctl_net_ipv4_conf_lo_shared_media
    Sysctl Check Param Int    net.ipv4.conf.lo.shared_media    1
Sysctl_net_ipv4_conf_lo_src_valid_mark
    Sysctl Check Param Int    net.ipv4.conf.lo.src_valid_mark    0
Sysctl_net_ipv4_conf_lo_tag
    Sysctl Check Param Int    net.ipv4.conf.lo.tag    0
Sysctl_net_ipv4_fib_multipath_hash_fields
    Sysctl Check Param Int    net.ipv4.fib_multipath_hash_fields    7
Sysctl_net_ipv4_fib_multipath_hash_policy
    Sysctl Check Param Int    net.ipv4.fib_multipath_hash_policy    0
Sysctl_net_ipv4_fib_multipath_use_neigh
    Sysctl Check Param Int    net.ipv4.fib_multipath_use_neigh    0
Sysctl_net_ipv4_fib_notify_on_flag_change
    Sysctl Check Param Int    net.ipv4.fib_notify_on_flag_change    0
Sysctl_net_ipv4_fib_sync_mem
    Sysctl Check Param Int    net.ipv4.fib_sync_mem    524288
Sysctl_net_ipv4_fwmark_reflect
    Sysctl Check Param Int    net.ipv4.fwmark_reflect    0
Sysctl_net_ipv4_icmp_echo_enable_probe
    Sysctl Check Param Int    net.ipv4.icmp_echo_enable_probe    0
Sysctl_net_ipv4_icmp_echo_ignore_all
    Sysctl Check Param Int    net.ipv4.icmp_echo_ignore_all    0
Sysctl_net_ipv4_icmp_echo_ignore_broadcasts
    Sysctl Check Param Int    net.ipv4.icmp_echo_ignore_broadcasts    1
Sysctl_net_ipv4_icmp_errors_use_inbound_ifaddr
    Sysctl Check Param Int    net.ipv4.icmp_errors_use_inbound_ifaddr    0
Sysctl_net_ipv4_icmp_ignore_bogus_error_responses
    Sysctl Check Param Int    net.ipv4.icmp_ignore_bogus_error_responses    1
Sysctl_net_ipv4_icmp_msgs_burst
    Sysctl Check Param Int    net.ipv4.icmp_msgs_burst    50
Sysctl_net_ipv4_icmp_msgs_per_sec
    Sysctl Check Param Int    net.ipv4.icmp_msgs_per_sec    1000
Sysctl_net_ipv4_icmp_ratelimit
    Sysctl Check Param Int    net.ipv4.icmp_ratelimit    1000
Sysctl_net_ipv4_icmp_ratemask
    Sysctl Check Param Int    net.ipv4.icmp_ratemask    6168
Sysctl_net_ipv4_igmp_link_local_mcast_reports
    Sysctl Check Param Int    net.ipv4.igmp_link_local_mcast_reports    1
Sysctl_net_ipv4_igmp_max_memberships
    Sysctl Check Param Int    net.ipv4.igmp_max_memberships    20
Sysctl_net_ipv4_igmp_max_msf
    Sysctl Check Param Int    net.ipv4.igmp_max_msf    10
Sysctl_net_ipv4_igmp_qrv
    Sysctl Check Param Int    net.ipv4.igmp_qrv    2
Sysctl_net_ipv4_inet_peer_maxttl
    Sysctl Check Param Int    net.ipv4.inet_peer_maxttl    600
Sysctl_net_ipv4_inet_peer_minttl
    Sysctl Check Param Int    net.ipv4.inet_peer_minttl    120
Sysctl_net_ipv4_inet_peer_threshold
    Sysctl Check Param Int    net.ipv4.inet_peer_threshold    65664
Sysctl_net_ipv4_ip_autobind_reuse
    Sysctl Check Param Int    net.ipv4.ip_autobind_reuse    0
Sysctl_net_ipv4_ip_default_ttl
    Sysctl Check Param Int    net.ipv4.ip_default_ttl    64
Sysctl_net_ipv4_ip_dynaddr
    Sysctl Check Param Int    net.ipv4.ip_dynaddr    0
Sysctl_net_ipv4_ip_early_demux
    Sysctl Check Param Int    net.ipv4.ip_early_demux    1
Sysctl_net_ipv4_ip_forward
    Sysctl Check Param Int    net.ipv4.ip_forward    0
Sysctl_net_ipv4_ip_forward_update_priority
    Sysctl Check Param Int    net.ipv4.ip_forward_update_priority    1
Sysctl_net_ipv4_ip_forward_use_pmtu
    Sysctl Check Param Int    net.ipv4.ip_forward_use_pmtu    0
Sysctl_net_ipv4_ip_local_port_range
    Sysctl Check Param Int    net.ipv4.ip_local_port_range    32768 60999
Sysctl_net_ipv4_ip_local_reserved_ports
    Sysctl Check Param Empty    net.ipv4.ip_local_reserved_ports
Sysctl_net_ipv4_ip_no_pmtu_disc
    Sysctl Check Param Int    net.ipv4.ip_no_pmtu_disc    0
Sysctl_net_ipv4_ip_nonlocal_bind
    Sysctl Check Param Int    net.ipv4.ip_nonlocal_bind    0
Sysctl_net_ipv4_ip_unprivileged_port_start
    Sysctl Check Param Int    net.ipv4.ip_unprivileged_port_start    1024
Sysctl_net_ipv4_ipfrag_high_thresh
    Sysctl Check Param Int    net.ipv4.ipfrag_high_thresh    4194304
Sysctl_net_ipv4_ipfrag_low_thresh
    Sysctl Check Param Int    net.ipv4.ipfrag_low_thresh    3145728
Sysctl_net_ipv4_ipfrag_max_dist
    Sysctl Check Param Int    net.ipv4.ipfrag_max_dist    64
Sysctl_net_ipv4_ipfrag_secret_interval
    Sysctl Check Param Int    net.ipv4.ipfrag_secret_interval    0
Sysctl_net_ipv4_ipfrag_time
    Sysctl Check Param Int    net.ipv4.ipfrag_time    30
Sysctl_net_ipv4_neigh_default_anycast_delay
    Sysctl Check Param Int    net.ipv4.neigh.default.anycast_delay    100
Sysctl_net_ipv4_neigh_default_app_solicit
    Sysctl Check Param Int    net.ipv4.neigh.default.app_solicit    0
Sysctl_net_ipv4_neigh_default_base_reachable_time_ms
    Sysctl Check Param Int    net.ipv4.neigh.default.base_reachable_time_ms    30000
Sysctl_net_ipv4_neigh_default_delay_first_probe_time
    Sysctl Check Param Int    net.ipv4.neigh.default.delay_first_probe_time    5
Sysctl_net_ipv4_neigh_default_gc_interval
    Sysctl Check Param Int    net.ipv4.neigh.default.gc_interval    30
Sysctl_net_ipv4_neigh_default_gc_stale_time
    Sysctl Check Param Int    net.ipv4.neigh.default.gc_stale_time    60
Sysctl_net_ipv4_neigh_default_gc_thresh1
    Sysctl Check Param Int    net.ipv4.neigh.default.gc_thresh1    128
Sysctl_net_ipv4_neigh_default_gc_thresh2
    Sysctl Check Param Int    net.ipv4.neigh.default.gc_thresh2    512
Sysctl_net_ipv4_neigh_default_gc_thresh3
    Sysctl Check Param Int    net.ipv4.neigh.default.gc_thresh3    1024
Sysctl_net_ipv4_neigh_default_interval_probe_time_ms
    Sysctl Check Param Int    net.ipv4.neigh.default.interval_probe_time_ms    5000
Sysctl_net_ipv4_neigh_default_locktime
    Sysctl Check Param Int    net.ipv4.neigh.default.locktime    100
Sysctl_net_ipv4_neigh_default_mcast_resolicit
    Sysctl Check Param Int    net.ipv4.neigh.default.mcast_resolicit    0
Sysctl_net_ipv4_neigh_default_mcast_solicit
    Sysctl Check Param Int    net.ipv4.neigh.default.mcast_solicit    3
Sysctl_net_ipv4_neigh_default_proxy_delay
    Sysctl Check Param Int    net.ipv4.neigh.default.proxy_delay    80
Sysctl_net_ipv4_neigh_default_proxy_qlen
    Sysctl Check Param Int    net.ipv4.neigh.default.proxy_qlen    64
Sysctl_net_ipv4_neigh_default_retrans_time_ms
    Sysctl Check Param Int    net.ipv4.neigh.default.retrans_time_ms    1000
Sysctl_net_ipv4_neigh_default_ucast_solicit
    Sysctl Check Param Int    net.ipv4.neigh.default.ucast_solicit    3
Sysctl_net_ipv4_neigh_default_unres_qlen
    Sysctl Check Param Int    net.ipv4.neigh.default.unres_qlen    101
Sysctl_net_ipv4_neigh_default_unres_qlen_bytes
    Sysctl Check Param Int    net.ipv4.neigh.default.unres_qlen_bytes    212992
Sysctl_net_ipv4_neigh_ens4_anycast_delay
    Sysctl Check Param Int    net.ipv4.neigh.ens4.anycast_delay    100
Sysctl_net_ipv4_neigh_ens4_app_solicit
    Sysctl Check Param Int    net.ipv4.neigh.ens4.app_solicit    0
Sysctl_net_ipv4_neigh_ens4_base_reachable_time_ms
    Sysctl Check Param Int    net.ipv4.neigh.ens4.base_reachable_time_ms    30000
Sysctl_net_ipv4_neigh_ens4_delay_first_probe_time
    Sysctl Check Param Int    net.ipv4.neigh.ens4.delay_first_probe_time    5
Sysctl_net_ipv4_neigh_ens4_gc_stale_time
    Sysctl Check Param Int    net.ipv4.neigh.ens4.gc_stale_time    60
Sysctl_net_ipv4_neigh_ens4_interval_probe_time_ms
    Sysctl Check Param Int    net.ipv4.neigh.ens4.interval_probe_time_ms    5000
Sysctl_net_ipv4_neigh_ens4_locktime
    Sysctl Check Param Int    net.ipv4.neigh.ens4.locktime    100
Sysctl_net_ipv4_neigh_ens4_mcast_resolicit
    Sysctl Check Param Int    net.ipv4.neigh.ens4.mcast_resolicit    0
Sysctl_net_ipv4_neigh_ens4_mcast_solicit
    Sysctl Check Param Int    net.ipv4.neigh.ens4.mcast_solicit    3
Sysctl_net_ipv4_neigh_ens4_proxy_delay
    Sysctl Check Param Int    net.ipv4.neigh.ens4.proxy_delay    80
Sysctl_net_ipv4_neigh_ens4_proxy_qlen
    Sysctl Check Param Int    net.ipv4.neigh.ens4.proxy_qlen    64
Sysctl_net_ipv4_neigh_ens4_retrans_time_ms
    Sysctl Check Param Int    net.ipv4.neigh.ens4.retrans_time_ms    1000
Sysctl_net_ipv4_neigh_ens4_ucast_solicit
    Sysctl Check Param Int    net.ipv4.neigh.ens4.ucast_solicit    3
Sysctl_net_ipv4_neigh_ens4_unres_qlen
    Sysctl Check Param Int    net.ipv4.neigh.ens4.unres_qlen    101
Sysctl_net_ipv4_neigh_ens4_unres_qlen_bytes
    Sysctl Check Param Int    net.ipv4.neigh.ens4.unres_qlen_bytes    212992
Sysctl_net_ipv4_neigh_lo_anycast_delay
    Sysctl Check Param Int    net.ipv4.neigh.lo.anycast_delay    100
Sysctl_net_ipv4_neigh_lo_app_solicit
    Sysctl Check Param Int    net.ipv4.neigh.lo.app_solicit    0
Sysctl_net_ipv4_neigh_lo_base_reachable_time_ms
    Sysctl Check Param Int    net.ipv4.neigh.lo.base_reachable_time_ms    30000
Sysctl_net_ipv4_neigh_lo_delay_first_probe_time
    Sysctl Check Param Int    net.ipv4.neigh.lo.delay_first_probe_time    5
Sysctl_net_ipv4_neigh_lo_gc_stale_time
    Sysctl Check Param Int    net.ipv4.neigh.lo.gc_stale_time    60
Sysctl_net_ipv4_neigh_lo_interval_probe_time_ms
    Sysctl Check Param Int    net.ipv4.neigh.lo.interval_probe_time_ms    5000
Sysctl_net_ipv4_neigh_lo_locktime
    Sysctl Check Param Int    net.ipv4.neigh.lo.locktime    100
Sysctl_net_ipv4_neigh_lo_mcast_resolicit
    Sysctl Check Param Int    net.ipv4.neigh.lo.mcast_resolicit    0
Sysctl_net_ipv4_neigh_lo_mcast_solicit
    Sysctl Check Param Int    net.ipv4.neigh.lo.mcast_solicit    3
Sysctl_net_ipv4_neigh_lo_proxy_delay
    Sysctl Check Param Int    net.ipv4.neigh.lo.proxy_delay    80
Sysctl_net_ipv4_neigh_lo_proxy_qlen
    Sysctl Check Param Int    net.ipv4.neigh.lo.proxy_qlen    64
Sysctl_net_ipv4_neigh_lo_retrans_time_ms
    Sysctl Check Param Int    net.ipv4.neigh.lo.retrans_time_ms    1000
Sysctl_net_ipv4_neigh_lo_ucast_solicit
    Sysctl Check Param Int    net.ipv4.neigh.lo.ucast_solicit    3
Sysctl_net_ipv4_neigh_lo_unres_qlen
    Sysctl Check Param Int    net.ipv4.neigh.lo.unres_qlen    101
Sysctl_net_ipv4_neigh_lo_unres_qlen_bytes
    Sysctl Check Param Int    net.ipv4.neigh.lo.unres_qlen_bytes    212992
Sysctl_net_ipv4_nexthop_compat_mode
    Sysctl Check Param Int    net.ipv4.nexthop_compat_mode    1
Sysctl_net_ipv4_ping_group_range
    Sysctl Check Param Int    net.ipv4.ping_group_range    0 2147483647
Sysctl_net_ipv4_raw_l3mdev_accept
    Sysctl Check Param Int    net.ipv4.raw_l3mdev_accept    1
Sysctl_net_ipv4_route_error_burst
    Sysctl Check Param Int    net.ipv4.route.error_burst    5000
Sysctl_net_ipv4_route_error_cost
    Sysctl Check Param Int    net.ipv4.route.error_cost    1000
Sysctl_net_ipv4_route_gc_elasticity
    Sysctl Check Param Int    net.ipv4.route.gc_elasticity    8
Sysctl_net_ipv4_route_gc_interval
    Sysctl Check Param Int    net.ipv4.route.gc_interval    60
Sysctl_net_ipv4_route_gc_min_interval
    Sysctl Check Param Int    net.ipv4.route.gc_min_interval    0
Sysctl_net_ipv4_route_gc_min_interval_ms
    Sysctl Check Param Int    net.ipv4.route.gc_min_interval_ms    500
Sysctl_net_ipv4_route_gc_thresh
    Sysctl Check Param Int    net.ipv4.route.gc_thresh    -1
Sysctl_net_ipv4_route_gc_timeout
    Sysctl Check Param Int    net.ipv4.route.gc_timeout    300
Sysctl_net_ipv4_route_max_size
    Sysctl Check Param Int    net.ipv4.route.max_size    2147483647
Sysctl_net_ipv4_route_min_adv_mss
    Sysctl Check Param Int    net.ipv4.route.min_adv_mss    256
Sysctl_net_ipv4_route_min_pmtu
    Sysctl Check Param Int    net.ipv4.route.min_pmtu    552
Sysctl_net_ipv4_route_mtu_expires
    Sysctl Check Param Int    net.ipv4.route.mtu_expires    600
Sysctl_net_ipv4_route_redirect_load
    Sysctl Check Param Int    net.ipv4.route.redirect_load    20
Sysctl_net_ipv4_route_redirect_number
    Sysctl Check Param Int    net.ipv4.route.redirect_number    9
Sysctl_net_ipv4_route_redirect_silence
    Sysctl Check Param Int    net.ipv4.route.redirect_silence    20480
Sysctl_net_ipv4_tcp_abort_on_overflow
    Sysctl Check Param Int    net.ipv4.tcp_abort_on_overflow    0
Sysctl_net_ipv4_tcp_adv_win_scale
    Sysctl Check Param Int    net.ipv4.tcp_adv_win_scale    1
Sysctl_net_ipv4_tcp_allowed_congestion_control
    Sysctl Check Param Str    net.ipv4.tcp_allowed_congestion_control    reno cubic
Sysctl_net_ipv4_tcp_app_win
    Sysctl Check Param Int    net.ipv4.tcp_app_win    31
Sysctl_net_ipv4_tcp_autocorking
    Sysctl Check Param Int    net.ipv4.tcp_autocorking    1
Sysctl_net_ipv4_tcp_available_congestion_control
    Sysctl Check Param Str    net.ipv4.tcp_available_congestion_control    reno cubic
Sysctl_net_ipv4_tcp_available_ulp
    Sysctl Check Param Str    net.ipv4.tcp_available_ulp    espintcp mptcp
Sysctl_net_ipv4_tcp_base_mss
    Sysctl Check Param Int    net.ipv4.tcp_base_mss    1024
Sysctl_net_ipv4_tcp_challenge_ack_limit
    Sysctl Check Param Int    net.ipv4.tcp_challenge_ack_limit    2147483647
Sysctl_net_ipv4_tcp_child_ehash_entries
    Sysctl Check Param Int    net.ipv4.tcp_child_ehash_entries    0
Sysctl_net_ipv4_tcp_comp_sack_delay_ns
    Sysctl Check Param Int    net.ipv4.tcp_comp_sack_delay_ns    1000000
Sysctl_net_ipv4_tcp_comp_sack_nr
    Sysctl Check Param Int    net.ipv4.tcp_comp_sack_nr    44
Sysctl_net_ipv4_tcp_comp_sack_slack_ns
    Sysctl Check Param Int    net.ipv4.tcp_comp_sack_slack_ns    100000
Sysctl_net_ipv4_tcp_congestion_control
    Sysctl Check Param Str    net.ipv4.tcp_congestion_control    cubic
Sysctl_net_ipv4_tcp_dsack
    Sysctl Check Param Int    net.ipv4.tcp_dsack    1
Sysctl_net_ipv4_tcp_early_demux
    Sysctl Check Param Int    net.ipv4.tcp_early_demux    1
Sysctl_net_ipv4_tcp_early_retrans
    Sysctl Check Param Int    net.ipv4.tcp_early_retrans    3
Sysctl_net_ipv4_tcp_ecn
    Sysctl Check Param Int    net.ipv4.tcp_ecn    2
Sysctl_net_ipv4_tcp_ecn_fallback
    Sysctl Check Param Int    net.ipv4.tcp_ecn_fallback    1
Sysctl_net_ipv4_tcp_ehash_entries
    Sysctl Check Param Int    net.ipv4.tcp_ehash_entries    16384
Sysctl_net_ipv4_tcp_fack
    Sysctl Check Param Int    net.ipv4.tcp_fack    0
Sysctl_net_ipv4_tcp_fastopen
    Sysctl Check Param Int    net.ipv4.tcp_fastopen    1
Sysctl_net_ipv4_tcp_fastopen_blackhole_timeout_sec
    Sysctl Check Param Int    net.ipv4.tcp_fastopen_blackhole_timeout_sec    0
Sysctl_net_ipv4_tcp_fastopen_key
    Sysctl Check Param Str    net.ipv4.tcp_fastopen_key    00000000-00000000-00000000-00000000
Sysctl_net_ipv4_tcp_fin_timeout
    Sysctl Check Param Int    net.ipv4.tcp_fin_timeout    60
Sysctl_net_ipv4_tcp_frto
    Sysctl Check Param Int    net.ipv4.tcp_frto    2
Sysctl_net_ipv4_tcp_fwmark_accept
    Sysctl Check Param Int    net.ipv4.tcp_fwmark_accept    0
Sysctl_net_ipv4_tcp_invalid_ratelimit
    Sysctl Check Param Int    net.ipv4.tcp_invalid_ratelimit    500
Sysctl_net_ipv4_tcp_keepalive_intvl
    Sysctl Check Param Int    net.ipv4.tcp_keepalive_intvl    75
Sysctl_net_ipv4_tcp_keepalive_probes
    Sysctl Check Param Int    net.ipv4.tcp_keepalive_probes    9
Sysctl_net_ipv4_tcp_keepalive_time
    Sysctl Check Param Int    net.ipv4.tcp_keepalive_time    7200
Sysctl_net_ipv4_tcp_l3mdev_accept
    Sysctl Check Param Int    net.ipv4.tcp_l3mdev_accept    0
Sysctl_net_ipv4_tcp_limit_output_bytes
    Sysctl Check Param Int    net.ipv4.tcp_limit_output_bytes    4194304
Sysctl_net_ipv4_tcp_low_latency
    Sysctl Check Param Int    net.ipv4.tcp_low_latency    0
Sysctl_net_ipv4_tcp_max_reordering
    Sysctl Check Param Int    net.ipv4.tcp_max_reordering    300
Sysctl_net_ipv4_tcp_migrate_req
    Sysctl Check Param Int    net.ipv4.tcp_migrate_req    0
Sysctl_net_ipv4_tcp_min_rtt_wlen
    Sysctl Check Param Int    net.ipv4.tcp_min_rtt_wlen    300
Sysctl_net_ipv4_tcp_min_snd_mss
    Sysctl Check Param Int    net.ipv4.tcp_min_snd_mss    48
Sysctl_net_ipv4_tcp_min_tso_segs
    Sysctl Check Param Int    net.ipv4.tcp_min_tso_segs    2
Sysctl_net_ipv4_tcp_moderate_rcvbuf
    Sysctl Check Param Int    net.ipv4.tcp_moderate_rcvbuf    1
Sysctl_net_ipv4_tcp_mtu_probe_floor
    Sysctl Check Param Int    net.ipv4.tcp_mtu_probe_floor    48
Sysctl_net_ipv4_tcp_mtu_probing
    Sysctl Check Param Int    net.ipv4.tcp_mtu_probing    0
Sysctl_net_ipv4_tcp_no_metrics_save
    Sysctl Check Param Int    net.ipv4.tcp_no_metrics_save    0
Sysctl_net_ipv4_tcp_no_ssthresh_metrics_save
    Sysctl Check Param Int    net.ipv4.tcp_no_ssthresh_metrics_save    1
Sysctl_net_ipv4_tcp_notsent_lowat
    Sysctl Check Param Int    net.ipv4.tcp_notsent_lowat    4294967295
Sysctl_net_ipv4_tcp_orphan_retries
    Sysctl Check Param Int    net.ipv4.tcp_orphan_retries    0
Sysctl_net_ipv4_tcp_pacing_ca_ratio
    Sysctl Check Param Int    net.ipv4.tcp_pacing_ca_ratio    120
Sysctl_net_ipv4_tcp_pacing_ss_ratio
    Sysctl Check Param Int    net.ipv4.tcp_pacing_ss_ratio    200
Sysctl_net_ipv4_tcp_plb_cong_thresh
    Sysctl Check Param Int    net.ipv4.tcp_plb_cong_thresh    128
Sysctl_net_ipv4_tcp_plb_enabled
    Sysctl Check Param Int    net.ipv4.tcp_plb_enabled    0
Sysctl_net_ipv4_tcp_plb_idle_rehash_rounds
    Sysctl Check Param Int    net.ipv4.tcp_plb_idle_rehash_rounds    3
Sysctl_net_ipv4_tcp_plb_rehash_rounds
    Sysctl Check Param Int    net.ipv4.tcp_plb_rehash_rounds    12
Sysctl_net_ipv4_tcp_plb_suspend_rto_sec
    Sysctl Check Param Int    net.ipv4.tcp_plb_suspend_rto_sec    60
Sysctl_net_ipv4_tcp_probe_interval
    Sysctl Check Param Int    net.ipv4.tcp_probe_interval    600
Sysctl_net_ipv4_tcp_probe_threshold
    Sysctl Check Param Int    net.ipv4.tcp_probe_threshold    8
Sysctl_net_ipv4_tcp_recovery
    Sysctl Check Param Int    net.ipv4.tcp_recovery    1
Sysctl_net_ipv4_tcp_reflect_tos
    Sysctl Check Param Int    net.ipv4.tcp_reflect_tos    0
Sysctl_net_ipv4_tcp_reordering
    Sysctl Check Param Int    net.ipv4.tcp_reordering    3
Sysctl_net_ipv4_tcp_retrans_collapse
    Sysctl Check Param Int    net.ipv4.tcp_retrans_collapse    1
Sysctl_net_ipv4_tcp_retries1
    Sysctl Check Param Int    net.ipv4.tcp_retries1    3
Sysctl_net_ipv4_tcp_retries2
    Sysctl Check Param Int    net.ipv4.tcp_retries2    15
Sysctl_net_ipv4_tcp_rfc1337
    Sysctl Check Param Int    net.ipv4.tcp_rfc1337    0
Sysctl_net_ipv4_tcp_rmem
    Sysctl Check Param Int    net.ipv4.tcp_rmem    4096 131072 15041664
Sysctl_net_ipv4_tcp_sack
    Sysctl Check Param Int    net.ipv4.tcp_sack    1
Sysctl_net_ipv4_tcp_slow_start_after_idle
    Sysctl Check Param Int    net.ipv4.tcp_slow_start_after_idle    1
Sysctl_net_ipv4_tcp_stdurg
    Sysctl Check Param Int    net.ipv4.tcp_stdurg    0
Sysctl_net_ipv4_tcp_syn_retries
    Sysctl Check Param Int    net.ipv4.tcp_syn_retries    6
Sysctl_net_ipv4_tcp_synack_retries
    Sysctl Check Param Int    net.ipv4.tcp_synack_retries    5
Sysctl_net_ipv4_tcp_syncookies
    Sysctl Check Param Int    net.ipv4.tcp_syncookies    1
Sysctl_net_ipv4_tcp_thin_linear_timeouts
    Sysctl Check Param Int    net.ipv4.tcp_thin_linear_timeouts    0
Sysctl_net_ipv4_tcp_timestamps
    Sysctl Check Param Int    net.ipv4.tcp_timestamps    1
Sysctl_net_ipv4_tcp_tso_rtt_log
    Sysctl Check Param Int    net.ipv4.tcp_tso_rtt_log    9
Sysctl_net_ipv4_tcp_tso_win_divisor
    Sysctl Check Param Int    net.ipv4.tcp_tso_win_divisor    3
Sysctl_net_ipv4_tcp_tw_reuse
    Sysctl Check Param Int    net.ipv4.tcp_tw_reuse    2
Sysctl_net_ipv4_tcp_window_scaling
    Sysctl Check Param Int    net.ipv4.tcp_window_scaling    1
Sysctl_net_ipv4_tcp_wmem
    Sysctl Check Param Int    net.ipv4.tcp_wmem    4096 16384 4194304
Sysctl_net_ipv4_tcp_workaround_signed_windows
    Sysctl Check Param Int    net.ipv4.tcp_workaround_signed_windows    0
Sysctl_net_ipv4_udp_child_hash_entries
    Sysctl Check Param Int    net.ipv4.udp_child_hash_entries    0
Sysctl_net_ipv4_udp_early_demux
    Sysctl Check Param Int    net.ipv4.udp_early_demux    1
Sysctl_net_ipv4_udp_hash_entries
    Sysctl Check Param Int    net.ipv4.udp_hash_entries    1024
Sysctl_net_ipv4_udp_l3mdev_accept
    Sysctl Check Param Int    net.ipv4.udp_l3mdev_accept    0
Sysctl_net_ipv4_udp_rmem_min
    Sysctl Check Param Int    net.ipv4.udp_rmem_min    4096
Sysctl_net_ipv4_udp_wmem_min
    Sysctl Check Param Int    net.ipv4.udp_wmem_min    4096
Sysctl_net_ipv4_xfrm4_gc_thresh
    Sysctl Check Param Int    net.ipv4.xfrm4_gc_thresh    32768
Sysctl_net_ipv6_anycast_src_echo_reply
    Sysctl Check Param Int    net.ipv6.anycast_src_echo_reply    0
Sysctl_net_ipv6_auto_flowlabels
    Sysctl Check Param Int    net.ipv6.auto_flowlabels    1
Sysctl_net_ipv6_bindv6only
    Sysctl Check Param Int    net.ipv6.bindv6only    0
Sysctl_net_ipv6_calipso_cache_bucket_size
    Sysctl Check Param Int    net.ipv6.calipso_cache_bucket_size    10
Sysctl_net_ipv6_calipso_cache_enable
    Sysctl Check Param Int    net.ipv6.calipso_cache_enable    1
Sysctl_net_ipv6_conf_all_accept_dad
    Sysctl Check Param Int    net.ipv6.conf.all.accept_dad    0
Sysctl_net_ipv6_conf_all_accept_ra
    Sysctl Check Param Int    net.ipv6.conf.all.accept_ra    1
Sysctl_net_ipv6_conf_all_accept_ra_defrtr
    Sysctl Check Param Int    net.ipv6.conf.all.accept_ra_defrtr    1
Sysctl_net_ipv6_conf_all_accept_ra_from_local
    Sysctl Check Param Int    net.ipv6.conf.all.accept_ra_from_local    0
Sysctl_net_ipv6_conf_all_accept_ra_min_hop_limit
    Sysctl Check Param Int    net.ipv6.conf.all.accept_ra_min_hop_limit    1
Sysctl_net_ipv6_conf_all_accept_ra_mtu
    Sysctl Check Param Int    net.ipv6.conf.all.accept_ra_mtu    1
Sysctl_net_ipv6_conf_all_accept_ra_pinfo
    Sysctl Check Param Int    net.ipv6.conf.all.accept_ra_pinfo    1
Sysctl_net_ipv6_conf_all_accept_ra_rt_info_max_plen
    Sysctl Check Param Int    net.ipv6.conf.all.accept_ra_rt_info_max_plen    0
Sysctl_net_ipv6_conf_all_accept_ra_rt_info_min_plen
    Sysctl Check Param Int    net.ipv6.conf.all.accept_ra_rt_info_min_plen    0
Sysctl_net_ipv6_conf_all_accept_ra_rtr_pref
    Sysctl Check Param Int    net.ipv6.conf.all.accept_ra_rtr_pref    1
Sysctl_net_ipv6_conf_all_accept_redirects
    Sysctl Check Param Int    net.ipv6.conf.all.accept_redirects    0
Sysctl_net_ipv6_conf_all_accept_source_route
    Sysctl Check Param Int    net.ipv6.conf.all.accept_source_route    0
Sysctl_net_ipv6_conf_all_accept_untracked_na
    Sysctl Check Param Int    net.ipv6.conf.all.accept_untracked_na    0
Sysctl_net_ipv6_conf_all_addr_gen_mode
    Sysctl Check Param Int    net.ipv6.conf.all.addr_gen_mode    0
Sysctl_net_ipv6_conf_all_autoconf
    Sysctl Check Param Int    net.ipv6.conf.all.autoconf    1
Sysctl_net_ipv6_conf_all_dad_transmits
    Sysctl Check Param Int    net.ipv6.conf.all.dad_transmits    1
Sysctl_net_ipv6_conf_all_disable_ipv6
    Sysctl Check Param Int    net.ipv6.conf.all.disable_ipv6    0
Sysctl_net_ipv6_conf_all_disable_policy
    Sysctl Check Param Int    net.ipv6.conf.all.disable_policy    0
Sysctl_net_ipv6_conf_all_drop_unicast_in_l2_multicast
    Sysctl Check Param Int    net.ipv6.conf.all.drop_unicast_in_l2_multicast    0
Sysctl_net_ipv6_conf_all_drop_unsolicited_na
    Sysctl Check Param Int    net.ipv6.conf.all.drop_unsolicited_na    0
Sysctl_net_ipv6_conf_all_enhanced_dad
    Sysctl Check Param Int    net.ipv6.conf.all.enhanced_dad    1
Sysctl_net_ipv6_conf_all_force_mld_version
    Sysctl Check Param Int    net.ipv6.conf.all.force_mld_version    0
Sysctl_net_ipv6_conf_all_force_tllao
    Sysctl Check Param Int    net.ipv6.conf.all.force_tllao    0
Sysctl_net_ipv6_conf_all_forwarding
    Sysctl Check Param Int    net.ipv6.conf.all.forwarding    0
Sysctl_net_ipv6_conf_all_hop_limit
    Sysctl Check Param Int    net.ipv6.conf.all.hop_limit    64
Sysctl_net_ipv6_conf_all_ignore_routes_with_linkdown
    Sysctl Check Param Int    net.ipv6.conf.all.ignore_routes_with_linkdown    0
Sysctl_net_ipv6_conf_all_ioam6_enabled
    Sysctl Check Param Int    net.ipv6.conf.all.ioam6_enabled    0
Sysctl_net_ipv6_conf_all_ioam6_id
    Sysctl Check Param Int    net.ipv6.conf.all.ioam6_id    65535
Sysctl_net_ipv6_conf_all_ioam6_id_wide
    Sysctl Check Param Int    net.ipv6.conf.all.ioam6_id_wide    4294967295
Sysctl_net_ipv6_conf_all_keep_addr_on_down
    Sysctl Check Param Int    net.ipv6.conf.all.keep_addr_on_down    0
Sysctl_net_ipv6_conf_all_max_addresses
    Sysctl Check Param Int    net.ipv6.conf.all.max_addresses    16
Sysctl_net_ipv6_conf_all_max_desync_factor
    Sysctl Check Param Int    net.ipv6.conf.all.max_desync_factor    600
Sysctl_net_ipv6_conf_all_mc_forwarding
    Sysctl Check Param Int    net.ipv6.conf.all.mc_forwarding    0
Sysctl_net_ipv6_conf_all_mldv1_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv6.conf.all.mldv1_unsolicited_report_interval    10000
Sysctl_net_ipv6_conf_all_mldv2_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv6.conf.all.mldv2_unsolicited_report_interval    1000
Sysctl_net_ipv6_conf_all_mtu
    Sysctl Check Param Int    net.ipv6.conf.all.mtu    1280
Sysctl_net_ipv6_conf_all_ndisc_evict_nocarrier
    Sysctl Check Param Int    net.ipv6.conf.all.ndisc_evict_nocarrier    1
Sysctl_net_ipv6_conf_all_ndisc_notify
    Sysctl Check Param Int    net.ipv6.conf.all.ndisc_notify    0
Sysctl_net_ipv6_conf_all_ndisc_tclass
    Sysctl Check Param Int    net.ipv6.conf.all.ndisc_tclass    0
Sysctl_net_ipv6_conf_all_proxy_ndp
    Sysctl Check Param Int    net.ipv6.conf.all.proxy_ndp    0
Sysctl_net_ipv6_conf_all_ra_defrtr_metric
    Sysctl Check Param Int    net.ipv6.conf.all.ra_defrtr_metric    1024
Sysctl_net_ipv6_conf_all_regen_max_retry
    Sysctl Check Param Int    net.ipv6.conf.all.regen_max_retry    3
Sysctl_net_ipv6_conf_all_router_probe_interval
    Sysctl Check Param Int    net.ipv6.conf.all.router_probe_interval    60
Sysctl_net_ipv6_conf_all_router_solicitation_delay
    Sysctl Check Param Int    net.ipv6.conf.all.router_solicitation_delay    1
Sysctl_net_ipv6_conf_all_router_solicitation_interval
    Sysctl Check Param Int    net.ipv6.conf.all.router_solicitation_interval    4
Sysctl_net_ipv6_conf_all_router_solicitation_max_interval
    Sysctl Check Param Int    net.ipv6.conf.all.router_solicitation_max_interval    3600
Sysctl_net_ipv6_conf_all_router_solicitations
    Sysctl Check Param Int    net.ipv6.conf.all.router_solicitations    -1
Sysctl_net_ipv6_conf_all_rpl_seg_enabled
    Sysctl Check Param Int    net.ipv6.conf.all.rpl_seg_enabled    0
Sysctl_net_ipv6_conf_all_seg6_enabled
    Sysctl Check Param Int    net.ipv6.conf.all.seg6_enabled    0
Sysctl_net_ipv6_conf_all_seg6_require_hmac
    Sysctl Check Param Int    net.ipv6.conf.all.seg6_require_hmac    0
Sysctl_net_ipv6_conf_all_suppress_frag_ndisc
    Sysctl Check Param Int    net.ipv6.conf.all.suppress_frag_ndisc    1
Sysctl_net_ipv6_conf_all_temp_prefered_lft
    Sysctl Check Param Int    net.ipv6.conf.all.temp_prefered_lft    86400
Sysctl_net_ipv6_conf_all_temp_valid_lft
    Sysctl Check Param Int    net.ipv6.conf.all.temp_valid_lft    604800
Sysctl_net_ipv6_conf_all_use_oif_addrs_only
    Sysctl Check Param Int    net.ipv6.conf.all.use_oif_addrs_only    0
Sysctl_net_ipv6_conf_all_use_tempaddr
    Sysctl Check Param Int    net.ipv6.conf.all.use_tempaddr    0
Sysctl_net_ipv6_conf_default_accept_dad
    Sysctl Check Param Int    net.ipv6.conf.default.accept_dad    1
Sysctl_net_ipv6_conf_default_accept_ra
    Sysctl Check Param Int    net.ipv6.conf.default.accept_ra    1
Sysctl_net_ipv6_conf_default_accept_ra_defrtr
    Sysctl Check Param Int    net.ipv6.conf.default.accept_ra_defrtr    1
Sysctl_net_ipv6_conf_default_accept_ra_from_local
    Sysctl Check Param Int    net.ipv6.conf.default.accept_ra_from_local    0
Sysctl_net_ipv6_conf_default_accept_ra_min_hop_limit
    Sysctl Check Param Int    net.ipv6.conf.default.accept_ra_min_hop_limit    1
Sysctl_net_ipv6_conf_default_accept_ra_mtu
    Sysctl Check Param Int    net.ipv6.conf.default.accept_ra_mtu    1
Sysctl_net_ipv6_conf_default_accept_ra_pinfo
    Sysctl Check Param Int    net.ipv6.conf.default.accept_ra_pinfo    1
Sysctl_net_ipv6_conf_default_accept_ra_rt_info_max_plen
    Sysctl Check Param Int    net.ipv6.conf.default.accept_ra_rt_info_max_plen    0
Sysctl_net_ipv6_conf_default_accept_ra_rt_info_min_plen
    Sysctl Check Param Int    net.ipv6.conf.default.accept_ra_rt_info_min_plen    0
Sysctl_net_ipv6_conf_default_accept_ra_rtr_pref
    Sysctl Check Param Int    net.ipv6.conf.default.accept_ra_rtr_pref    1
Sysctl_net_ipv6_conf_default_accept_redirects
    Sysctl Check Param Int    net.ipv6.conf.default.accept_redirects    0
Sysctl_net_ipv6_conf_default_accept_source_route
    Sysctl Check Param Int    net.ipv6.conf.default.accept_source_route    0
Sysctl_net_ipv6_conf_default_accept_untracked_na
    Sysctl Check Param Int    net.ipv6.conf.default.accept_untracked_na    0
Sysctl_net_ipv6_conf_default_addr_gen_mode
    Sysctl Check Param Int    net.ipv6.conf.default.addr_gen_mode    0
Sysctl_net_ipv6_conf_default_autoconf
    Sysctl Check Param Int    net.ipv6.conf.default.autoconf    1
Sysctl_net_ipv6_conf_default_dad_transmits
    Sysctl Check Param Int    net.ipv6.conf.default.dad_transmits    1
Sysctl_net_ipv6_conf_default_disable_ipv6
    Sysctl Check Param Int    net.ipv6.conf.default.disable_ipv6    0
Sysctl_net_ipv6_conf_default_disable_policy
    Sysctl Check Param Int    net.ipv6.conf.default.disable_policy    0
Sysctl_net_ipv6_conf_default_drop_unicast_in_l2_multicast
    Sysctl Check Param Int    net.ipv6.conf.default.drop_unicast_in_l2_multicast    0
Sysctl_net_ipv6_conf_default_drop_unsolicited_na
    Sysctl Check Param Int    net.ipv6.conf.default.drop_unsolicited_na    0
Sysctl_net_ipv6_conf_default_enhanced_dad
    Sysctl Check Param Int    net.ipv6.conf.default.enhanced_dad    1
Sysctl_net_ipv6_conf_default_force_mld_version
    Sysctl Check Param Int    net.ipv6.conf.default.force_mld_version    0
Sysctl_net_ipv6_conf_default_force_tllao
    Sysctl Check Param Int    net.ipv6.conf.default.force_tllao    0
Sysctl_net_ipv6_conf_default_forwarding
    Sysctl Check Param Int    net.ipv6.conf.default.forwarding    0
Sysctl_net_ipv6_conf_default_hop_limit
    Sysctl Check Param Int    net.ipv6.conf.default.hop_limit    64
Sysctl_net_ipv6_conf_default_ignore_routes_with_linkdown
    Sysctl Check Param Int    net.ipv6.conf.default.ignore_routes_with_linkdown    0
Sysctl_net_ipv6_conf_default_ioam6_enabled
    Sysctl Check Param Int    net.ipv6.conf.default.ioam6_enabled    0
Sysctl_net_ipv6_conf_default_ioam6_id
    Sysctl Check Param Int    net.ipv6.conf.default.ioam6_id    65535
Sysctl_net_ipv6_conf_default_ioam6_id_wide
    Sysctl Check Param Int    net.ipv6.conf.default.ioam6_id_wide    4294967295
Sysctl_net_ipv6_conf_default_keep_addr_on_down
    Sysctl Check Param Int    net.ipv6.conf.default.keep_addr_on_down    0
Sysctl_net_ipv6_conf_default_max_addresses
    Sysctl Check Param Int    net.ipv6.conf.default.max_addresses    16
Sysctl_net_ipv6_conf_default_max_desync_factor
    Sysctl Check Param Int    net.ipv6.conf.default.max_desync_factor    600
Sysctl_net_ipv6_conf_default_mc_forwarding
    Sysctl Check Param Int    net.ipv6.conf.default.mc_forwarding    0
Sysctl_net_ipv6_conf_default_mldv1_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv6.conf.default.mldv1_unsolicited_report_interval    10000
Sysctl_net_ipv6_conf_default_mldv2_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv6.conf.default.mldv2_unsolicited_report_interval    1000
Sysctl_net_ipv6_conf_default_mtu
    Sysctl Check Param Int    net.ipv6.conf.default.mtu    1280
Sysctl_net_ipv6_conf_default_ndisc_evict_nocarrier
    Sysctl Check Param Int    net.ipv6.conf.default.ndisc_evict_nocarrier    1
Sysctl_net_ipv6_conf_default_ndisc_notify
    Sysctl Check Param Int    net.ipv6.conf.default.ndisc_notify    0
Sysctl_net_ipv6_conf_default_ndisc_tclass
    Sysctl Check Param Int    net.ipv6.conf.default.ndisc_tclass    0
Sysctl_net_ipv6_conf_default_proxy_ndp
    Sysctl Check Param Int    net.ipv6.conf.default.proxy_ndp    0
Sysctl_net_ipv6_conf_default_ra_defrtr_metric
    Sysctl Check Param Int    net.ipv6.conf.default.ra_defrtr_metric    1024
Sysctl_net_ipv6_conf_default_regen_max_retry
    Sysctl Check Param Int    net.ipv6.conf.default.regen_max_retry    3
Sysctl_net_ipv6_conf_default_router_probe_interval
    Sysctl Check Param Int    net.ipv6.conf.default.router_probe_interval    60
Sysctl_net_ipv6_conf_default_router_solicitation_delay
    Sysctl Check Param Int    net.ipv6.conf.default.router_solicitation_delay    1
Sysctl_net_ipv6_conf_default_router_solicitation_interval
    Sysctl Check Param Int    net.ipv6.conf.default.router_solicitation_interval    4
Sysctl_net_ipv6_conf_default_router_solicitation_max_interval
    Sysctl Check Param Int    net.ipv6.conf.default.router_solicitation_max_interval    3600
Sysctl_net_ipv6_conf_default_router_solicitations
    Sysctl Check Param Int    net.ipv6.conf.default.router_solicitations    -1
Sysctl_net_ipv6_conf_default_rpl_seg_enabled
    Sysctl Check Param Int    net.ipv6.conf.default.rpl_seg_enabled    0
Sysctl_net_ipv6_conf_default_seg6_enabled
    Sysctl Check Param Int    net.ipv6.conf.default.seg6_enabled    0
Sysctl_net_ipv6_conf_default_seg6_require_hmac
    Sysctl Check Param Int    net.ipv6.conf.default.seg6_require_hmac    0
Sysctl_net_ipv6_conf_default_suppress_frag_ndisc
    Sysctl Check Param Int    net.ipv6.conf.default.suppress_frag_ndisc    1
Sysctl_net_ipv6_conf_default_temp_prefered_lft
    Sysctl Check Param Int    net.ipv6.conf.default.temp_prefered_lft    86400
Sysctl_net_ipv6_conf_default_temp_valid_lft
    Sysctl Check Param Int    net.ipv6.conf.default.temp_valid_lft    604800
Sysctl_net_ipv6_conf_default_use_oif_addrs_only
    Sysctl Check Param Int    net.ipv6.conf.default.use_oif_addrs_only    0
Sysctl_net_ipv6_conf_default_use_tempaddr
    Sysctl Check Param Int    net.ipv6.conf.default.use_tempaddr    1
Sysctl_net_ipv6_conf_ens4_accept_dad
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_dad    1
Sysctl_net_ipv6_conf_ens4_accept_ra
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_ra    0
Sysctl_net_ipv6_conf_ens4_accept_ra_defrtr
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_ra_defrtr    1
Sysctl_net_ipv6_conf_ens4_accept_ra_from_local
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_ra_from_local    0
Sysctl_net_ipv6_conf_ens4_accept_ra_min_hop_limit
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_ra_min_hop_limit    1
Sysctl_net_ipv6_conf_ens4_accept_ra_mtu
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_ra_mtu    1
Sysctl_net_ipv6_conf_ens4_accept_ra_pinfo
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_ra_pinfo    1
Sysctl_net_ipv6_conf_ens4_accept_ra_rt_info_max_plen
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_ra_rt_info_max_plen    0
Sysctl_net_ipv6_conf_ens4_accept_ra_rt_info_min_plen
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_ra_rt_info_min_plen    0
Sysctl_net_ipv6_conf_ens4_accept_ra_rtr_pref
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_ra_rtr_pref    1
Sysctl_net_ipv6_conf_ens4_accept_redirects
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_redirects    0
Sysctl_net_ipv6_conf_ens4_accept_source_route
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_source_route    0
Sysctl_net_ipv6_conf_ens4_accept_untracked_na
    Sysctl Check Param Int    net.ipv6.conf.ens4.accept_untracked_na    0
Sysctl_net_ipv6_conf_ens4_addr_gen_mode
    Sysctl Check Param Int    net.ipv6.conf.ens4.addr_gen_mode    1
Sysctl_net_ipv6_conf_ens4_autoconf
    Sysctl Check Param Int    net.ipv6.conf.ens4.autoconf    1
Sysctl_net_ipv6_conf_ens4_dad_transmits
    Sysctl Check Param Int    net.ipv6.conf.ens4.dad_transmits    1
Sysctl_net_ipv6_conf_ens4_disable_ipv6
    Sysctl Check Param Int    net.ipv6.conf.ens4.disable_ipv6    0
Sysctl_net_ipv6_conf_ens4_disable_policy
    Sysctl Check Param Int    net.ipv6.conf.ens4.disable_policy    0
Sysctl_net_ipv6_conf_ens4_drop_unicast_in_l2_multicast
    Sysctl Check Param Int    net.ipv6.conf.ens4.drop_unicast_in_l2_multicast    0
Sysctl_net_ipv6_conf_ens4_drop_unsolicited_na
    Sysctl Check Param Int    net.ipv6.conf.ens4.drop_unsolicited_na    0
Sysctl_net_ipv6_conf_ens4_enhanced_dad
    Sysctl Check Param Int    net.ipv6.conf.ens4.enhanced_dad    1
Sysctl_net_ipv6_conf_ens4_force_mld_version
    Sysctl Check Param Int    net.ipv6.conf.ens4.force_mld_version    0
Sysctl_net_ipv6_conf_ens4_force_tllao
    Sysctl Check Param Int    net.ipv6.conf.ens4.force_tllao    0
Sysctl_net_ipv6_conf_ens4_forwarding
    Sysctl Check Param Int    net.ipv6.conf.ens4.forwarding    0
Sysctl_net_ipv6_conf_ens4_hop_limit
    Sysctl Check Param Int    net.ipv6.conf.ens4.hop_limit    64
Sysctl_net_ipv6_conf_ens4_ignore_routes_with_linkdown
    Sysctl Check Param Int    net.ipv6.conf.ens4.ignore_routes_with_linkdown    0
Sysctl_net_ipv6_conf_ens4_ioam6_enabled
    Sysctl Check Param Int    net.ipv6.conf.ens4.ioam6_enabled    0
Sysctl_net_ipv6_conf_ens4_ioam6_id
    Sysctl Check Param Int    net.ipv6.conf.ens4.ioam6_id    65535
Sysctl_net_ipv6_conf_ens4_ioam6_id_wide
    Sysctl Check Param Int    net.ipv6.conf.ens4.ioam6_id_wide    4294967295
Sysctl_net_ipv6_conf_ens4_keep_addr_on_down
    Sysctl Check Param Int    net.ipv6.conf.ens4.keep_addr_on_down    0
Sysctl_net_ipv6_conf_ens4_max_addresses
    Sysctl Check Param Int    net.ipv6.conf.ens4.max_addresses    16
Sysctl_net_ipv6_conf_ens4_max_desync_factor
    Sysctl Check Param Int    net.ipv6.conf.ens4.max_desync_factor    600
Sysctl_net_ipv6_conf_ens4_mc_forwarding
    Sysctl Check Param Int    net.ipv6.conf.ens4.mc_forwarding    0
Sysctl_net_ipv6_conf_ens4_mldv1_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv6.conf.ens4.mldv1_unsolicited_report_interval    10000
Sysctl_net_ipv6_conf_ens4_mldv2_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv6.conf.ens4.mldv2_unsolicited_report_interval    1000
Sysctl_net_ipv6_conf_ens4_ndisc_evict_nocarrier
    Sysctl Check Param Int    net.ipv6.conf.ens4.ndisc_evict_nocarrier    1
Sysctl_net_ipv6_conf_ens4_mtu
    Sysctl Check Param Int    net.ipv6.conf.ens4.mtu    1500
Sysctl_net_ipv6_conf_ens4_ndisc_notify
    Sysctl Check Param Int    net.ipv6.conf.ens4.ndisc_notify    0
Sysctl_net_ipv6_conf_ens4_ndisc_tclass
    Sysctl Check Param Int    net.ipv6.conf.ens4.ndisc_tclass    0
Sysctl_net_ipv6_conf_ens4_proxy_ndp
    Sysctl Check Param Int    net.ipv6.conf.ens4.proxy_ndp    0
Sysctl_net_ipv6_conf_ens4_ra_defrtr_metric
    Sysctl Check Param Int    net.ipv6.conf.ens4.ra_defrtr_metric    1024
Sysctl_net_ipv6_conf_ens4_regen_max_retry
    Sysctl Check Param Int    net.ipv6.conf.ens4.regen_max_retry    3
Sysctl_net_ipv6_conf_ens4_router_probe_interval
    Sysctl Check Param Int    net.ipv6.conf.ens4.router_probe_interval    60
Sysctl_net_ipv6_conf_ens4_router_solicitation_delay
    Sysctl Check Param Int    net.ipv6.conf.ens4.router_solicitation_delay    1
Sysctl_net_ipv6_conf_ens4_router_solicitation_interval
    Sysctl Check Param Int    net.ipv6.conf.ens4.router_solicitation_interval    4
Sysctl_net_ipv6_conf_ens4_router_solicitation_max_interval
    Sysctl Check Param Int    net.ipv6.conf.ens4.router_solicitation_max_interval    3600
Sysctl_net_ipv6_conf_ens4_router_solicitations
    Sysctl Check Param Int    net.ipv6.conf.ens4.router_solicitations    -1
Sysctl_net_ipv6_conf_ens4_rpl_seg_enabled
    Sysctl Check Param Int    net.ipv6.conf.ens4.rpl_seg_enabled    0
Sysctl_net_ipv6_conf_ens4_seg6_enabled
    Sysctl Check Param Int    net.ipv6.conf.ens4.seg6_enabled    0
Sysctl_net_ipv6_conf_ens4_seg6_require_hmac
    Sysctl Check Param Int    net.ipv6.conf.ens4.seg6_require_hmac    0
Sysctl_net_ipv6_conf_ens4_suppress_frag_ndisc
    Sysctl Check Param Int    net.ipv6.conf.ens4.suppress_frag_ndisc    1
Sysctl_net_ipv6_conf_ens4_temp_prefered_lft
    Sysctl Check Param Int    net.ipv6.conf.ens4.temp_prefered_lft    86400
Sysctl_net_ipv6_conf_ens4_temp_valid_lft
    Sysctl Check Param Int    net.ipv6.conf.ens4.temp_valid_lft    604800
Sysctl_net_ipv6_conf_ens4_use_oif_addrs_only
    Sysctl Check Param Int    net.ipv6.conf.ens4.use_oif_addrs_only    0
Sysctl_net_ipv6_conf_ens4_use_tempaddr
    Sysctl Check Param Int    net.ipv6.conf.ens4.use_tempaddr    1
Sysctl_net_ipv6_conf_lo_accept_dad
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_dad    -1
Sysctl_net_ipv6_conf_lo_accept_ra
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_ra    1
Sysctl_net_ipv6_conf_lo_accept_ra_defrtr
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_ra_defrtr    1
Sysctl_net_ipv6_conf_lo_accept_ra_from_local
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_ra_from_local    0
Sysctl_net_ipv6_conf_lo_accept_ra_min_hop_limit
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_ra_min_hop_limit    1
Sysctl_net_ipv6_conf_lo_accept_ra_mtu
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_ra_mtu    1
Sysctl_net_ipv6_conf_lo_accept_ra_pinfo
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_ra_pinfo    1
Sysctl_net_ipv6_conf_lo_accept_ra_rt_info_max_plen
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_ra_rt_info_max_plen    0
Sysctl_net_ipv6_conf_lo_accept_ra_rt_info_min_plen
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_ra_rt_info_min_plen    0
Sysctl_net_ipv6_conf_lo_accept_ra_rtr_pref
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_ra_rtr_pref    1
Sysctl_net_ipv6_conf_lo_accept_redirects
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_redirects    1
Sysctl_net_ipv6_conf_lo_accept_source_route
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_source_route    0
Sysctl_net_ipv6_conf_lo_accept_untracked_na
    Sysctl Check Param Int    net.ipv6.conf.lo.accept_untracked_na    0
Sysctl_net_ipv6_conf_lo_addr_gen_mode
    Sysctl Check Param Int    net.ipv6.conf.lo.addr_gen_mode    0
Sysctl_net_ipv6_conf_lo_autoconf
    Sysctl Check Param Int    net.ipv6.conf.lo.autoconf    1
Sysctl_net_ipv6_conf_lo_dad_transmits
    Sysctl Check Param Int    net.ipv6.conf.lo.dad_transmits    1
Sysctl_net_ipv6_conf_lo_disable_ipv6
    Sysctl Check Param Int    net.ipv6.conf.lo.disable_ipv6    0
Sysctl_net_ipv6_conf_lo_disable_policy
    Sysctl Check Param Int    net.ipv6.conf.lo.disable_policy    0
Sysctl_net_ipv6_conf_lo_drop_unicast_in_l2_multicast
    Sysctl Check Param Int    net.ipv6.conf.lo.drop_unicast_in_l2_multicast    0
Sysctl_net_ipv6_conf_lo_drop_unsolicited_na
    Sysctl Check Param Int    net.ipv6.conf.lo.drop_unsolicited_na    0
Sysctl_net_ipv6_conf_lo_enhanced_dad
    Sysctl Check Param Int    net.ipv6.conf.lo.enhanced_dad    1
Sysctl_net_ipv6_conf_lo_force_mld_version
    Sysctl Check Param Int    net.ipv6.conf.lo.force_mld_version    0
Sysctl_net_ipv6_conf_lo_force_tllao
    Sysctl Check Param Int    net.ipv6.conf.lo.force_tllao    0
Sysctl_net_ipv6_conf_lo_forwarding
    Sysctl Check Param Int    net.ipv6.conf.lo.forwarding    0
Sysctl_net_ipv6_conf_lo_hop_limit
    Sysctl Check Param Int    net.ipv6.conf.lo.hop_limit    64
Sysctl_net_ipv6_conf_lo_ignore_routes_with_linkdown
    Sysctl Check Param Int    net.ipv6.conf.lo.ignore_routes_with_linkdown    0
Sysctl_net_ipv6_conf_lo_ioam6_enabled
    Sysctl Check Param Int    net.ipv6.conf.lo.ioam6_enabled    0
Sysctl_net_ipv6_conf_lo_ioam6_id
    Sysctl Check Param Int    net.ipv6.conf.lo.ioam6_id    65535
Sysctl_net_ipv6_conf_lo_ioam6_id_wide
    Sysctl Check Param Int    net.ipv6.conf.lo.ioam6_id_wide    4294967295
Sysctl_net_ipv6_conf_lo_keep_addr_on_down
    Sysctl Check Param Int    net.ipv6.conf.lo.keep_addr_on_down    0
Sysctl_net_ipv6_conf_lo_max_addresses
    Sysctl Check Param Int    net.ipv6.conf.lo.max_addresses    16
Sysctl_net_ipv6_conf_lo_max_desync_factor
    Sysctl Check Param Int    net.ipv6.conf.lo.max_desync_factor    600
Sysctl_net_ipv6_conf_lo_mc_forwarding
    Sysctl Check Param Int    net.ipv6.conf.lo.mc_forwarding    0
Sysctl_net_ipv6_conf_lo_mldv1_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv6.conf.lo.mldv1_unsolicited_report_interval    10000
Sysctl_net_ipv6_conf_lo_mldv2_unsolicited_report_interval
    Sysctl Check Param Int    net.ipv6.conf.lo.mldv2_unsolicited_report_interval    1000
Sysctl_net_ipv6_conf_lo_mtu
    Sysctl Check Param Int    net.ipv6.conf.lo.mtu    65536
Sysctl_net_ipv6_conf_lo_ndisc_evict_nocarrier
    Sysctl Check Param Int    net.ipv6.conf.lo.ndisc_evict_nocarrier    1
Sysctl_net_ipv6_conf_lo_ndisc_notify
    Sysctl Check Param Int    net.ipv6.conf.lo.ndisc_notify    0
Sysctl_net_ipv6_conf_lo_ndisc_tclass
    Sysctl Check Param Int    net.ipv6.conf.lo.ndisc_tclass    0
Sysctl_net_ipv6_conf_lo_proxy_ndp
    Sysctl Check Param Int    net.ipv6.conf.lo.proxy_ndp    0
Sysctl_net_ipv6_conf_lo_ra_defrtr_metric
    Sysctl Check Param Int    net.ipv6.conf.lo.ra_defrtr_metric    1024
Sysctl_net_ipv6_conf_lo_regen_max_retry
    Sysctl Check Param Int    net.ipv6.conf.lo.regen_max_retry    3
Sysctl_net_ipv6_conf_lo_router_probe_interval
    Sysctl Check Param Int    net.ipv6.conf.lo.router_probe_interval    60
Sysctl_net_ipv6_conf_lo_router_solicitation_delay
    Sysctl Check Param Int    net.ipv6.conf.lo.router_solicitation_delay    1
Sysctl_net_ipv6_conf_lo_router_solicitation_interval
    Sysctl Check Param Int    net.ipv6.conf.lo.router_solicitation_interval    4
Sysctl_net_ipv6_conf_lo_router_solicitation_max_interval
    Sysctl Check Param Int    net.ipv6.conf.lo.router_solicitation_max_interval    3600
Sysctl_net_ipv6_conf_lo_router_solicitations
    Sysctl Check Param Int    net.ipv6.conf.lo.router_solicitations    -1
Sysctl_net_ipv6_conf_lo_rpl_seg_enabled
    Sysctl Check Param Int    net.ipv6.conf.lo.rpl_seg_enabled    0
Sysctl_net_ipv6_conf_lo_seg6_enabled
    Sysctl Check Param Int    net.ipv6.conf.lo.seg6_enabled    0
Sysctl_net_ipv6_conf_lo_seg6_require_hmac
    Sysctl Check Param Int    net.ipv6.conf.lo.seg6_require_hmac    0
Sysctl_net_ipv6_conf_lo_suppress_frag_ndisc
    Sysctl Check Param Int    net.ipv6.conf.lo.suppress_frag_ndisc    1
Sysctl_net_ipv6_conf_lo_temp_prefered_lft
    Sysctl Check Param Int    net.ipv6.conf.lo.temp_prefered_lft    86400
Sysctl_net_ipv6_conf_lo_temp_valid_lft
    Sysctl Check Param Int    net.ipv6.conf.lo.temp_valid_lft    604800
Sysctl_net_ipv6_conf_lo_use_oif_addrs_only
    Sysctl Check Param Int    net.ipv6.conf.lo.use_oif_addrs_only    0
Sysctl_net_ipv6_conf_lo_use_tempaddr
    Sysctl Check Param Int    net.ipv6.conf.lo.use_tempaddr    -1
Sysctl_net_ipv6_fib_multipath_hash_fields
    Sysctl Check Param Int    net.ipv6.fib_multipath_hash_fields    7
Sysctl_net_ipv6_fib_multipath_hash_policy
    Sysctl Check Param Int    net.ipv6.fib_multipath_hash_policy    0
Sysctl_net_ipv6_fib_notify_on_flag_change
    Sysctl Check Param Int    net.ipv6.fib_notify_on_flag_change    0
Sysctl_net_ipv6_flowlabel_consistency
    Sysctl Check Param Int    net.ipv6.flowlabel_consistency    1
Sysctl_net_ipv6_flowlabel_reflect
    Sysctl Check Param Int    net.ipv6.flowlabel_reflect    0
Sysctl_net_ipv6_flowlabel_state_ranges
    Sysctl Check Param Int    net.ipv6.flowlabel_state_ranges    0
Sysctl_net_ipv6_fwmark_reflect
    Sysctl Check Param Int    net.ipv6.fwmark_reflect    0
Sysctl_net_ipv6_icmp_echo_ignore_all
    Sysctl Check Param Int    net.ipv6.icmp.echo_ignore_all    0
Sysctl_net_ipv6_icmp_echo_ignore_anycast
    Sysctl Check Param Int    net.ipv6.icmp.echo_ignore_anycast    0
Sysctl_net_ipv6_icmp_echo_ignore_multicast
    Sysctl Check Param Int    net.ipv6.icmp.echo_ignore_multicast    0
Sysctl_net_ipv6_icmp_ratelimit
    Sysctl Check Param Int    net.ipv6.icmp.ratelimit    1000
Sysctl_net_ipv6_icmp_ratemask
    Sysctl Check Param Str    net.ipv6.icmp.ratemask    0-1,3-127
Sysctl_net_ipv6_idgen_delay
    Sysctl Check Param Int    net.ipv6.idgen_delay    1
Sysctl_net_ipv6_idgen_retries
    Sysctl Check Param Int    net.ipv6.idgen_retries    3
Sysctl_net_ipv6_ioam6_id
    Sysctl Check Param Int    net.ipv6.ioam6_id    16777215
Sysctl_net_ipv6_ioam6_id_wide
    Sysctl Check Param Int    net.ipv6.ioam6_id_wide    72057594037927935
Sysctl_net_ipv6_ip6frag_high_thresh
    Sysctl Check Param Int    net.ipv6.ip6frag_high_thresh    4194304
Sysctl_net_ipv6_ip6frag_low_thresh
    Sysctl Check Param Int    net.ipv6.ip6frag_low_thresh    3145728
Sysctl_net_ipv6_ip6frag_secret_interval
    Sysctl Check Param Int    net.ipv6.ip6frag_secret_interval    0
Sysctl_net_ipv6_ip6frag_time
    Sysctl Check Param Int    net.ipv6.ip6frag_time    60
Sysctl_net_ipv6_ip_nonlocal_bind
    Sysctl Check Param Int    net.ipv6.ip_nonlocal_bind    0
Sysctl_net_ipv6_max_dst_opts_length
    Sysctl Check Param Int    net.ipv6.max_dst_opts_length    2147483647
Sysctl_net_ipv6_max_dst_opts_number
    Sysctl Check Param Int    net.ipv6.max_dst_opts_number    8
Sysctl_net_ipv6_max_hbh_length
    Sysctl Check Param Int    net.ipv6.max_hbh_length    2147483647
Sysctl_net_ipv6_max_hbh_opts_number
    Sysctl Check Param Int    net.ipv6.max_hbh_opts_number    8
Sysctl_net_ipv6_mld_max_msf
    Sysctl Check Param Int    net.ipv6.mld_max_msf    64
Sysctl_net_ipv6_mld_qrv
    Sysctl Check Param Int    net.ipv6.mld_qrv    2
Sysctl_net_ipv6_neigh_default_anycast_delay
    Sysctl Check Param Int    net.ipv6.neigh.default.anycast_delay    100
Sysctl_net_ipv6_neigh_default_app_solicit
    Sysctl Check Param Int    net.ipv6.neigh.default.app_solicit    0
Sysctl_net_ipv6_neigh_default_base_reachable_time_ms
    Sysctl Check Param Int    net.ipv6.neigh.default.base_reachable_time_ms    30000
Sysctl_net_ipv6_neigh_default_delay_first_probe_time
    Sysctl Check Param Int    net.ipv6.neigh.default.delay_first_probe_time    5
Sysctl_net_ipv6_neigh_default_gc_interval
    Sysctl Check Param Int    net.ipv6.neigh.default.gc_interval    30
Sysctl_net_ipv6_neigh_default_gc_stale_time
    Sysctl Check Param Int    net.ipv6.neigh.default.gc_stale_time    60
Sysctl_net_ipv6_neigh_default_gc_thresh1
    Sysctl Check Param Int    net.ipv6.neigh.default.gc_thresh1    128
Sysctl_net_ipv6_neigh_default_gc_thresh2
    Sysctl Check Param Int    net.ipv6.neigh.default.gc_thresh2    512
Sysctl_net_ipv6_neigh_default_gc_thresh3
    Sysctl Check Param Int    net.ipv6.neigh.default.gc_thresh3    1024
Sysctl_net_ipv6_neigh_default_interval_probe_time_ms
    Sysctl Check Param Int    net.ipv6.neigh.default.interval_probe_time_ms    5000
Sysctl_net_ipv6_neigh_default_locktime
    Sysctl Check Param Int    net.ipv6.neigh.default.locktime    0
Sysctl_net_ipv6_neigh_default_mcast_resolicit
    Sysctl Check Param Int    net.ipv6.neigh.default.mcast_resolicit    0
Sysctl_net_ipv6_neigh_default_mcast_solicit
    Sysctl Check Param Int    net.ipv6.neigh.default.mcast_solicit    3
Sysctl_net_ipv6_neigh_default_proxy_delay
    Sysctl Check Param Int    net.ipv6.neigh.default.proxy_delay    80
Sysctl_net_ipv6_neigh_default_proxy_qlen
    Sysctl Check Param Int    net.ipv6.neigh.default.proxy_qlen    64
Sysctl_net_ipv6_neigh_default_retrans_time_ms
    Sysctl Check Param Int    net.ipv6.neigh.default.retrans_time_ms    1000
Sysctl_net_ipv6_neigh_default_ucast_solicit
    Sysctl Check Param Int    net.ipv6.neigh.default.ucast_solicit    3
Sysctl_net_ipv6_neigh_default_unres_qlen
    Sysctl Check Param Int    net.ipv6.neigh.default.unres_qlen    101
Sysctl_net_ipv6_neigh_default_unres_qlen_bytes
    Sysctl Check Param Int    net.ipv6.neigh.default.unres_qlen_bytes    212992
Sysctl_net_ipv6_neigh_ens4_anycast_delay
    Sysctl Check Param Int    net.ipv6.neigh.ens4.anycast_delay    100
Sysctl_net_ipv6_neigh_ens4_app_solicit
    Sysctl Check Param Int    net.ipv6.neigh.ens4.app_solicit    0
Sysctl_net_ipv6_neigh_ens4_base_reachable_time_ms
    Sysctl Check Param Int    net.ipv6.neigh.ens4.base_reachable_time_ms    30000
Sysctl_net_ipv6_neigh_ens4_delay_first_probe_time
    Sysctl Check Param Int    net.ipv6.neigh.ens4.delay_first_probe_time    5
Sysctl_net_ipv6_neigh_ens4_gc_stale_time
    Sysctl Check Param Int    net.ipv6.neigh.ens4.gc_stale_time    60
Sysctl_net_ipv6_neigh_ens4_interval_probe_time_ms
    Sysctl Check Param Int    net.ipv6.neigh.ens4.interval_probe_time_ms    5000
Sysctl_net_ipv6_neigh_ens4_locktime
    Sysctl Check Param Int    net.ipv6.neigh.ens4.locktime    0
Sysctl_net_ipv6_neigh_ens4_mcast_resolicit
    Sysctl Check Param Int    net.ipv6.neigh.ens4.mcast_resolicit    0
Sysctl_net_ipv6_neigh_ens4_mcast_solicit
    Sysctl Check Param Int    net.ipv6.neigh.ens4.mcast_solicit    3
Sysctl_net_ipv6_neigh_ens4_proxy_delay
    Sysctl Check Param Int    net.ipv6.neigh.ens4.proxy_delay    80
Sysctl_net_ipv6_neigh_ens4_proxy_qlen
    Sysctl Check Param Int    net.ipv6.neigh.ens4.proxy_qlen    64
Sysctl_net_ipv6_neigh_ens4_retrans_time_ms
    Sysctl Check Param Int    net.ipv6.neigh.ens4.retrans_time_ms    1000
Sysctl_net_ipv6_neigh_ens4_ucast_solicit
    Sysctl Check Param Int    net.ipv6.neigh.ens4.ucast_solicit    3
Sysctl_net_ipv6_neigh_ens4_unres_qlen
    Sysctl Check Param Int    net.ipv6.neigh.ens4.unres_qlen    101
Sysctl_net_ipv6_neigh_ens4_unres_qlen_bytes
    Sysctl Check Param Int    net.ipv6.neigh.ens4.unres_qlen_bytes    212992
Sysctl_net_ipv6_neigh_lo_anycast_delay
    Sysctl Check Param Int    net.ipv6.neigh.lo.anycast_delay    100
Sysctl_net_ipv6_neigh_lo_app_solicit
    Sysctl Check Param Int    net.ipv6.neigh.lo.app_solicit    0
Sysctl_net_ipv6_neigh_lo_base_reachable_time_ms
    Sysctl Check Param Int    net.ipv6.neigh.lo.base_reachable_time_ms    30000
Sysctl_net_ipv6_neigh_lo_delay_first_probe_time
    Sysctl Check Param Int    net.ipv6.neigh.lo.delay_first_probe_time    5
Sysctl_net_ipv6_neigh_lo_gc_stale_time
    Sysctl Check Param Int    net.ipv6.neigh.lo.gc_stale_time    60
Sysctl_net_ipv6_neigh_lo_interval_probe_time_ms
    Sysctl Check Param Int    net.ipv6.neigh.lo.interval_probe_time_ms    5000
Sysctl_net_ipv6_neigh_lo_locktime
    Sysctl Check Param Int    net.ipv6.neigh.lo.locktime    0
Sysctl_net_ipv6_neigh_lo_mcast_resolicit
    Sysctl Check Param Int    net.ipv6.neigh.lo.mcast_resolicit    0
Sysctl_net_ipv6_neigh_lo_mcast_solicit
    Sysctl Check Param Int    net.ipv6.neigh.lo.mcast_solicit    3
Sysctl_net_ipv6_neigh_lo_proxy_delay
    Sysctl Check Param Int    net.ipv6.neigh.lo.proxy_delay    80
Sysctl_net_ipv6_neigh_lo_proxy_qlen
    Sysctl Check Param Int    net.ipv6.neigh.lo.proxy_qlen    64
Sysctl_net_ipv6_neigh_lo_retrans_time_ms
    Sysctl Check Param Int    net.ipv6.neigh.lo.retrans_time_ms    1000
Sysctl_net_ipv6_neigh_lo_ucast_solicit
    Sysctl Check Param Int    net.ipv6.neigh.lo.ucast_solicit    3
Sysctl_net_ipv6_neigh_lo_unres_qlen
    Sysctl Check Param Int    net.ipv6.neigh.lo.unres_qlen    101
Sysctl_net_ipv6_neigh_lo_unres_qlen_bytes
    Sysctl Check Param Int    net.ipv6.neigh.lo.unres_qlen_bytes    212992
Sysctl_net_ipv6_route_gc_elasticity
    Sysctl Check Param Int    net.ipv6.route.gc_elasticity    9
Sysctl_net_ipv6_route_gc_interval
    Sysctl Check Param Int    net.ipv6.route.gc_interval    30
Sysctl_net_ipv6_route_gc_min_interval
    Sysctl Check Param Int    net.ipv6.route.gc_min_interval    0
Sysctl_net_ipv6_route_gc_min_interval_ms
    Sysctl Check Param Int    net.ipv6.route.gc_min_interval_ms    500
Sysctl_net_ipv6_route_gc_thresh
    Sysctl Check Param Int    net.ipv6.route.gc_thresh    1024
Sysctl_net_ipv6_route_gc_timeout
    Sysctl Check Param Int    net.ipv6.route.gc_timeout    60
Sysctl_net_ipv6_route_max_size
    Sysctl Check Param Int    net.ipv6.route.max_size    2147483647
Sysctl_net_ipv6_route_min_adv_mss
    Sysctl Check Param Int    net.ipv6.route.min_adv_mss    1220
Sysctl_net_ipv6_route_mtu_expires
    Sysctl Check Param Int    net.ipv6.route.mtu_expires    600
Sysctl_net_ipv6_route_skip_notify_on_dev_down
    Sysctl Check Param Int    net.ipv6.route.skip_notify_on_dev_down    0
Sysctl_net_ipv6_seg6_flowlabel
    Sysctl Check Param Int    net.ipv6.seg6_flowlabel    0
Sysctl_net_ipv6_xfrm6_gc_thresh
    Sysctl Check Param Int    net.ipv6.xfrm6_gc_thresh    32768
Sysctl_net_mptcp_add_addr_timeout
    Sysctl Check Param Int    net.mptcp.add_addr_timeout    120
Sysctl_net_mptcp_allow_join_initial_addr_port
    Sysctl Check Param Int    net.mptcp.allow_join_initial_addr_port    1
Sysctl_net_mptcp_checksum_enabled
    Sysctl Check Param Int    net.mptcp.checksum_enabled    0
Sysctl_net_mptcp_enabled
    Sysctl Check Param Int    net.mptcp.enabled    1
Sysctl_net_mptcp_pm_type
    Sysctl Check Param Int    net.mptcp.pm_type    0
Sysctl_net_mptcp_stale_loss_cnt
    Sysctl Check Param Int    net.mptcp.stale_loss_cnt    4
Sysctl_net_netfilter_nf_conntrack_acct
    Sysctl Check Param Int    net.netfilter.nf_conntrack_acct    0
Sysctl_net_netfilter_nf_conntrack_buckets
    Sysctl Check Param Int    net.netfilter.nf_conntrack_buckets    65536
Sysctl_net_netfilter_nf_conntrack_checksum
    Sysctl Check Param Int    net.netfilter.nf_conntrack_checksum    1
Sysctl_net_netfilter_nf_conntrack_events
    Sysctl Check Param Int    net.netfilter.nf_conntrack_events    2
Sysctl_net_netfilter_nf_conntrack_expect_max
    Sysctl Check Param Int    net.netfilter.nf_conntrack_expect_max    1024
Sysctl_net_netfilter_nf_conntrack_frag6_high_thresh
    Sysctl Check Param Int    net.netfilter.nf_conntrack_frag6_high_thresh    4194304
Sysctl_net_netfilter_nf_conntrack_frag6_low_thresh
    Sysctl Check Param Int    net.netfilter.nf_conntrack_frag6_low_thresh    3145728
Sysctl_net_netfilter_nf_conntrack_frag6_timeout
    Sysctl Check Param Int    net.netfilter.nf_conntrack_frag6_timeout    60
Sysctl_net_netfilter_nf_conntrack_generic_timeout
    Sysctl Check Param Int    net.netfilter.nf_conntrack_generic_timeout    600
Sysctl_net_netfilter_nf_conntrack_gre_timeout
    Sysctl Check Param Int    net.netfilter.nf_conntrack_gre_timeout    30
Sysctl_net_netfilter_nf_conntrack_gre_timeout_stream
    Sysctl Check Param Int    net.netfilter.nf_conntrack_gre_timeout_stream    180
Sysctl_net_netfilter_nf_conntrack_icmp_timeout
    Sysctl Check Param Int    net.netfilter.nf_conntrack_icmp_timeout    30
Sysctl_net_netfilter_nf_conntrack_icmpv6_timeout
    Sysctl Check Param Int    net.netfilter.nf_conntrack_icmpv6_timeout    30
Sysctl_net_netfilter_nf_conntrack_log_invalid
    Sysctl Check Param Int    net.netfilter.nf_conntrack_log_invalid    0
Sysctl_net_netfilter_nf_conntrack_max
    Sysctl Check Param Int    net.netfilter.nf_conntrack_max    65536
Sysctl_net_netfilter_nf_conntrack_sctp_timeout_closed
    Sysctl Check Param Int    net.netfilter.nf_conntrack_sctp_timeout_closed    10
Sysctl_net_netfilter_nf_conntrack_sctp_timeout_cookie_echoed
    Sysctl Check Param Int    net.netfilter.nf_conntrack_sctp_timeout_cookie_echoed    3
Sysctl_net_netfilter_nf_conntrack_sctp_timeout_cookie_wait
    Sysctl Check Param Int    net.netfilter.nf_conntrack_sctp_timeout_cookie_wait    3
Sysctl_net_netfilter_nf_conntrack_sctp_timeout_established
    Sysctl Check Param Int    net.netfilter.nf_conntrack_sctp_timeout_established    210
Sysctl_net_netfilter_nf_conntrack_sctp_timeout_heartbeat_sent
    Sysctl Check Param Int    net.netfilter.nf_conntrack_sctp_timeout_heartbeat_sent    30
Sysctl_net_netfilter_nf_conntrack_sctp_timeout_shutdown_ack_sent
    Sysctl Check Param Int    net.netfilter.nf_conntrack_sctp_timeout_shutdown_ack_sent    3
Sysctl_net_netfilter_nf_conntrack_sctp_timeout_shutdown_recd
    Sysctl Check Param Int    net.netfilter.nf_conntrack_sctp_timeout_shutdown_recd    3
Sysctl_net_netfilter_nf_conntrack_sctp_timeout_shutdown_sent
    Sysctl Check Param Int    net.netfilter.nf_conntrack_sctp_timeout_shutdown_sent    3
Sysctl_net_netfilter_nf_conntrack_tcp_be_liberal
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_be_liberal    0
Sysctl_net_netfilter_nf_conntrack_tcp_ignore_invalid_rst
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_ignore_invalid_rst    0
Sysctl_net_netfilter_nf_conntrack_tcp_loose
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_loose    1
Sysctl_net_netfilter_nf_conntrack_tcp_max_retrans
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_max_retrans    3
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_close
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_close    10
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_close_wait
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_close_wait    60
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_established
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_established    432000
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_fin_wait
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_fin_wait    120
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_last_ack
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_last_ack    30
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_max_retrans
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_max_retrans    300
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_syn_recv
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_syn_recv    60
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_syn_sent
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_syn_sent    120
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_time_wait
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_time_wait    120
Sysctl_net_netfilter_nf_conntrack_tcp_timeout_unacknowledged
    Sysctl Check Param Int    net.netfilter.nf_conntrack_tcp_timeout_unacknowledged    300
Sysctl_net_netfilter_nf_conntrack_timestamp
    Sysctl Check Param Int    net.netfilter.nf_conntrack_timestamp    0
Sysctl_net_netfilter_nf_conntrack_udp_timeout
    Sysctl Check Param Int    net.netfilter.nf_conntrack_udp_timeout    30
Sysctl_net_netfilter_nf_conntrack_udp_timeout_stream
    Sysctl Check Param Int    net.netfilter.nf_conntrack_udp_timeout_stream    120
Sysctl_net_netfilter_nf_flowtable_tcp_timeout
    Sysctl Check Param Int    net.netfilter.nf_flowtable_tcp_timeout    30
Sysctl_net_netfilter_nf_flowtable_udp_timeout
    Sysctl Check Param Int    net.netfilter.nf_flowtable_udp_timeout    30
Sysctl_net_netfilter_nf_hooks_lwtunnel
    Sysctl Check Param Int    net.netfilter.nf_hooks_lwtunnel    0
Sysctl_net_netfilter_nf_log_0
    Sysctl Check Param Str    net.netfilter.nf_log.0    NONE
Sysctl_net_netfilter_nf_log_1
    Sysctl Check Param Str    net.netfilter.nf_log.1    NONE
Sysctl_net_netfilter_nf_log_10
    Sysctl Check Param Str    net.netfilter.nf_log.10    NONE
Sysctl_net_netfilter_nf_log_2
    Sysctl Check Param Str    net.netfilter.nf_log.2    NONE
Sysctl_net_netfilter_nf_log_3
    Sysctl Check Param Str    net.netfilter.nf_log.3    NONE
Sysctl_net_netfilter_nf_log_4
    Sysctl Check Param Str    net.netfilter.nf_log.4    NONE
Sysctl_net_netfilter_nf_log_5
    Sysctl Check Param Str    net.netfilter.nf_log.5    NONE
Sysctl_net_netfilter_nf_log_6
    Sysctl Check Param Str    net.netfilter.nf_log.6    NONE
Sysctl_net_netfilter_nf_log_7
    Sysctl Check Param Str    net.netfilter.nf_log.7    NONE
Sysctl_net_netfilter_nf_log_8
    Sysctl Check Param Str    net.netfilter.nf_log.8    NONE
Sysctl_net_netfilter_nf_log_9
    Sysctl Check Param Str    net.netfilter.nf_log.9    NONE
Sysctl_net_netfilter_nf_log_all_netns
    Sysctl Check Param Int    net.netfilter.nf_log_all_netns    0
Sysctl_net_nf_conntrack_max
    Sysctl Check Param Int    net.nf_conntrack_max    65536
Sysctl_net_unix_max_dgram_qlen
    Sysctl Check Param Int    net.unix.max_dgram_qlen    512
Sysctl_user_max_fanotify_groups
    Sysctl Check Param Int    user.max_fanotify_groups    128
Sysctl_user_max_fanotify_marks
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1219366
    Sysctl Check Param Int    user.max_fanotify_marks    8192:1048576
Sysctl_user_max_inotify_instances
    Sysctl Check Param Int    user.max_inotify_instances    8192
Sysctl_user_max_inotify_watches
    [Documentation]    Depends of the RAM resources bsc#1183339#c11 bsc#1219366
    Sysctl Check Param Int    user.max_inotify_watches   8192:1048576
Sysctl_vm_admin_reserve_kbytes
    Sysctl Check Param Int    vm.admin_reserve_kbytes    8192
Sysctl_vm_compact_unevictable_allowed
    Sysctl Check Param Int    vm.compact_unevictable_allowed    1
Sysctl_vm_compaction_proactiveness
    Sysctl Check Param Int    vm.compaction_proactiveness    20
Sysctl_vm_dirty_background_bytes
    Sysctl Check Param Int    vm.dirty_background_bytes    0
Sysctl_vm_dirty_background_ratio
    Sysctl Check Param Int    vm.dirty_background_ratio    10
Sysctl_vm_dirty_bytes
    Sysctl Check Param Int    vm.dirty_bytes    0
Sysctl_vm_dirty_expire_centisecs
    Sysctl Check Param Int    vm.dirty_expire_centisecs    3000
Sysctl_vm_dirty_ratio
    Sysctl Check Param Int    vm.dirty_ratio    20
Sysctl_vm_dirty_writeback_centisecs
    Sysctl Check Param Int    vm.dirty_writeback_centisecs    500
Sysctl_vm_dirtytime_expire_seconds
    Sysctl Check Param Int    vm.dirtytime_expire_seconds    43200
Sysctl_vm_extfrag_threshold
    Sysctl Check Param Int    vm.extfrag_threshold    500
Sysctl_vm_hugetlb_optimize_vmemmap
    Sysctl Check Param Int    vm.hugetlb_optimize_vmemmap    0
Sysctl_vm_hugetlb_shm_group
    Sysctl Check Param Int    vm.hugetlb_shm_group    0
Sysctl_vm_laptop_mode
    Sysctl Check Param Int    vm.laptop_mode    0
Sysctl_vm_legacy_va_layout
    Sysctl Check Param Int    vm.legacy_va_layout    0
Sysctl_vm_lowmem_reserve_ratio
    Sysctl Check Param Int    vm.lowmem_reserve_ratio    256 256 32 0 0
Sysctl_vm_max_map_count
    [Documentation]    Increased as per bsc#1214445
    Sysctl Check Param Int    vm.max_map_count    1048576
Sysctl_vm_memory_failure_early_kill
    Sysctl Check Param Int    vm.memory_failure_early_kill    0
Sysctl_vm_memory_failure_recovery
    Sysctl Check Param Int    vm.memory_failure_recovery    1
Sysctl_vm_min_free_kbytes
    Sysctl Check Param Int    vm.min_free_kbytes    45056
Sysctl_vm_min_slab_ratio
    Sysctl Check Param Int    vm.min_slab_ratio    5
Sysctl_vm_min_unmapped_ratio
    Sysctl Check Param Int    vm.min_unmapped_ratio    1
Sysctl_vm_mmap_min_addr
    Sysctl Check Param Int    vm.mmap_min_addr    65536
Sysctl_vm_mmap_rnd_bits
    Sysctl Check Param Int    vm.mmap_rnd_bits    28
Sysctl_vm_mmap_rnd_compat_bits
    Sysctl Check Param Int    vm.mmap_rnd_compat_bits    8
Sysctl_vm_nr_hugepages
    Sysctl Check Param Int    vm.nr_hugepages    0
Sysctl_vm_nr_hugepages_mempolicy
    Sysctl Check Param Int    vm.nr_hugepages_mempolicy    0
Sysctl_vm_nr_overcommit_hugepages
    Sysctl Check Param Int    vm.nr_overcommit_hugepages    0
Sysctl_vm_numa_stat
    Sysctl Check Param Int    vm.numa_stat    1
Sysctl_vm_numa_zonelist_order
    Sysctl Check Param Str    vm.numa_zonelist_order    Node
Sysctl_vm_oom_dump_tasks
    Sysctl Check Param Int    vm.oom_dump_tasks    1
Sysctl_vm_oom_kill_allocating_task
    Sysctl Check Param Int    vm.oom_kill_allocating_task    0
Sysctl_vm_overcommit_kbytes
    Sysctl Check Param Int    vm.overcommit_kbytes    0
Sysctl_vm_overcommit_memory
    Sysctl Check Param Int    vm.overcommit_memory    0
Sysctl_vm_overcommit_ratio
    Sysctl Check Param Int    vm.overcommit_ratio    50
Sysctl_vm_page-cluster
    Sysctl Check Param Int    vm.page-cluster    3
Sysctl_vm_page_lock_unfairness
    Sysctl Check Param Int    vm.page_lock_unfairness    5
Sysctl_vm_panic_on_oom
    Sysctl Check Param Int    vm.panic_on_oom    0
Sysctl_vm_percpu_pagelist_high_fraction
    Sysctl Check Param Int    vm.percpu_pagelist_high_fraction    0
Sysctl_vm_stat_interval
    Sysctl Check Param Int    vm.stat_interval    1
Sysctl_vm_swappiness
    Sysctl Check Param Int    vm.swappiness    60
Sysctl_vm_unprivileged_userfaultfd
    Sysctl Check Param Int    vm.unprivileged_userfaultfd    0
Sysctl_vm_vfs_cache_pressure
    Sysctl Check Param Int    vm.vfs_cache_pressure    100
Sysctl_vm_watermark_boost_factor
    Sysctl Check Param Int    vm.watermark_boost_factor    15000
Sysctl_vm_watermark_scale_factor
    Sysctl Check Param Int    vm.watermark_scale_factor    10
Sysctl_vm_zone_reclaim_mode
    Sysctl Check Param Int    vm.zone_reclaim_mode    0
