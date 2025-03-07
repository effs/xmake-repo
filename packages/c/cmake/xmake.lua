package("cmake")

    set_kind("binary")
    set_homepage("https://cmake.org")
    set_description("A cross-platform family of tool designed to build, test and package software")

    if is_host("macosx") then
        add_urls("https://cmake.org/files/v$(version).tar.gz", {version = function (version)
                return table.concat(table.slice((version):split('%.'), 1, 2), '.') .. "/cmake-" .. version .. (version:ge("3.20") and "-macos-universal" or "-Darwin-x86_64")
            end})
        add_urls("https://github.com/Kitware/CMake/releases/download/v$(version).tar.gz", {version = function (version)
                return version .. "/cmake-" .. version .. (version:ge("3.20") and "-macos-universal" or "-Darwin-x86_64")
            end})
        add_versions("3.11.4", "2b5eb705f036b1906a5e0bce996e9cd56d43d73bdee8318ece3e5ce31657b812")
        add_versions("3.15.4", "adfbf611d21daa83b9bf6d85ab06a455e481b63a38d6e1270d563b03d4e5f829")
        add_versions("3.18.4", "9d27049660474cf134ab46fa0e0db771b263313fcb8ba82ee8b2d1a1a62f8f20")
        add_versions("3.21.0", "c1c6f19dfc9c658a48b5aed22806595b2337bb3aedb71ab826552f74f568719f")
        add_versions("3.22.1", "9ba46ce69d524f5bcdf98076a6b01f727604fb31cf9005ec03dea1cf16da9514")
        add_versions("3.24.1", "71bb8db69826d74c395a3c3bbf8b773dbe9f54a2c7331266ba70da303e9c97a1")
        add_versions("3.24.2", "efb11a78c064dd7c54a50b8da247254d252112c402c6e48cb7db3f9c84a4e5ad")
    elseif is_host("linux") and os.arch() == "x86_64" then
        add_urls("https://cmake.org/files/v$(version)-x86_64.tar.gz", {version = function (version)
                return table.concat(table.slice((version):split('%.'), 1, 2), '.') .. "/cmake-" .. version .. (version:ge("3.20") and "-linux" or "-Linux")
            end})
        add_urls("https://github.com/Kitware/CMake/releases/download/v$(version)-x86_64.tar.gz", {version = function (version)
            return version .. "/cmake-" .. version .. (version:ge("3.20") and "-linux" or "-Linux")
            end})
        add_versions("3.11.4", "6dab016a6b82082b8bcd0f4d1e53418d6372015dd983d29367b9153f1a376435")
        add_versions("3.15.4", "7c2b17a9be605f523d71b99cc2e5b55b009d82cf9577efb50d4b23056dee1109")
        add_versions("3.18.4", "149e0cee002e59e0bb84543cf3cb099f108c08390392605e944daeb6594cbc29")
        add_versions("3.21.0", "d54ef6909f519740bc85cec07ff54574cd1e061f9f17357d9ace69f61c6291ce")
        add_versions("3.22.1", "73565c72355c6652e9db149249af36bcab44d9d478c5546fd926e69ad6b43640")
        add_versions("3.24.1", "827bf068cfaa23a9fb95f990c9f8a7ed8f2caeb3af62b5c0a2fed7a8dd6dde3e")
        add_versions("3.24.2", "71a776b6a08135092b5beb00a603b60ca39f8231c01a0356e205e0b4631747d9")
    elseif is_host("windows") then
        if os.arch() == "x64" then
            add_urls("https://cmake.org/files/v$(version).zip", {excludes = {"*/doc/*"}, version = function (version)
                    return table.concat(table.slice((version):split('%.'), 1, 2), '.') .. "/cmake-" .. version .. (version:ge("3.20") and "-windows-x86_64" or "-win64-x64")
                end})
            add_urls("https://github.com/Kitware/CMake/releases/download/v$(version).zip", {excludes = {"*/doc/*"}, version = function (version)
                    return version .. "/cmake-" .. version .. (version:ge("3.20") and "-windows-x86_64" or "-win64-x64")
                end})
            add_versions("3.11.4", "d3102abd0ded446c898252b58857871ee170312d8e7fd5cbff01fbcb1068a6e5")
            add_versions("3.15.4", "5bb49c0274800c38833e515a01af75a7341db68ea82c71856bb3cf171d2068be")
            add_versions("3.18.4", "a932bc0c8ee79f1003204466c525b38a840424d4ae29f9e5fb88959116f2407d")
            add_versions("3.21.0", "c7b88c907a753f4ec86e43ddc89f91f70bf1b011859142f7f29e6d51ea4abb3c")
            add_versions("3.22.1", "35fbbb7d9ffa491834bbc79cdfefc6c360088a3c9bf55c29d111a5afa04cdca3")
            add_versions("3.24.1", "c1b17431a16337d517f7ba78c7067b6f143a12686cb8087f3dd32f3fa45f5aae")
            add_versions("3.24.2", "6af30354eecbb7113b0f0142d13c03d21abbc9f4dbdcddaf88df1f9ca1bc4d6f")
        else
            add_urls("https://cmake.org/files/v$(version).zip", {excludes = {"*/doc/*"}, version = function (version)
                    return table.concat(table.slice((version):split('%.'), 1, 2), '.') .. "/cmake-" .. version .. (version:ge("3.20") and "-windows-i386" or "-win32-x86")
                end})
            add_urls("https://github.com/Kitware/CMake/releases/download/v$(version).zip", {excludes = {"*/doc/*"}, version = function (version)
                    return version .. "/cmake-" .. version .. (version:ge("3.20") and "-windows-i386" or "-win32-x86")
                end})
            add_versions("3.11.4", "b068001ff879f86e704977c50a8c5917e4b4406c66242366dba2674abe316579")
            add_versions("3.15.4", "19c2bfd26c4de4d8046dd5ad6de95b57a2556559ec81b13b94e63ea4ae49b3f2")
            add_versions("3.18.4", "4c519051853686927f87df99669ada3ff15a3086535a7131892febd7c6e2f122")
            add_versions("3.21.0", "11ee86b7f9799724fc16664c63e308bfe3fbc22c9df8ef4955ad4b248f3e680b")
            add_versions("3.22.1", "f53494e3b35e5a1177ad55c28763eb5bb45772c1d80778c0f96c45ce4376b6e8")
            add_versions("3.24.1", "a0b894e2a814d2353f1e581eb6ca3c878a39c071624495729dbcf9978e1579f2")
            add_versions("3.24.2", "52f174dc7f52a9c496c7a49ee35456466c07c8ce29aa2092f4b4536ce5d7ed57")
        end
    else
        add_urls("https://github.com/Kitware/CMake/releases/download/v$(version)/cmake-$(version).tar.gz")
        add_versions("3.18.4", "597c61358e6a92ecbfad42a9b5321ddd801fc7e7eca08441307c9138382d4f77")
        add_versions("3.21.0", "4a42d56449a51f4d3809ab4d3b61fd4a96a469e56266e896ce1009b5768bd2ab")
        add_versions("3.22.1", "0e998229549d7b3f368703d20e248e7ee1f853910d42704aa87918c213ea82c0")
        add_versions("3.24.1", "4931e277a4db1a805f13baa7013a7757a0cbfe5b7932882925c7061d9d1fa82b")
        add_versions("3.24.2", "0d9020f06f3ddf17fb537dc228e1a56c927ee506b486f55fe2dc19f69bf0c8db")
    end

    if is_plat("mingw") and is_subhost("msys") then
        add_extsources("pacman::cmake")
    elseif is_plat("linux") then
        add_extsources("pacman::cmake", "apt::cmake")
    elseif is_plat("macosx") then
        add_extsources("brew::cmake")
    end

    on_install("@macosx", function (package)
        os.cp("CMake.app/Contents/bin", package:installdir())
        os.cp("CMake.app/Contents/share", package:installdir())
    end)

    on_install("@linux|x86_64", "@windows", "@msys", "@cygwin", function (package)
        os.cp("bin", package:installdir())
        os.cp("share", package:installdir())
    end)

    on_install("@bsd", function (package)
        os.vrunv("sh", {"./bootstrap", "--prefix=" .. package:installdir()})
        import("package.tools.make").install(package)
    end)

    on_test(function (package)
        os.vrun("cmake --version")
    end)
