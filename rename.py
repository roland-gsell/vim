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


mypath = '/home/roland/git/rename'
files = []
for (dirpath, dirnames, filenames) in os.walk(mypath):
    files.extend(filenames)
    break

filelist = {}
for item in files:
    item = mypath + os.sep + item
    print(creation_date(item), ': ', item)
    filelist.update({creation_date(item): item})

ordered_filelist = collections.OrderedDict(sorted(filelist.items()))
print(str(files))
print(str(ordered_filelist))
