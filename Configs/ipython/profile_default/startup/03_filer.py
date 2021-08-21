#!/usr/bin/env python3
from datetime import date

def get_dossier_paths(at: str='HOME', code: int=0, path_type: int=0, escape_res=False) -> list:
    # code_0 - ongoing dossiers (main)
    # code_1 - archive and hold dossiers
    # code_2 - held dossiers
    # code_3 - ongoing dossiers' archive
    # code_4 - archived, complete dossiers.

    # path_type_0 - path
    # path_type_1 - name
    # path_type_2 - aspect

    if path_type == 1:
        return [path.split('/')[-1] for path in get_dossier_paths(at, code, 0)]
    if path_type == 2:
        return [path.split('/')[-2] for path in get_dossier_paths(at, code, 0)]


    working_directory = escape(var(at))
    if 1 <= code <= 4:
            working_directory += '/' + escape(var('ARCHIVES'))

    dirs_string = ' '.join(get_aspect_paths(at))
    options_string=dirs_string + ' -mindepth 1 -maxdepth 1 -type d -not -name ".*"'
    res = find(options=options_string, escape_res=escape_res)

    separator = '|'
    if escape_res:
        separator = '\\|'

    if code == 2:
        return [path for path in res if path.split(separator)[0].endswith('-')]
    if code == 3:
        return [path for path in res if path.split(separator)[0].endswith('+')]
    if code == 4:
        return [path for path in res if not path.split(separator)[0].endswith('-') and not path.split(separator)[0].endswith('+')]
    return res



def get_aspect_paths(at='HOME', archive=False):
    working_directory = escape(var(at))
    if archive:
            working_directory += '/' + escape(var('ARCHIVES'))
    return find(options=working_directory + ' -mindepth 1 -maxdepth 1 -not -name ".*" -and -not -name "snap" -and -not -name "Projects" -and -not -name "Code-*"')


def get_aspect_filenames(at='HOME'):
    return [path.split('/')[3] for path in get_aspect_paths(at)]

def get_aspect_codes(at='HOME'):
    return [name.split('(')[1][:-1] for name in get_aspect_filenames(at)]

def get_aspect_colors(at='HOME'):
    return [name.split(' (')[0].split('-')[1] for name in get_aspect_filenames(at)]

def path_of_dossier(dossier_name):
    return get_dossier_paths()[get_dossier_names().index(dossier_name)]

def get_archive_start(archived_dossier):
    return archived_dossier.split('/')[-1].split('|')[0].split('-')[0][:4]

def get_archive_end(archived_dossier):
    if archived_dossier.split('|')[0][-1] == '+':
            return -1
    if archived_dossier.split('|')[0][-1] == '-': # if frozen return freezing year
            return archived_dossier.split('/')[-1].split('|')[0].split('-')[-2][:4]
    return archived_dossier.split('/')[-1].split('|')[0].split('-')[-1][:4]

def get_aspect(aspect_path):
    return aspect_path.split('/')[-1].split(' ')[0].split('-')[1]

def new_dossier(code, aspect_color):
    aspect_path = get_aspect_paths()[get_aspect_colors().index(aspect_color.capitalize())]
    aspect_drive_path = get_aspect_paths(at='DRIVE')[get_aspect_colors().index(aspect_color.capitalize())]
    aspect_archive_path = get_aspect_paths(archive=True)[get_aspect_colors().index(aspect_color.capitalize())]

    project_path = aspect_path + '/' + code.upper()
    drive_project_path = aspect_drive_path + '/' + code.upper()
    archive_path = aspect_archive_path + '/' + str(date.today().year) + '+|' + code.upper()


    # Make the dossier and dossier archive directories
    mkdir(escape(project_path))
    mkdir(escape(archive_path))
    mkdir(escape(drive_project_path))
    symlink(escape(project_path), escape(var('HOME') + '/Projects')) # Create dossier symlink in ~/Projects
    symlink(escape(archive_path), escape(var("HOME") + "/" + var("ARCHIVES") + "/" + code + "+")) # Make archive symlink in ~/$ARCHIVES/Projects

    # Create the statement file from the lyx template
    statement_template = var('TEMPLATE') + '/' + dossier_type + ' Statement.lyx'

    # Write statement file
    os.system('cat ' + escape(statement_template) + ' > ' + escape(project_path + '/Statement.lyx'))

    # Write the current date into the new statement file
    os.system('sed -i "s/MONTH ##th, yyyy/' + date.today().strftime('%B %d' + ordinal_suffix() + ', %Y') + '/g" ' + escape(project_path + '/Statement.lyx'))

def ordinal_suffix(date=date.today()):
    day_num =  date.day
    if 10 < day_num < 20:
        return 'th'

    day_num = day_num % 10
    if day_num == 1:
        return 'st'
    elif day_num == 2:
        return 'nd'
    elif day_num == 3:
        return 'rd'
    else:
        return 'th'

def convert_pathtype(path, to_type):
    if path.startswith(var('HOME')):
        given_type = 0
    # Project folders are always all capitalized
    elif path.upper() == path:
        given_type = 1
    else:
        given_type = 2

    return get_dossier_paths(path_type=to_type)[get_dossier_paths(path_type=given_type).index(path)]

def extension(path):
    return path.split(".")[-1]


def ordinal_suffix(date=date.today()):
    day_num =  date.day
    if 10 < day_num < 20:
        return 'th'

    day_num = day_num % 10
    if day_num == 1:
        return 'st'
    elif day_num == 2:
        return 'nd'
    elif day_num == 3:
        return 'rd'
    else:
        return 'th'

def convert_pathtype(path, to_type):
    if path.startswith(var('HOME')):
        given_type = 0
    # Project folders are always all capitalized
    elif path.upper() == path:
        given_type = 1
    else:
        given_type = 2

    return get_dossier_paths(path_type=to_type)[get_dossier_paths(path_type=given_type).index(path)]

def extension(path):
    return path.split(".")[-1]



def ordinal_suffix(date=date.today()):

    day_num =  date.day
    if 10 < day_num < 20:
        return 'th'

    day_num = day_num % 10
    if day_num == 1:
        return 'st'
    elif day_num == 2:
        return 'nd'
    elif day_num == 3:
        return 'rd'
    else:
        return 'th'

def convert_pathtype(path, to_type):
    if path.startswith(var('HOME')):
        given_type = 0
    # Project folders are always all capitalized
    elif path.upper() == path:
        given_type = 1
    else:
        given_type = 2

    return get_dossier_paths(path_type=to_type)[get_dossier_paths(path_type=given_type).index(path)]

def extension(path):
    return path.split(".")[-1]


if __name__ == '__main__':
    TEST = False
    if TEST:
        os.chdir(var('TMP'))
        mkdir('test_py_project')
        os.chdir('test_py_project')
