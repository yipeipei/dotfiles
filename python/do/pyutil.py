#!/usr/bin/env python3
# Standalone functions

def git_update_dir(git_dir):
    if not os.path.isdir(git_dir):
        # exit if git_dir not exists
        print(git_dir, 'not exists')
        sys.exit()
    else:
        # update git repo
        os.system('cd {} && git pull'.format(git_dir))


def ensure_file(filename, content=''):
    if not os.path.isfile(filename):
        with open(filename, 'w') as f:
            f.write(content)


def get_datetime(format='%Y-%m-%d %H:%M:%S %z', via='system'):
    if via == 'python':
        # For a naive object, the %z and %Z format codes are replaced by empty strings.
        return datetime.datetime.now().strftime(format)
    elif via == 'system':
        return os.popen('date "+{}"'.format(format)).read().strip()
    else:
        raise NotImplementedError("via='{}'".format(via))
