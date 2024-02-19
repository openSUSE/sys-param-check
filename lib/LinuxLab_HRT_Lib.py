#!/usr/bin/env python3
#
#
#     Copyright 2020 SAP SE Walldorf
#     Author: Michael Trapp
#
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
##########################################
#
# This library provides a few simple test functions, that can be used in the
# robot framework. Based on 'creating keywords' from the robot framework documentation
# all functions of a library can be used as keywords in robot tests.
#
# e.g.
#   sysctl_check_param_int()
# can be used as
#    Sysctl Check Param Int    fs.file-max    9223372036854775807
#
# In addition to a simple comparison of the result you can check
# the value against a range in several ways.
# For further details see the _split_int_range() function.
#
# A basic set of tests for standalone development + validation is
# available in the '__main__' section of this file.

import sys
import os
import io
import re
import traceback
import subprocess

from robot.api import logger

def trc_info():
    filename, codeline, funcName, text = traceback.extract_stack(None, 2)[0]
    return ("%s:%d" %(filename, codeline))

class LinuxLab_HRT_Lib:

    """
    Robot framework library for SAP LinuxLab HRT tests

    Add functions for simple checks for
    sysctl, systemctl, bash-builtin settings and generic commands.
    """

    def __init__(self, quiet=False):
        self._verbose = 0
        self._log = True

    def _set_verbose(self, b):
        self._verbose = b

    # split val into number(s)
    # based on the val return
    #     val               # for a single value
    #     lowval:highval    # for a range value
    #     val%tolerance     # for a single value with +- tolerance in %
    #                       # 1234%0.1 will check for 1234 +- 0.1%
    #     val-dl+dh         # for a single value with +- tolerance
    #                       # 1234-4+6 will check for 1230:1240
    #     val-dl            # for a single value with - tolerance
    #                       # 1234-4 will check for 1230:1234
    #     val+dl            # for a single value with + tolerance
    #                       # 123464 will check for 1234:1240
    #     None              # for a error
    def _split_int_range(self, val):
        l = None
        h = None

        m = re.match('^(-?\d+):(-?\d+)$',val)
        if  m != None:
            l = int(m.group(1))
            h = int(m.group(2))

            if (self._verbose):
                print('match: [%d, %d] - %s' %(l, h, trc_info()))

            return (l, h)

        m = re.match('^(-?\d+)-(\d*)$',val)
        if  m != None:
            b = int(m.group(1))
            _l = int(m.group(2))
            l = b -_l;
            h = b;

            if (self._verbose):
                print('match: [%d (-%d), %d %d] - %s' %(b, _l, l, h, trc_info()))

            return (l, h)

        m = re.match('^(-?\d+)\+(\d+)$',val)
        if  m != None:
            b = int(m.group(1))
            _h = int(m.group(2))
            l = b;
            h = b + _h;

            if (self._verbose):
                print('match: [%d (+%d), %d %d] - %s' %(b, _h, l, h, trc_info()))

            return (l, h)

        m = re.match('^(-?\d+)-(\d*)\+(\d+)$',val)
        if  m != None:
            b = int(m.group(1))
            _l = int(m.group(2))
            _h = int(m.group(3))
            l = b - _l;
            h = b + _h;

            if (self._verbose):
                print('match: [%d (-%d +%d), %d %d] - %s' %(b, _l, _h, l, h, trc_info()))

            return (l, h)

        m = re.match('^(-?\d+)%(\d*[\.]?\d+)$',val)
        if  m != None:
            b = int(m.group(1))
            v = float(m.group(2))
            l = int(b * (100 - v) / 100)
            h = int(b * (100 + v) / 100)

            if (self._verbose):
                print('match: [%d (+-%f%%), %d %d] - %s' %(b, v, l, h, trc_info()))

            return (l, h)

        m = re.match('^(-?\d+)$',val)
        if  m != None:
            l = int(m.group(1))

            if (self._verbose):
                print('match: [%d] - %s' %(l, trc_info()))

            return (l, h)

        return (l, h)

    # run 'systemctl show --property <param>'
    # and return the output
    # in case of an error raise exception
    def _systemctl_show_get_param(self, param):
        rc = 0

        try:
            output = subprocess.check_output(["systemctl", "show", "--property", param], stderr=subprocess.STDOUT)
        except subprocess.CalledProcessError as e:
            msg = "%d - %s" %(e.returncode, e.output.decode('utf-8').rstrip())
            rc = e.returncode

        if (rc):
            raise AssertionError(msg)

        response = output.decode('utf-8').rstrip()
        if self._verbose:
            print(response)

        return response[len(param) + len('='):]


    # run 'sysctl <param>'
    # and return the output
    # in case of an error raise exception
    def _sysctl_get_param(self, param):
        rc = 0

        try:
            output = subprocess.check_output(["sysctl", param], stderr=subprocess.STDOUT)
        except subprocess.CalledProcessError as e:
            msg = "%d - %s" %(e.returncode, e.output.decode('utf-8').rstrip())
            rc = e.returncode

        if (rc):
            raise AssertionError(msg)

        response = output.decode('utf-8').rstrip()
        if self._verbose:
            print(response)

        return response[len(param) + len(' = '):]

    # parse the str argument for a list of integer values
    # and return the values
    def _sysctl_parse_int(self, str):
        m = re.match('.*=\s+(-?\d+.*)', str)
        if  m == None:
            msg = "regex doesn't match"
            if (self._verbose):
                print("%s - %s" %(msg, trc_info()))
            raise AssertionError(msg)

        values = m.group(1)
        p = re.compile(r'\s+')

        return tuple(int(d) for d in p.split(values))

    def _check_int_value(self, ret_val, check_val):
        lv, hv = self._split_int_range(check_val)

        if (self._verbose):
            _hv = ('None', str(hv))[hv == None]
            print("lv: %d, hv: %s - %s" %(lv, _hv, trc_info()))

        if (hv != None):
            if (self._verbose):
                print("check %d <= %d <= %d" %(lv, ret_val, hv))

            if (not((lv <= ret_val) and (ret_val <= hv))):
                msg = ("invalid value: '%d', expected '%d:%d'" %(ret_val, lv, hv))
                raise AssertionError(msg)

            return

        if (lv != None):
            if (self._verbose):
                print("check %d == %d - %s" %(lv, ret_val, trc_info()))

            if (lv != ret_val):
                msg = ("invalid value: '%d', expected '%d'" %(ret_val, lv))
                raise AssertionError(msg)

            return

        # should not happen
        msg = ("invalid value '%s'" %check_val)
        raise AssertionError(msg)

    # run 'sysctl <param>'
    # check output for int value and compare with 'val'
    #
    # INPUT:
    #   param:  sysctl parameter string like fs.file-max
    #   val:    expected integer value
    # RETURN:
    #   on failure raise exception AssertionError
    def sysctl_check_param_int(self, param, check_val):
        """
        Check a sysctl parameter value(s) for a given integer value(s).

        run sysctl <ARG1>
        check result for integer value(s) <ARG2>

        ARG2 is a list of INT values separated by ' '
        Each INT is a integer value defined in one of the following formats
          <int>         single integer value, e.g. 42
          <int:int>     integer range, e.g. 42:44
          <int%int>     integer range of (base-percent):(base+percent), e.g. 100%3 -> 97:103
          <int-int>     integer range of (base-sub):base, e.g. 100-2 -> 98:100
          <int+int>     integer range of base:(base+add), e.g. 100+4 -> 100:104
          <int-int+int> integer range of (base-sub):(base+add), e.g. 100-2+4 -> 98:104


        Example:
          Sysctl Check Parameter Int    fs.file-max    123456
          Sysctl Check Parameter Int    fs.file-max    100:200
        """

        response = self._sysctl_get_param(param)
        p = re.compile(r'\s+')
        ret_val = tuple(int(d) for d in p.split(response))

        if (self._verbose):
            print("%s - %s" %(check_val, trc_info()))

        chk = tuple(p.split(check_val))

        if (len(ret_val) != len(chk)):
            msg = ("invalid number of values: return values %d, expected %d" %(len(ret_val), len(chk)))
            raise AssertionError(msg)

        if (self._log):
            print('*INFO:* current value: %s' % (response))

        rc = 0
        error_msg = [ 'expected: ' + check_val, 'returned: ' + response ]
        for r, c in zip(ret_val, chk):
            try:
                self._check_int_value(r, c)
            except AssertionError as e:
                error_msg.append("%s" %(e.args))
                rc = -1

        if (rc):
            raise AssertionError("\n".join(error_msg))


    # run 'sysctl <param>'
    # check output for empty value
    def sysctl_check_param_empty(self, param):
        """
        Check a sysctl parameter value for a empty value.

        run sysctl <ARG1>
        check result for empty string

        Example:
        sysctl kernel.domainname -> kernel.domainname =
        """
        response = self._sysctl_get_param(param)

        if (response != ''):
            msg = ("invalid value '%s', expected ''"%(response))
            raise AssertionError(msg)


    # run 'sysctl <param>'
    # and compare the output with the string in 'val'
    # in case of an error raise exception
    def sysctl_check_param_str(self, param, val):
        """
        Match a sysctl parameter value with a string value.

        run sysctl <ARG1>
        match result with string <ARG2>

        Example:
        sysctl kernel.core_pattern -> |/usr/lib/systemd/systemd-coredump %P %u %g %s %t %c %h
        """
        response = self._sysctl_get_param(param)

        if (self._log):
            print("*INFO:* current value: '%s'" % (response))

        if (response != val):
            msg = ("invalid value '%s', expected '%s'" %(response, val))
            raise AssertionError(msg)

    # run 'systemctl show --property <param>'
    # check output for int value and compare with 'val'
    #
    # INPUT:
    #   param:  systemctl parameter string like MemoryHigh
    #   val:    expected integer value
    # RETURN:
    #   on failure raise exception AssertionError
    def systemctl_show_int(self, param, check_val):
        """
        Check a systemctl parameter value for a int.

        run systemctl show --property <ARG1>
        match result with int <ARG2>

        Example:

        systemctl show | grep DefaultLimitCPU -> DefaultLimitCPU=18446744073709551615
        """

        response = self._systemctl_show_get_param(param)
        p = re.compile(r'\s+')
        ret_val = tuple(int(d) for d in p.split(response))

        if (self._verbose):
            print("%s - %s" %(check_val, trc_info()))

        chk = tuple(p.split(check_val))

        if (len(ret_val) != len(chk)):
            msg = ("invalid number of values: return values %d, expected %d" %(len(ret_val), len(chk)))
            raise AssertionError(msg)

        rc = 0
        error_msg = [ 'expected: ' + check_val, 'returned: ' + response ]
        for r, c in zip(ret_val, chk):
            try:
                self._check_int_value(r, c)
            except AssertionError as e:
                error_msg.append("%s" %(e.args))
                rc = -1

        if (rc):
            raise AssertionError("\n".join(error_msg))

    # run 'systemctl show --property <param>'
    # check output for str value and compare with 'val'
    #
    # INPUT:
    #   param:  systemctl parameter string like MemoryHigh
    #   val:    expected string value
    # RETURN:
    #   on failure raise exception AssertionError
    def systemctl_show_str(self, param, val):
        """
        Check a systemctl parameter value for a string.

        run systemctl show --property <ARG1>
        match result with string <ARG2>

        Example:
        systemctl show | grep DefaultMemoryAccounting -> no
        """

        response = self._systemctl_show_get_param(param)
        if (response != val):
            msg = ("invalid value '%s', expected '%s'" %(response, val))
            raise AssertionError(msg)

    # run 'systemctl show --property <param>'
    # check output for str value and compare with 'pattern'
    #
    # INPUT:
    #   param:  systemctl parameter string like MemoryHigh
    #   val:    expected pattern
    # RETURN:
    #   on failure raise exception AssertionError
    def systemctl_show_regex(self, param, pattern):
        """
        Check a systemctl parameter value with a regex.

        run systemctl show --property <ARG1>
        match result with regex <ARG2>

        Example:
        systemctl show --property Environment ->
            LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
        """

        response = self._systemctl_show_get_param(param)
        match = re.match(pattern, response)
        if match != None:
            if (self._verbose):
                print("match: '%s' >>>%s<<<\n" %(pattern, response))
        else:
            msg = ("invalid value '%s', expected regex '%s'" %(response, pattern))
            raise AssertionError(msg)

    # run <cmd> <param>'
    # and return the output
    # in case of an error raise exception
    def _run_cmd(self, cmd):
        rc = 0

        try:
            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
        except subprocess.CalledProcessError as e:
            msg = "%d - %s" %(e.returncode, e.output.decode('utf-8').rstrip())
            rc = e.returncode

        if (rc):
            raise AssertionError(msg)

        response = output.decode('utf-8').rstrip()
        if self._verbose:
            print(response)

        return response

    def _run_cmd_skip(self, cmd, skip_str):
        response = self._run_cmd(cmd)
        return response[len(skip_str):]

    # run <cmd>
    # check output for int value and compare with 'val'
    #
    # INPUT:
    #   cmd:  cmd to run i a shell
    #   skip_str: skip this string from the response
    #   check_val:    expected integer value
    # RETURN:
    #   on failure raise exception AssertionError
    def _run_cmd_int(self, cmd, skip_str, check_val):
        p = re.compile(r'\s+')

        l = tuple(str(d) for d in p.split(cmd))
        response = self._run_cmd_skip(l, skip_str)

        ret_val = tuple(int(d) for d in p.split(response))

        if (self._verbose):
            print("%s - %s" %(check_val, trc_info()))

        chk = tuple(p.split(check_val))

        if (len(ret_val) != len(chk)):
            msg = ("invalid number of values: return values %d, expected %d" %(len(ret_val), len(chk)))
            raise AssertionError(msg)

        rc = 0
        error_msg = [ 'expected: ' + check_val, 'returned: ' + response ]
        for r, c in zip(ret_val, chk):
            try:
                self._check_int_value(r, c)
            except AssertionError as e:
                error_msg.append("%s" %(e.args))
                rc = -1

        if (rc):
            raise AssertionError("\n".join(error_msg))

    def run_cmd_int(self, cmd, val):
        """
        run command <ARG1>
        compare result (int) with <ARG2>
        """
        return self._run_cmd_int(cmd, '', val)

    def run_cmd_int_skip(self, cmd, skip_str, val):
        """
        run command <ARG1>
        skip the string <ARG2> from the result
        compare result (int) with <ARG3>

        Example:
        Run Cmd Int Skip    loginctl show-session -p IdleSinceHint    IdleSinceHint=    0
        """

        return self._run_cmd_int(cmd, skip_str, val)

    # run <cmd>
    # and compare the output with the string in 'val'
    # in case of an error raise exception
    def _run_cmd_str(self, cmd, skip_str, val):
        p = re.compile(r'\s+')

        l = tuple(str(d) for d in p.split(cmd))
        response = self._run_cmd_skip(l, skip_str)

        if (response != val):
            msg = ("invalid value '%s', expected '%s'" %(response, val))
            raise AssertionError(msg)

    def run_cmd_str(self, cmd, val):
        self._run_cmd_str(cmd, '', val)

    def run_cmd_str_skip(self, cmd, skip_str, val):
        self._run_cmd_str(cmd, skip_str, val)

    # run <cmd>
    # check output for empty value
    def _run_cmd_empty(self, cmd, skip_str):
        p = re.compile(r'\s+')

        l = tuple(str(d) for d in p.split(cmd))
        response = self._run_cmd_skip(l, skip_str)

        if (response != ''):
            msg = ("invalid value '%s', expected ''"%(response))
            raise AssertionError(msg)

    def run_cmd_empty(self, cmd):
        self._run_cmd_empty(cmd, '')

    def run_cmd_empty_skip(self, cmd, skip_str):
        self._run_cmd_empty(cmd, skip_str)


    ### ulimit

    #   on failure raise exception AssertionError
    def bash_builtin(self, builtin, check_val):
        cmd = ['/bin/bash', '-c', builtin]

        response = self._run_cmd(cmd)

        if (response != check_val):
            msg = ("invalid value '%s', expected '%s'" %(response, check_val))
            if (self._verbose):
                print(msg)
            raise AssertionError(msg)


    #   on failure raise exception AssertionError
    def bash_builtin_int(self, builtin, check_val):
        cmd = ['/bin/bash', '-c', builtin]

        response = int(self._run_cmd(cmd))

        self._check_int_value(response, check_val)

    #   on failure raise exception AssertionError
    def user_bash_builtin(self, user, builtin, check_val):
        cmd = ['/usr/bin/su', '-s', '/bin/bash', '-c', builtin, user]

        response = self._run_cmd(cmd)

        if (response != check_val):
            msg = ("invalid value '%s', expected '%s'" %(response, check_val))
            if (self._verbose):
                print(msg)
            raise AssertionError(msg)

    #   on failure raise exception AssertionError
    def user_bash_builtin_int(self, user, builtin, check_val):
        cmd = ['/usr/bin/su', '-s', '/bin/bash', '-c', builtin, user]

        response = int(self._run_cmd(cmd))

        self._check_int_value(response, check_val)

    def pcre_grep_file(self, path, pattern, encoding='UTF-8', encoding_errors='strict'):
        """
        Return the lines of the specified file that match ``pattern``.
        But ``pattern`` is not masked with wildcards and processed as standard python regex
        unlike in the Robot 'Grep File' function.
        """
        # don't modify the pattern!
        # pattern = '*%s*' % pattern
        path = path = os.path.normpath(os.path.expanduser(path.replace('/', os.sep)))
        lines = []
        total_lines = 0
        with io.open(path, encoding=encoding, errors=encoding_errors) as f:
            for line in f.readlines():
                total_lines += 1
                line = line.rstrip('\r\n')
                match = re.match(pattern, line)
                if match != None:
                    lines.append(line)
                    if (self._verbose):
                        print("match: '%s' >>>%s<<<\n" %(pattern, line))

            result = '\n'.join(lines)
            if (self._verbose):
                print("result: '%s' >>>%s<<<\n" %(pattern, result))
            return result

# You can run LinuxLab_HRT_Lib.py to execute the following tests on the previously defined functions,
# basically a simple testsuite for development.
#
if __name__ == '__main__':
    # fs_file_max = 6564992
    fs_file_max = 9223372036854775807

    def check_sysclt_int(verbose, param, *check_val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.sysctl_check_param_int(param, ' '.join(map(str, check_val)))
        except AssertionError as e:
            return False
        return True

    def check_sysclt_empty(verbose, param):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.sysctl_check_param_empty(param)
        except AssertionError as e:
            return False
        return True

    def check_sysclt_str(verbose, param, val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.sysctl_check_param_str(param, val)
        except AssertionError as e:
            return False
        return True

    def check_split_int_range(ret, val):
        o = LinuxLab_HRT_Lib()

        if (ret == o._split_int_range(val)):
            return True

        return False

    def check_int_value(ret, val):
        o = LinuxLab_HRT_Lib()

        try:
            o._check_int_value(ret, val)
        except AssertionError as e:
            return False
        return True

    def check_bash_builtin(verbose, cmd, val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.bash_builtin(cmd, val)
        except AssertionError as e:
            return False
        return True

    def check_bash_builtin_int(verbose, cmd, val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.bash_builtin_int(cmd, val)
        except AssertionError as e:
            return False
        return True

    def check_user_bash_builtin(verbose, user, cmd, val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.user_bash_builtin(user, cmd, val)
        except AssertionError as e:
            return False
        return True

    def check_user_bash_builtin_int(verbose, user, cmd, val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.user_bash_builtin_int(user, cmd, val)
        except AssertionError as e:
            return False
        return True

    def check_pcre_grep_file(verbose, test_file, pattern, result):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        found = o.pcre_grep_file(test_file, pattern)
        if (found == result):
            return True
        return False

    def check_cmd_int_skip(verbose, cmd, skip_str, *check_val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.run_cmd_int_skip(cmd, skip_str, ' '.join(map(str, check_val)))
        except AssertionError as e:
            return False
        return True

    def check_cmd_str(verbose, cmd, val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.run_cmd_str(cmd, val)
        except AssertionError as e:
            return False
        return True

    def check_cmd_str_skip(verbose, cmd, skip_str, val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.run_cmd_str_skip(cmd, skip_str, val)
        except AssertionError as e:
            return False
        return True

    def check_cmd_empty_skip(verbose, cmd, skip_str):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.run_cmd_empty_skip(cmd, skip_str)
        except AssertionError as e:
            return False
        return True

    def check_cmd_empty(verbose, cmd):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.run_cmd_empty(cmd, '')
        except AssertionError as e:
            return False
        return True

    def check_systemctl_show_int(verbose, param, *check_val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.systemctl_show_int(param, ' '.join(map(str, check_val)))
        except AssertionError as e:
            return False
        return True

    def check_systemctl_show_str(verbose, param, *check_val):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.systemctl_show_str(param, ' '.join(map(str, check_val)))
        except AssertionError as e:
            return False
        return True

    def check_systemctl_show_regex(verbose, param, *pattern):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            o.systemctl_show_regex(param, ' '.join(map(str, pattern)))
        except AssertionError as e:
            return False
        return True

    def get_sysctl_param(verbose, param):
        o = LinuxLab_HRT_Lib()
        if verbose:
            o._set_verbose(True)

        try:
            ret = o._sysctl_get_param(param)
        except AssertionError as e:
            return False
        return ret

    v = False
    assert True  == check_split_int_range((1, 2), '1:2')
    assert True  == check_split_int_range((None, None), 'invalid')
    assert True  == check_split_int_range((1, None), '1')
    assert True  == check_split_int_range((1, 2), '1:2')
    assert True  == check_split_int_range((-1, 102), '-1:102')
    assert True  == check_split_int_range((98, 102), '98:102')
    assert True  == check_split_int_range((98, 102), '100%2')
    assert True  == check_split_int_range((98, 100), '100-2')
    assert True  == check_split_int_range((100, 102), '100+2')
    assert True  == check_split_int_range((98, 102), '100-2+2')

    assert True   == check_int_value(100, '100')
    assert True   == check_int_value(99,  '99:100')
    assert True   == check_int_value(100, '99:100')
    assert False  == check_int_value(98,  '99:100')
    assert False  == check_int_value(101, '99:100')

    assert True  == check_systemctl_show_int(v, 'DefaultLimitCPU', 18446744073709551615)
    assert True  == check_systemctl_show_str(v, 'DefaultCPUAccounting', 'no')
    assert True  == check_systemctl_show_regex(v, 'Environment', 'LANG=.* PATH=\S+')

    assert True  == check_sysclt_int(v, 'fs.file-max', fs_file_max)
    assert False == check_sysclt_int(v, 'fs.file-max', fs_file_max + 1)
    assert False == check_sysclt_int(v, 'fs.file-max', fs_file_max - 1)
    assert False == check_sysclt_int(v, 'fs.file-max_does_not_exist', 123)
    assert False == check_sysclt_int(v, 'fs.file-max', 123)
    assert True  == check_sysclt_int(v, 'kernel.msg_next_id', -1)
    assert True  == check_sysclt_int(v, 'net.ipv4.udp_mem', 1538310, '2051082:2051083', 3076620)

    assert False == check_sysclt_str(v, 'kernel.core_pattern', "...")
    assert False == check_sysclt_str(v, 'kernel.core_pattern_does_not_exist', "...")
    assert True  == check_sysclt_str(v, 'kernel.core_pattern', "|/usr/lib/systemd/systemd-coredump %P %u %g %s %t %c %h")

    assert True  == check_sysclt_empty(v, 'kernel.domainname')

    assert False == check_bash_builtin(v, 'Xlimit -c', 'unlimited')
    assert False == check_bash_builtin(v, 'ulimit -c', '1234')
    assert True  == check_bash_builtin(v, 'ulimit -c', 'unlimited')
    assert True  == check_bash_builtin(v, 'ulimit -d', 'unlimited')
    assert True  == check_bash_builtin(v, 'ulimit -e', '0')
    assert True  == check_bash_builtin(v, 'ulimit -f', 'unlimited')
    assert True  == check_bash_builtin(v, 'ulimit -m', 'unlimited')
    assert True  == check_bash_builtin(v, 'ulimit -n', '1024')
    assert True  == check_bash_builtin_int(v, 'ulimit -n', '1023:1024')
    assert True  == check_bash_builtin_int(v, 'ulimit -n', '1024%0.2')

    assert True  == check_user_bash_builtin_int(v, 'robot', 'ulimit -n', '4096')
    assert True  == check_user_bash_builtin(v, 'robot', 'ulimit -c', 'unlimited')

    assert True  == check_pcre_grep_file(v, __file__, '^NOT FOUND ...', '')
    assert True  == check_pcre_grep_file(v, __file__, '^ PRETTY_NAME=.*', '')
    assert True  == check_pcre_grep_file(v, __file__, '^PRETTY_NAME=.*', 'PRETTY_NAME=abc')
    assert True  == check_pcre_grep_file(v, __file__, '.*EOL$', '    check EOL')


    assert True  == check_cmd_int_skip(v, '/usr/bin/loginctl show-session -p IdleSinceHint', 'IdleSinceHint=', 0)
    assert False  == check_cmd_int_skip(v, '/usr/bin/loginctl show-session -p IdleSinceHint', 'IdleSinceHint=', 1)
    assert True  == check_cmd_str_skip(v, '/usr/bin/loginctl show-user -p EnableWallMessages', 'EnableWallMessages=', 'no')
    assert False  == check_cmd_str_skip(v, '/usr/bin/loginctl show-user -p EnableWallMessages', 'EnableWallMessages=', 'No')
    assert True  == check_cmd_str(v, '/usr/bin/loginctl show-user -p EnableWallMessages', 'EnableWallMessages=no')
    assert True  == check_cmd_empty_skip(v, '/usr/bin/loginctl show-user -p KillOnlyUsers', 'KillOnlyUsers=')
    assert False  == check_cmd_empty_skip(v, '/usr/bin/loginctl show-user -p KillOnlyUsers', 'KillOnlyUsers')
