# xmake packages for some package managers

## [PYPI](https://pypi.org/project/xmake-wheel)

Currently, the methods to build a python wheel containing C/C++ code are as
following:

- [distutils](http://pypi.org/project/distutils/): A simple C/C++ build system
  written in pure python. Before python 3.13, it is one of python standard
  libraries. Slow.
  - [setuptools](http://pypi.org/project/setuptools/): default python build
    system, which can use distutils to build python/C mixed project.
- [scons](https://pypi.org/project/SCons/): A C/C++ build system written in pure
  python. It is very slow. So Evan Martin, the maintainer of google chrome, has
  to create ninja and
  [switch](https://neugierig.org/software/chromium/notes/2011/02/ninja.html)
  chrome's build system to ninja.
  - [enscons](https://pypi.org/project/enscons/): A python build system based
    on scons. Advantage: no extra dependency except python.
- [cmake](https://pypi.org/project/cmake/): A classic C/C++ build system. A
  standard in fact while bad-designed syntax.
  [scikit-build](https://github.com/scikit-build/) organization package it to
  PYPI to let python developer enjoy it. cmake in PYPI uses
  [ninja](https://pypi.org/project/ninja/) as its backend, which is also
  packaged by scikit-build organization. That means that python, cmake, ninja is
  needed. Although the latter two will be installed from PYPI.
  - [scikit-build](https://pypi.org/project/scikit-build/): first python build
    system based on cmake developed by scikit-build organization. Replaced by
    scikit-build-core.
  - [scikit-build-core](https://pypi.org/project/scikit-build-core/):
    scikit-build organization recommends it.
  - [cmeel](https://pypi.org/project/cmeel/): Another wheel.
  - [py-build-cmake](https://pypi.org/project/py-build-cmake/): Another wheel
    forked from [flit](https://pypi.org/project/flit/).
- [meson](https://pypi.org/project/meson/): A C/C++ build system written in pure
  python. However, it uses ninja as its backend.
  - [meson-python](https://pypi.org/project/meson-python/): A python build
    system based on meson.

Except slow distutils/scons, both cmake and meson use ninja as their backend. So
if a python developer want to build a python/C mixed project in high speed,
ninja is the only one choice. We hope xmake can be another choice -- it
should be as fast as ninja, as easy as meson, as powerful as cmake.

- [xmake](https://pypi.org/project/xmake-wheel): this project!
  - [xmake-python](https://pypi.org/project/xmake-python/): A python build system
    based on xmake.

```sh
pip install xmake-wheel
xmake --help
```

Currently, we only support:

- windows on amd64
- macos on arm64
- linux on every platforms

If you want to contribute for any unsupported platforms, such as windows on
arm64, open a new PR without hesitate!

```python
from xmake import main

main("--help")
```

### Python Wheels

List some related wheels which provide binary programs.

#### Build Systems

- [cmake-python-distributions](https://github.com/scikit-build/cmake-python-distributions)
- [ninja-python-distributions](https://github.com/scikit-build/ninja-python-distributions)

#### Linters

- [cppcheck-wheel](https://github.com/msclock/cppcheck-wheel)

#### Formatters

- [astyle-wheel](https://github.com/Freed-Wu/astyle-wheel)
- [clang-format-wheel](https://github.com/ssciwr/clang-format-wheel)

#### Misc

- [patchelf-pypi](https://github.com/mayeut/patchelf-pypi): used by
  [cibuildwheel](https://github.com/pypa/cibuildwheel)
- [nodejs-wheel](https://pypi.org/project/nodejs-wheel)

## [npmjs.org](https://www.npmjs.com/package/xmake-build-system)

We publish xmake to npm for convenience of building nodejs module by xmake.

Compared to other solutions:

- [node-gyp](https://github.com/nodejs/node-gyp): builtin build system of
  nodejs. However, it depends on python, which is too large. and gyp doesn't
  [support Cygwin/Msys2/MinGW](https://github.com/nodejs/node-gyp/issues/1240)
  until now, which means you cannot build nodejs module for
  [mingw-w64-nodejs](https://packages.msys2.org/base/mingw-w64-nodejs).
- [cmake-js](https://github.com/cmake-js/cmake-js): CMake have a good ecosystem.
  even for nodejs module. However, it needs
  [extra settings](https://github.com/napi-bindings/node-api-stub/) to
  [build nodejs module for mingw-w64-nodejs](https://github.com/nodejs/node-addon-api/issues/1021).
- [zig-build](https://github.com/solarwinds/zig-build): a new build system for
  nodejs module. It uses `zig cc` as compiler, not your OS's. notice its
  [caveats](https://github.com/solarwinds/zig-build#caveats).

examples:

- [1_hello_world](examples/nodejs/1_hello_world): use this project to replace
  [node-gyp](https://github.com/nodejs/node-gyp)
- [coc-rime](https://github.com/tonyfettes/coc-rime): use
  [pkg-prebuilds](https://github.com/julusian/pkg-prebuilds) to replace
  [prebuildify](https://github.com/prebuild/prebuildify)

## [luarocks.org](https://luarocks.org/modules/Freed-Wu/xmake/)

Refer [luarocks-build-xmake](https://github.com/xmake-io/luarocks-build-xmake).

Notice luarocks.org doesn't host
[binary rock files](https://github.com/luarocks/luarocks/wiki/Hosting-binary-rocks).
so if you add `xmake` to `build-dependencies`, you still have to tolerate
troublesome of building xmake.
