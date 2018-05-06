import os
import platform
import collections


def creation_date(path_to_file):
    if platform.system() == 'Windows':
        return os.path.getctime(path_to_file)
    else:
        stat = os.stat(path_to_file)
        try:
            return stat.st_birthtime
        except AttributeError:
            # We're probably on Linux. No easy way to get creation dates here,
            # so we'll settle for when its content was last modified.
            return stat.st_mtime


mypath = '/home/roland/git/vim'
f = []
for (dirpath, dirnames, filenames) in os.walk(mypath):
    f.extend(filenames)
    break

l = {}
for item in f:
    print(creation_date(item), ': ', item)
    l.update({creation_date(item): item})

ol = collections.OrderedDict(sorted(l.items()))
print(str(f))
print(str(ol))
