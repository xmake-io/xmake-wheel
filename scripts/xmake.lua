-- luacheck: ignore 111 113
---@diagnostic disable: undefined-global
option("xmake-platlib")
do
    set_default("/../platlib")
end
option("xmake-scripts")
do
    set_default("/bin")
end
option("xmake-headers")
do
    set_default("/include")
end
option("xmake-data")
do
    set_default("/")
end
option("xmake-metadata")
do
    set_default("/../metadata")
end
option("xmake-null")
do
    set_default("/../null")
end
option("xmake-root")
do
    set_default("{root}")
end
option("xmake-version")
do
    set_default("{version}")
end
option_end()
set_prefixdir("/", {bindir = "bin", libdir = "lib", includedir = "include"})
includes("..")
