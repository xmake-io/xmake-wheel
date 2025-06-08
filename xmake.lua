-- luacheck: ignore 111 113 143
---@diagnostic disable: undefined-global, undefined-field
includes("packages/x/xmake")
add_requires("xmake", { system = false })

target("phony")
do
    set_kind("phony")
    add_packages("xmake")
    before_install(
        function(target)
            local prefix = target:pkg("xmake"):installdir()
            if target:is_plat("windows") then
                target:add("installfiles", "scripts/xmake.cmd", { prefixdir = "$(bindir)" })
                target:add("installfiles", "scripts/xmake.ps1", { prefixdir = "$(bindir)" })
                target:add("installfiles", path.join(prefix, "(**)"), { prefixdir = "$(datadir)" })
            else
                target:add("installfiles", path.join(prefix, "bin/*"), { prefixdir = "$(bindir)" })
                target:add("installfiles", path.join(prefix, "share/(**)"), { prefixdir = "$(datadir)" })
            end
        end
    )
end
