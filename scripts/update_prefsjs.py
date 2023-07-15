from os import path, walk

HOME_DIR = path.expanduser("~") + "/"


def update_prefsjs(path: str):
    with open(path, "a", encoding="utf8") as fa:
        with open(HOME_DIR + "dotfiles/browser/prefs.js", "r", encoding="utf8") as fr:
            for line in fr.readlines():
                fa.write(line)


def recursive_search(pth):
    for (dirpath, dirnames, filenames) in walk(pth):
        if "prefs.js" in filenames:
            update_prefsjs(dirpath + "/prefs.js")
        for dirname in dirnames:
            recursive_search(dirname)


if __name__ == "__main__":
    recursive_search(HOME_DIR + ".firedragon")
