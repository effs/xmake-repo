package("dynareadout")

    set_homepage("https://github.com/PucklaJ/dynareadout")
    set_description("Ansi C library for parsing binary output files of LS Dyna (d3plot, binout)")

    add_urls("https://github.com/PucklaJ/dynareadout/archive/refs/tags/$(version).tar.gz",
             "https://github.com/PucklaJ/dynareadout.git")
    add_versions("22.12", "2e430c718c610d4425e23d4c6c87fe4794bb8c76d3cc015988706dbf5027daa4")

    add_configs("cpp",       {description = "Build the C++ bindings",        default = true,  type = "boolean"})
    add_configs("profiling", {description = "Build with profiling features", default = false, type = "boolean"})

    on_load(function (package)
        if package:config("cpp") then
            package:add("links", "dynareadout_cpp", "dynareadout")
        else
            package:add("links", "dynareadout")
        end
    end)

    on_install("windows", "linux", "macosx", "mingw", function (package)
        local configs = {}
        configs.build_test = "n"
        configs.build_cpp = package:config("cpp") and "y" or "n"
        configs.profiling = package:config("profiling") and "y" or "n"
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:has_cfuncs("binout_open", {includes = "binout.h", configs = {languages = "ansi"}}))
        assert(package:has_cfuncs("d3plot_open", {includes = "d3plot.h", configs = {languages = "ansi"}}))
        if package:config("cpp") then
            assert(package:has_cxxtypes("dro::Binout", {includes = "binout.hpp", configs = {languages = "cxx17"}}))
            assert(package:has_cxxtypes("dro::D3plot", {includes = "d3plot.hpp", configs = {languages = "cxx17"}}))
            assert(package:has_cxxtypes("dro::Array<int32_t>",  {includes = {"array.hpp", "cstdint"}, configs = {languages = "cxx17"}}))
        end
        if package:config("profiling") then
            assert(package:check_csnippets({test = [[
                void test(int argc, char** argv) {
                    BEGIN_PROFILE_FUNC();
                    BEGIN_PROFILE_SECTION(mid_section);
                    END_PROFILE_SECTION(mid_section);
                    END_PROFILE_FUNC();
                    END_PROFILING("dynareadout_test_profiling.txt");
                }
            ]]}, {includes = "profiling.h", configs = {languages = "ansi"}}))
        end
    end)
