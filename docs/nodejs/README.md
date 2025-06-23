# xmake

Xmake is a cross-platform build utility based on Lua. This project package it to
[npmjs.org](https://www.npmjs.com/package/xmake-build-system), which is mainly
used to build nodejs module by xmake.

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
