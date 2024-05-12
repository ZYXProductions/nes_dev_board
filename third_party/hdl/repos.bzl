load("//rules:repo.bzl", "http_archive_or_local")

def hdl_repos(hurt = None):
    http_archive_or_local(
        name = "hurt",
        local = hurt,
        url = "https://github.com/cfrantz/hurt/archive/583346c206aeb962fa1a629899bcfc3c9d104c92.tar.gz",
        sha256 = "0cefb4d278a7f482267f794022f7f8e735e42bd17a6107eb926bfaf545cbe749",
        strip_prefix = "hurt-583346c206aeb962fa1a629899bcfc3c9d104c92",
    )
