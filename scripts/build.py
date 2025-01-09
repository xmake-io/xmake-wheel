#!/usr/bin/env python
r"""Build
=========

`<https://discuss.python.org/t/custom-build-steps-moving-bokeh-off-setup-py/16128/3>_`
"""

import os
import subprocess
import tarfile
import urllib.request
from contextlib import suppress

try:
    import tomllib
except ImportError:
    import tomli as tomllib  # type: ignore


def main():
    r"""Build project"""
    with open("pyproject.toml", "rb") as f:
        data = tomllib.load(f)
    version = data["project"]["version"]
    cwd = f"xmake-{version}"
    if not os.path.isdir(cwd):
        file = urllib.request.urlopen(
            f"https://github.com/xmake-io/xmake/releases/download/v{version}/xmake-v{version}.tar.gz"
        )
        with open("xmake.tar.gz", "wb") as output:
            output.write(file.read())
        with tarfile.open("xmake.tar.gz") as f:
            f.extractall(filter="data")

    if not os.path.isfile(f"{cwd}/makefile"):
        subprocess.run(["./configure", "--prefix=../usr"], cwd=cwd)
    if not os.path.isfile(f"{cwd}/build/xmake"):
        subprocess.run("make", cwd=cwd)
    if not os.path.isfile("usr/bin/xmake"):
        subprocess.run(["make", "install"], cwd=cwd)


with suppress(ImportError):
    from hatchling.builders.hooks.plugin.interface import BuildHookInterface

    class CustomHook(BuildHookInterface):
        def initialize(self, version, build_data) -> None:
            main()


if __name__ == "__main__":
    main()
