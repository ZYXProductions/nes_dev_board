load("@hurt//toolchains/yosys:repository.bzl", "yosyshq_repos")

def hdl_deps():
    yosyshq_repos()
    native.register_toolchains("@hurt//toolchains/yosys/ice40:ice40")
