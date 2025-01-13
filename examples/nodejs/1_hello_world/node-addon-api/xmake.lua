-- luacheck: ignore 113 143
---@diagnostic disable: undefined-global
add_rules("mode.debug", "mode.release")

add_requires("node-addon-api")

target("hello")
do
    add_rules("nodejs.module")
    add_packages("node-addon-api")
    add_files("*.cc")
end
