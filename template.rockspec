local git_ref = '$git_ref'
local modrev = '$modrev'
local specrev = '$specrev'

local repo_url = 'https://github.com/xmake-io/xmake'

rockspec_format = '3.0'
package = 'xmake'
version = modrev ..'-'.. specrev

description = {
  summary = 'A cross-platform build utility based on Lua',
  detailed = [[xmake is a cross-platform build utility based on Lua. This project package it to
[luarocks.org](https://luarocks.org/modules/Freed-Wu/xmake/), which is mainly
used by [luarocks-build-xmake](https://github.com/xmake-io/luarocks-build-xmake).]],
  labels = { 'c', 'linux', 'c-plus-plus', 'package-manager', 'visual-studio', 'cmake', 'build', 'lua', 'objective-c', 'makefile', 'build-tool', 'wdk', 'xmake', 'tbox', 'cross-toolchains' } ,
  homepage = 'https://xmake.io/',
  license = 'GPL-3.0'
}

dependencies = { 'lua >= 5.1' }

test_dependencies = { }

source = {
  url = repo_url .. '/releases/download/v' .. git_ref .. '/xmake-v' .. git_ref .. '.zip',
  dir = 'xmake-' .. git_ref,
}

if modrev == 'scm' or modrev == 'dev' then
  source = {
    url = repo_url:gsub('https', 'git')
  }
end

build = {
  type = 'command',
  build_command = "./configure --prefix=$(PREFIX) && make",
  install_command = "make install"
}
