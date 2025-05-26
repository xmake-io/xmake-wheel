-- luacheck: ignore 111 113 143
---@diagnostic disable: undefined-global, undefined-field
package("xmake")
do
    set_homepage("https://github.com/xmake-io/xmake")
    set_description("xmake - A cross-platform build utility based on Lua")

    set_urls("https://github.com/xmake-io/xmake/releases/download/$(version)/xmake-$(version).tar.gz",
        "https://github.com/xmake-io/xmake.git")
    add_versions("v2.9.9", "e92505b83bc9776286eae719d58bcea7ff2577afe12cb5ccb279c81e7dbc702d")

    on_install(function(package)
        import("package.tools.xmake").install(package, { "-P", "core", "--pdcurses=n" })
    end)

    on_test(function(package)
        if not package:is_cross() then
            for _, tool in ipairs({ "xmake" }) do
                if package:config(tool) then
                    os.vrunv(tool, { "--version" })
                end
            end
        end
    end)
end
package_end()
add_requires("xmake", { system = false })

target("phony")
do
    set_kind("phony")
    add_packages("xmake")
    add_installfiles("src/xmake_wheel/*", { prefixdir = "$(xmake-platlib)/xmake_wheel" })
    before_install(
        function(target)
            local prefix = target:pkg("xmake"):installdir()
            if target:is_plat("windows") then
                target:add("installfiles", path.join(prefix, "xmake.exe"), { prefixdir = "$(xmake-scripts)" })
                target:add("installfiles", path.join(prefix, "(*/**)"), { prefixdir = "$(xmake-data)" })
            else
                target:add("installfiles", path.join(prefix, "bin/*"), { prefixdir = "$(xmake-scripts)" })
                target:add("installfiles", path.join(prefix, "(share/**)"), { prefixdir = "$(xmake-data)" })
            end
        end
    )
end
