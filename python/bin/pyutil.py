#!/usr/bin/env python3
# Standalone functions

import sys
import os
import datetime
import re
import urllib.parse


def git_update(git_dir):
    if not os.path.isdir(git_dir):
        # exit if git_dir not exists
        print(git_dir, 'not exists')
        sys.exit()
    else:
        # update git repo
        os.system('cd "{}" && git pull'.format(git_dir))


def git_commit(git_dir, add_files, with_message, show_changes=True):
    files = '" "'.join(add_files)
    os.system('cd "{}" && git add "{}" && git commit -m "{}"'.format(git_dir, files, with_message))
    if show_changes:
        os.system('cd "{}" && git diff HEAD^ HEAD'.format(git_dir))


def git_insert(git_dir, filename, header, at_line_no, entry, commit_message, update_repo=False):
    # update
    if update_repo:
        git_update(git_dir)
    # new file if needed
    ensure_file(filename, header)
    # insert entry
    insert_into(filename, at_line_no, entry)
    # commit
    git_commit(git_dir, [filename], commit_message)


def ensure_file(filename, content_on_create=''):
    if not os.path.isfile(filename):
        with open(filename, 'w') as f:
            f.write(content_on_create)


def insert_into(filename, at_line_no, with_content):
    lines = open(filename).readlines()
    with open(filename, 'w') as f:
        f.writelines(lines[:at_line_no])
        f.write(with_content)
        f.writelines(lines[at_line_no:])


def get_datetime(with_format='%Y-%m-%d %H:%M:%S %z', via='system'):
    if via == 'python':
        # For a naive object, the %z and %Z format codes are replaced by empty strings.
        return datetime.datetime.now().strftime(with_format)
    elif via == 'system':
        return os.popen('date "+{}"'.format(with_format)).read().strip()
    else:
        raise NotImplementedError("via='{}'".format(via))


def grep(pattern, files):
    return os.popen('grep -niF {} {}'.format(pattern, files)).read().strip()


def decompose_markdown_link(markdown_link):
    regex_markdown_link = r'\[(.*)\]\((.*)\)'
    match = re.search(regex_markdown_link, markdown_link)
    if match:
        title = match.group(1)
        url = match.group(2)
        return title, url


def url_remove_scheme(url):
    components = urllib.parse.urlparse(url)
    scheme = '{}://'.format(components.scheme)
    url_without_scheme = url[len(scheme):]
    if url_without_scheme.startswith('www.'):
        return url_without_scheme[len('www.'):]
    return url_without_scheme
