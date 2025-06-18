-- luacheck: ignore 111 113 143
---@diagnostic disable: undefined-global, undefined-field
package("xmake")
do
    set_homepage("https://github.com/xmake-io/xmake")
    set_description("xmake - A cross-platform build utility based on Lua")

    set_urls("https://github.com/xmake-io/xmake/releases/download/$(version)/xmake-$(version).tar.gz")
    add_versions("v3.0.0", "e749c2a902a1b88e6e3b73b78962a6417c9a04f91ce3c6e174a252598f10eb28")

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
