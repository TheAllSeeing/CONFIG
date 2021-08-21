import subprocess as sp
import os

def var(name):
    return os.environ[name]


def escape(path):
    if type(path) == list:
        return [escape(string) for string in path]
    return path.replace(' ', '\ ').replace('&', '\&').replace('(','\(').replace(')', '\)').replace('|', '\|').replace('[', '\[').replace(']', '\]').replace('{', '\{').replace('}', '\}').replace('$', '\$').replace("'", "\'").replace('"', '\"')


def _wrap_command_with_output(command: str, default_options='', seperator=None) -> callable:
    def res(options=default_options, sudo=False, escape_res=False):
        _command = command
        if sudo:
            _command = SUDO_COMMAND + ' ' + _command
        _command += ' ' + options
        output = str(sp.check_output(_command, shell=True))[2:-3]
        if escape_res:
            output = escape(output)
        if seperator != None:
            return  output.split(seperator)
        return output

    return res

def _wrap_run_with_one_parameter(command: str, default_options='') -> callable:
    def res(targets, options=default_options, sudo=False):
        _command = command
        if sudo:
            _command = SUDO_COMMAND + ' ' + command
        _command = _command + ' ' + options
        if type(targets) == str:
            return os.system(_command + ' ' + targets)
        else:
            return [res(target, options, sudo) for target in targets]
            
    return res

def _wrap_run_with_two_parameters(command: str, default_options: str='') -> callable:
    def res(targets, destinations, options=default_options, sudo=False):
        _command = command
        if sudo:
            _command = SUDO_COMMAND + ' ' + command
        _command += ' ' + options
        if type(targets) == str:
            return os.system(_command + ' ' + targets + ' ' + destinations)
        else:
            return [res(target, dest, options, sudo) for target, dest in zip(targets, destinations)]
    return res

mkdir = _wrap_run_with_one_parameter('mkdir')
remove = _wrap_run_with_one_parameter('rm')
trash = _wrap_run_with_one_parameter('rmtrash')
touch = _wrap_run_with_one_parameter('touch')
wget = _wrap_run_with_one_parameter('wget')
launch = _wrap_run_with_one_parameter(OPEN_COMMAND)
lyxpdf = _wrap_run_with_one_parameter('lyx -e pdf')
lyxlatex = _wrap_run_with_one_parameter('lyx -e latex')
symlink = _wrap_run_with_two_parameters('ln -s')
hardlink = _wrap_run_with_two_parameters('ln')
move = _wrap_run_with_two_parameters('mv')
copy = _wrap_run_with_two_parameters('cp')
find = _wrap_command_with_output('find', seperator='\\n')
locate = _wrap_command_with_output('locate', seperator='\\n')
ls = _wrap_command_with_output('ls', seperator='\\n')
exa = _wrap_command_with_output('exa', default_options='-I "wpilib|Shuffleboard|snap"', seperator='\\n')
cat = _wrap_command_with_output('cat', seperator='\\n')
xpaste = _wrap_command_with_output('xclip -sel clip -o')


def okular(files, tabs=True):
    if type(files) == str:
        return os.system('okular ' + files + ' &')
    elif type(files) == list:
        if tabs:
            return os.system('okular ' + ' '.join(files) + ' 2>/dev/null &')
        else:
            return [okular(path) for path in files]

def xcopy(text: str):
    os.system(f'echo {escape(text)} | xclip -sel clip')

if __name__ == '__main__':
    TEST = False
    if TEST:
        os.chdir(var('TMP'))
        mkdir('test_py_project') 
        os.chdir('test_py_project')
