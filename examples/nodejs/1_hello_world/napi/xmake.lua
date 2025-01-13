-- luacheck: ignore 113 143
---@diagnostic disable: undefined-global
add_rules("mode.debug", "mode.release")

add_requires("node-api-headers")

target("hello")
do
    add_rules("nodejs.module")
    add_packages("node-api-headers")
    add_files("*.c")
end
