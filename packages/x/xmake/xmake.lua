-- luacheck: ignore 111 113 143
---@diagnostic disable: undefined-global, undefined-field
package("xmake")
do
    set_homepage("https://github.com/xmake-io/xmake")
    set_description("xmake - A cross-platform build utility based on Lua")

    set_urls("https://github.com/xmake-io/xmake/releases/download/$(version)/xmake-$(version).tar.gz")
    add_versions("v3.0.8", "73da077440d1327e24bc74da2888c418e589dc28966e6e6b5bd6e889721b2d07")

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
