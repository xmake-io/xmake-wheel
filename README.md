# xmake packages for some package managers

## [PYPI](https://pypi.org/project/xmake-wheel)

WIP

different other languages, python build system is consist of two parts:

### Frontends

- [build](http://pypi.org/project/build/): `python -m build`
- [uv](https://pypi.org/project/uv/): `uv build`

In charge of:

- install `build-system.requires`
- call `build-system.build-backend`'s `build_wheel()` and `build_sdist()`.

`pyproject.toml`:

```toml
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
```

### Backends

Refer
[some python build system backends](https://scikit-build-core.readthedocs.io/en/latest/#other-projects-for-building)

Backend can install optional requires. For example,
[scikit-build-core](https://pypi.org/project/scikit-build-core/)
will install [cmake](http://pypi.org/project/cmake) and [ninja](https://pypi.org/project/ninja/)
only when cmake and ninja are not found in `$PATH`.

We project to provide two python packages. One is a wheel for xmake, like cmake
and ninja. Another is a python build system backend, which will install xmake
wheel when xmake is not found in `$PATH`.

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

- [coc-rime](https://github.com/tonyfettes/coc-rime)

## [luarocks.org](https://luarocks.org/modules/Freed-Wu/xmake/)

Refer [luarocks-build-xmake](https://github.com/xmake-io/luarocks-build-xmake).

Notice luarocks.org doesn't host
[binary rock files](https://github.com/luarocks/luarocks/wiki/Hosting-binary-rocks).
so if you add `xmake` to `build-dependencies`, you still have to tolerate
troublesome of building xmake.
