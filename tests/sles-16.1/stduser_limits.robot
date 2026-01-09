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
#     Author: Richard Fan
##########################################
*** Settings ***
Library    Process
Library    OperatingSystem
Library    ../../lib/LinuxLab_HRT_Lib.py
Documentation    Create a unprivileged standard user and check his limits

*** Test Cases ***
User_add_stduser
    ${result} =    Run Process    /usr/sbin/useradd    stduser
    Should Be Equal As Integers    ${result.rc}    0

Limit_core_file_size
    User Bash Builtin    stduser    ulimit -c    unlimited

Limit_data_seg_size
    User Bash Builtin    stduser    ulimit -d    unlimited

Limit_scheduling_priority
    User Bash Builtin Int    stduser    ulimit -e    0

Limit_file_size
    User Bash Builtin    stduser    ulimit -f    unlimited

Limit_pending_signals
    [Documentation]    Depends of the RAM resources
    Bash Builtin Int    ulimit -i    7000:8000

Limit_max_locked_memory
    User Bash Builtin Int    stduser    ulimit -l    8192

Limit_max_memory_size
    User Bash Builtin    stduser    ulimit -m    unlimited

Limit_open_files
    User Bash Builtin Int    stduser    ulimit -n    1024

Limit_pipe_size
    User Bash Builtin Int    stduser    ulimit -p    8

Limit_POSIX_message_queues
    User Bash Builtin Int    stduser    ulimit -q    819200

Limit_real-time_priority
    User Bash Builtin Int    stduser    ulimit -r    0

Limit_stack_size
    User Bash Builtin Int    stduser    ulimit -s    8192

Limit_cpu_time
    User Bash Builtin    stduser    ulimit -t    unlimited

Limit_max_user_processes
    [Tags]    FIXED
    [Documentation]    Depends of the RAM resources
    Bash Builtin Int    ulimit -u    7000:8000

Limit_virtual_memory
    User Bash Builtin    stduser    ulimit -v    unlimited

Limit_file_locks
    User Bash Builtin    stduser    ulimit -x    unlimited
