package("redis-plus-plus")
    set_homepage("https://github.com/sewenew/redis-plus-plus")
    set_description("Redis client written in C++")

    add_urls("https://github.com/sewenew/redis-plus-plus/archive/refs/tags/$(version).tar.gz",
             "https://github.com/sewenew/redis-plus-plus.git")
    add_versions("1.3.5", "a49a72fef26ed39d36a278fcc4e4d92822e111697b5992d8f26f70d16edc6c1f")

    add_deps("hiredis")
    add_deps("cmake")
  
    if is_plat("linux") then
        add_syslinks("pthread")
    end

    on_install("linux", "macosx", function (package)
        local configs = {"-DREDIS_PLUS_PLUS_BUILD_TEST=OFF"}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        table.insert(configs, "-DREDIS_PLUS_PLUS_BUILD_STATIC=" .. (package:config("shared") and "OFF" or "ON"))
        table.insert(configs, "-DREDIS_PLUS_PLUS_BUILD_SHARED=" .. (package:config("shared") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs, {packagedeps = {"hiredis"}})
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({
            test = [[
              #include <sw/redis++/redis++.h>
              static void test() {
                sw::redis::ConnectionOptions connection_options;
              }
            ]]
        }, {configs = {languages = "c++17"}}))
    end)