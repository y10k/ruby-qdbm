require 'mkmf'

dir_config("curia")

home = ENV['HOME']
$CFLAGS = "-I. -I#{home}/include -I/usr/local/include " + `pkg-config qdbm --cflags`.chomp
$LDFLAGS = "-L#{home}/lib -L/usr/local/lib " + `pkg-config qdbm --libs`.chomp
$LIBS = "-L#{home}/lib -L/usr/local/lib " + `pkg-config qdbm --libs`.chomp

have_library("c", "main")
have_library("pthread", "main")
have_library("z", "main")
have_library("bz2", "main")
have_library("lzo2", "main")
have_library("iconv", "main")
have_library("qdbm", "main")

create_makefile("mod_curia")
