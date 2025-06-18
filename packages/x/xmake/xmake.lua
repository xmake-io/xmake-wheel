-- luacheck: ignore 111 113 143
---@diagnostic disable: undefined-global, undefined-field
package("xmake")
do
    set_homepage("https://github.com/xmake-io/xmake")
    set_description("xmake - A cross-platform build utility based on Lua")

    set_urls("https://github.com/xmake-io/xmake/releases/download/$(version)/xmake-$(version).tar.gz",
        "https://github.com/xmake-io/xmake.git")
    add_versions("v3.0.0", "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5  -")

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
