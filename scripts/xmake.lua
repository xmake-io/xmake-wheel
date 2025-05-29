-- luacheck: ignore 111 113
---@diagnostic disable: undefined-global
option("bindir")
do
    set_default("/bin")
end
option("datadir")
do
    set_default("/share")
end
option_end()
set_prefixdir("/", {bindir = "bin", libdir = "lib", includedir = "include"})
includes("..")
