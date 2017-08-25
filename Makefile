# Standard installation pathnames
# See the file LICENSE for the license
SHELL 		= /bin/sh
VERSION         = 1.7.0
version_info	= 2:0:0
srcdir 		= .
prefix  	= /usr/local/Cellar/ldns/1.7.1
exec_prefix 	= ${prefix}
bindir 		= ${exec_prefix}/bin
mandir 		= ${datarootdir}/man
datarootdir	= ${prefix}/share
datadir		= ${datarootdir}
libdir		= ${exec_prefix}/lib
includedir	= ${prefix}/include
sysconfdir      = ${prefix}/etc
doxygen		= doxygen
pywrapdir       = $(srcdir)/contrib/python
pyldnsxwrapdir  = $(srcdir)/contrib/ldnsx
p5_dns_ldns_dir = $(srcdir)/contrib/DNS-LDNS
PERL		= 
swig		= 
swigpy_flags	= -python 
python_site	= 
pyldns_inst	= 
pyldns_uninst	= 
pyldnsx_inst	= 
pyldnsx_uninst	= 
libtool		= ./libtool
CONFIG_FILES	= Makefile ldns/common.h ldns/net.h ldns/util.h packaging/libldns.pc packaging/ldns-config

LDNS_TRUST_ANCHOR_FILE = $(sysconfdir)/unbound/root.key
DEFAULT_CAFILE = 
DEFAULT_CAPATH = 

edit = sed \
	-e 's|@LDNS_TRUST_ANCHOR_FILE[@]|$(LDNS_TRUST_ANCHOR_FILE)|g' \
	-e 's|@DEFAULT_CAFILE[@]|$(DEFAULT_CAFILE)|g' \
	-e 's|@DEFAULT_CAPATH[@]|$(DEFAULT_CAPATH)|g'

# override $U variable which is used by autotools for deansification (for
# K&R C compilers), but causes problems if $U is defined in the env).
U=
CC 		= cc
CFLAGS		= -Wunused-function -Wstrict-prototypes -Wwrite-strings -W -Wall -fomit-frame-pointer -funroll-loops  -ffast-math -Ofast -fno-signed-zeros -ffp-contract=fast -mmmx -msse -flto -m64    -mmacosx-version-min=10.10 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk
CPPFLAGS	= -I. -I$(srcdir) -I/usr/local/opt/openblas/include -I/usr/local/opt/llvm/include -I/usr/local/opt/readline/include -I/usr/local/opt/zlib/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/portable-expat/include  -DHAVE_CONFIG_H -DLDNS_TRUST_ANCHOR_FILE="\"$(LDNS_TRUST_ANCHOR_FILE)\""
LDFLAGS		= -L/usr/local/opt/openblas/lib -L/usr/local/opt/llvm/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/portable-expat/lib 
LIBS 		= 
LIBOBJDIR	= compat/
LIBOBJS		=  ${LIBOBJDIR}b64_pton$U.o ${LIBOBJDIR}b64_ntop$U.o
PYTHON_CPPFLAGS	= 
PYTHON_LDFLAGS	= 
PYTHON_X_CFLAGS = 
LIBSSL_CPPFLAGS =  -I/usr/local/opt/openssl@1.1/include
LIBSSL_LDFLAGS  =  -L/usr/local/opt/openssl@1.1/lib
LIBSSL_LIBS     =  -lcrypto -lssl
LIBSSL_SSL_LIBS = -lssl  -lcrypto -lssl
LIBPCAP_LIBS    = -lpcap
RUNTIME_PATH	= 
LIBTOOL		= $(libtool) --tag=CC --quiet
LINT		= splint
LINTFLAGS	= +quiet -weak -warnposix -unrecog -Din_addr_t=uint32_t -Du_int=unsigned -Du_char=uint8_t -preproc -Drlimit=rlimit64 -D__gnuc_va_list=va_list
# Extra flags from configure
LINTFLAGS	+= 
LINTFLAGS	+= "-DBN_ULONG=unsigned long" -Dkrb5_int32=int "-Dkrb5_ui_4=unsigned int" -DPQ_64BIT=uint64_t -DRC4_INT=unsigned -fixedformalarray -D"ENGINE=unsigned" -D"RSA=unsigned" -D"DSA=unsigned" -D"EVP_PKEY=unsigned" -D"EVP_MD=unsigned" -D"SSL=unsigned" -D"SSL_CTX=unsigned" -D"X509=unsigned" -D"RC4_KEY=unsigned" -D"EVP_MD_CTX=unsigned" -D"EC_KEY=unsigned" -D"EC_POINT=unsigned" -D"EC_GROUP=unsigned" -D"EVP_PKEY_ASN1_METHOD=struct evp_pkey_asn1_method_st" -D"EVP_PKEY_CTX=struct evp_pkey_ctx_st"
# compat with OpenBSD
LINTFLAGS	+= "-Dsigset_t=long"
# FreeBSD8
LINTFLAGS	+= "-D__uint16_t=uint16_t" -D"__pure2=" -D"__wchar_t=wchar_t" -D"__packed=" -D"__aligned(x)="
# Ubuntu oneiric"
LINTFLAGS       += -D"__BEGIN_DECLS=" -D"__ssize_t=ssize_t" -D"__intptr_t=intptr_t" -D"__nonnull(x)=" -D"__THROW=" -D"__wur=" -D"__off_t=unsigned" -D"__off64_t=unsigned" -D"__useconds_t=unsigned" -D"__uid_t=unsigned" -D"__gid_t=unsigned" -D"__attribute_deprecated__=" -D"__pid_t=unsigned" -D"__restrict=" -D"__END_DECLS=" -D"__BEGIN_NAMESPACE_STD=" -D"__END_NAMESPACE_STD=" -D"__BEGIN_NAMESPACE_C99=" -D"__END_NAMESPACE_C99="  -D"__socklen_t=unsigned" -D"sa_family_t=unsigned " -D"__mode_t=unsigned" -D"u_int16_t=uint16_t" -D"u_int32_t=uint32_t" -D"u_int8_t=uint8_t" -D"u_short=unsigned short" -D"__u16=uint16_t" -D"__u32=uint32_t" -D"__u64=uint64_t"
# FreeBSD 9
LINTFLAGS       += -D"_RuneLocale=int"
DEPFLAG		= -MM

INSTALL		= $(srcdir)/install-sh 

LIBLOBJS	= $(LIBOBJS:.o=.lo)
LDNS_LOBJS	= buffer.lo dane.lo dname.lo dnssec.lo dnssec_sign.lo dnssec_verify.lo dnssec_zone.lo duration.lo error.lo higher.lo host2str.lo host2wire.lo keys.lo net.lo packet.lo parse.lo radix.lo rbtree.lo rdata.lo resolver.lo rr.lo rr_functions.lo sha1.lo sha2.lo str2host.lo tsig.lo update.lo util.lo wire2host.lo zone.lo 
LDNS_LOBJS_EX	= ^linktest\.c$$
LDNS_ALL_LOBJS	= $(LDNS_LOBJS) $(LIBLOBJS)
LIB		= libldns.la

LDNS_HEADERS	= buffer.h dane.h dname.h dnssec.h dnssec_sign.h dnssec_verify.h dnssec_zone.h duration.h error.h higher.h host2str.h host2wire.h keys.h ldns.h packet.h parse.h radix.h rbtree.h rdata.h resolver.h rr_functions.h rr.h sha1.h sha2.h str2host.h tsig.h update.h wire2host.h zone.h 
LDNS_HEADERS_EX	= ^config\.h|common\.h|util\.h|net\.h$$
LDNS_HEADERS_GEN= common.h util.h net.h

PYLDNS_I_FILES	= $(pywrapdir)/file_py3.i $(pywrapdir)/ldns_buffer.i $(pywrapdir)/ldns_dname.i $(pywrapdir)/ldns_dnssec.i $(pywrapdir)/ldns.i $(pywrapdir)/ldns_key.i $(pywrapdir)/ldns_packet.i $(pywrapdir)/ldns_rdf.i $(pywrapdir)/ldns_resolver.i $(pywrapdir)/ldns_rr.i $(pywrapdir)/ldns_zone.i

DRILL_LOBJS	= drill/chasetrace.lo drill/dnssec.lo drill/drill.lo drill/drill_util.lo drill/error.lo drill/root.lo drill/securetrace.lo drill/work.lo

EXAMPLE_LOBJS	= examples/ldns-chaos.lo examples/ldns-compare-zones.lo examples/ldns-dane.lo examples/ldnsd.lo examples/ldns-dpa.lo examples/ldns-gen-zone.lo examples/ldns-key2ds.lo examples/ldns-keyfetcher.lo examples/ldns-keygen.lo examples/ldns-mx.lo examples/ldns-notify.lo examples/ldns-nsec3-hash.lo examples/ldns-read-zone.lo examples/ldns-resolver.lo examples/ldns-revoke.lo examples/ldns-rrsig.lo examples/ldns-signzone.lo examples/ldns-test-edns.lo examples/ldns-testns.lo examples/ldns-testpkts.lo examples/ldns-update.lo examples/ldns-verify-zone.lo examples/ldns-version.lo examples/ldns-walk.lo examples/ldns-zcat.lo examples/ldns-zsplit.lo
EXAMPLE_PROGS	= examples/ldns-chaos examples/ldns-compare-zones examples/ldnsd examples/ldns-gen-zone examples/ldns-key2ds examples/ldns-keyfetcher examples/ldns-keygen examples/ldns-mx examples/ldns-notify examples/ldns-read-zone examples/ldns-resolver examples/ldns-rrsig examples/ldns-test-edns examples/ldns-update examples/ldns-version examples/ldns-walk examples/ldns-zcat examples/ldns-zsplit 
EX_PROGS_BASENM	= ldns-chaos ldns-compare-zones ldns-dane ldnsd ldns-dpa ldns-gen-zone ldns-key2ds ldns-keyfetcher ldns-keygen ldns-mx ldns-notify ldns-nsec3-hash ldns-read-zone ldns-resolver ldns-revoke ldns-rrsig ldns-signzone ldns-test-edns ldns-testns ldns-testpkts ldns-update ldns-verify-zone ldns-version ldns-walk ldns-zcat ldns-zsplit 
EXAMPLE_PROGS_EX= ^examples/ldns-testpkts\.c|examples/ldns-testns\.c|examples/ldns-dane\.c|examples/ldns-dpa\.c|examples/ldns-nsec3-hash\.c|examples/ldns-revoke\.c|examples/ldns-signzone\.c|examples/ldns-verify-zone\.c$$
TESTNS		= examples/ldns-testns
TESTNS_LOBJS	= examples/ldns-testns.lo examples/ldns-testpkts.lo
LDNS_DPA	= examples/ldns-dpa
LDNS_DPA_LOBJS	= examples/ldns-dpa.lo
LDNS_DANE	= examples/ldns-dane
LDNS_DANE_LOBJS	= examples/ldns-dane.lo
EX_SSL_PROGS	= examples/ldns-nsec3-hash examples/ldns-revoke examples/ldns-signzone examples/ldns-verify-zone
EX_SSL_LOBJS	= examples/ldns-nsec3-hash.lo examples/ldns-revoke.lo examples/ldns-signzone.lo examples/ldns-verify-zone.lo

COMPILE		= $(CC) $(CPPFLAGS) $(CFLAGS)
COMP_LIB	= $(LIBTOOL) --mode=compile $(CC) $(CPPFLAGS) $(CFLAGS)
LINK		= $(CC) $(CFLAGS) $(LDFLAGS) $(LIBS)
LINK_LIB	= $(LIBTOOL) --mode=link $(CC) $(CFLAGS) $(LDFLAGS) $(LIBS) -version-info $(version_info) -no-undefined
LINK_EXE	= $(LIBTOOL) --mode=link $(CC) $(CFLAGS) $(LDFLAGS) $(LIBSSL_LDFLAGS)

.PHONY:	clean realclean docclean manpages doc lint all lib pyldns test
.PHONY: install uninstall install-doc uninstall-doc uninstall-pyldns
.PHONY: install-h uninstall-h install-lib uninstall-lib install-pyldns

all:	setup-builddir lib linktest manpages   drill examples

.SUFFIXES: .c .o .a .lo .h .i

.c.lo:
	$(COMP_LIB) $(LIBSSL_CPPFLAGS) -c $< -o $@

$(LDNS_LOBJS) $(LIBLOBJS) $(DRILL_LOBJS) $(EXAMPLE_LOBJS):
	$(COMP_LIB) $(LIBSSL_CPPFLAGS) -c $(srcdir)/$(@:.lo=.c) -o $@

setup-builddir:
	@if test ! -d compat ; then mkdir compat ; fi
	@if test ! -d drill ; then mkdir drill ; fi
	@if test ! -d examples ; then mkdir examples ; fi
	@if test ! -h config.h ; then ln -s ldns/config.h . ; fi
	@if test ! -h lib ; then ln -s .libs lib ; fi ;
	@if test ! -d include ; then $(INSTALL) -d include; fi
	@if test ! -h include/ldns ; then ln -s ../ldns include/ldns || echo "include/ldns exists"; fi

putdown-builddir:
	rm -f include/ldns lib config.h
	test ! -d include  || rmdir include  || :
	if test -d examples -a ! -f examples/README; then rmdir examples || : ; fi
	if test -d drill    -a ! -f drill/README   ; then rmdir drill    || : ; fi
	if test -d compat   -a ! -f compat/malloc.c; then rmdir compat   || : ; fi

drill: no-drill-config-h drill/drill drill/drill.1
no-drill-config-h:
	@if test -e $(srcdir)/drill/config.h -o -e drill/config.h ; \
	then echo "A config.h was detected in the drill subdirectory." ; \
	     echo "This does not work when building drill from here." ; \
	     echo "Either remove the config.h from the subdirectory" ; \
	     echo "or build drill there." ; \
	     exit -1 ; \
	fi

drill/drill: $(DRILL_LOBJS) $(LIB)
	$(LINK_EXE) $(DRILL_LOBJS) $(LIBS) $(LIBSSL_LIBS) -lldns -o drill/drill

drill/drill.1: $(srcdir)/drill/drill.1.in
	$(edit) $(srcdir)/drill/drill.1.in > drill/drill.1

install-drill: drill/drill drill/drill.1
	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 -d $(DESTDIR)$(mandir)
	$(INSTALL) -m 755 -d $(DESTDIR)$(mandir)/man1
	$(LIBTOOL) --mode=install cp drill/drill $(DESTDIR)$(bindir)
	$(INSTALL) -m 644 drill/drill.1 $(DESTDIR)$(mandir)/man1/drill.1

uninstall-drill:
	rm -f $(DESTDIR)$(bindir)/drill $(DESTDIR)$(mandir)/man1/drill.1
	test ! -d $(DESTDIR)$(mandir) || rmdir -p $(DESTDIR)$(mandir)/man1 || :;
	test ! -d $(DESTDIR)$(bindir) || rmdir -p $(DESTDIR)$(bindir) || : ;

clean-drill:
	$(LIBTOOL) --mode clean rm -f $(DRILL_LOBJS) drill/drill drill/drill.1

examples: no-examples-config-h $(EXAMPLE_PROGS) $(TESTNS) $(LDNS_DPA) $(LDNS_DANE) $(EX_SSL_PROGS) examples/ldns-dane.1 examples/ldns-verify-zone.1
no-examples-config-h:
	@if test -e $(srcdir)/examples/config.h -o -e examples/config.h ; \
	then echo "A config.h was detected in the examples subdirectory." ; \
	     echo "This does not work when building examples from here." ; \
	     echo "Either remove the config.h from the subdirectory" ; \
	     echo "or build examples there." ; \
	     exit -1 ; \
	fi

$(EXAMPLE_PROGS):
	$(LINK_EXE) $@.lo $(LIBS) -lldns -o $@

$(TESTNS):
	$(LINK_EXE) $(TESTNS_LOBJS) $(LIBS) -lldns -o $(TESTNS)

$(LDNS_DPA):
	$(LINK_EXE) $(LDNS_DPA_LOBJS) $(LIBS) $(LIBPCAP_LIBS) -lldns \
		 -o $(LDNS_DPA)

$(LDNS_DANE):
	$(LINK_EXE) $(LDNS_DANE_LOBJS) $(LIBS) $(LIBSSL_SSL_LIBS) -lldns \
		 -o $(LDNS_DANE)

$(EX_SSL_PROGS):
	$(LINK_EXE) $@.lo $(LIBS) $(LIBSSL_LIBS) -lldns -o $@

examples/ldns-dane.1: $(srcdir)/examples/ldns-dane.1.in
	$(edit) $(srcdir)/examples/ldns-dane.1.in > examples/ldns-dane.1

examples/ldns-verify-zone.1: $(srcdir)/examples/ldns-verify-zone.1.in
	$(edit) $(srcdir)/examples/ldns-verify-zone.1.in > examples/ldns-verify-zone.1

install-examples: $(EXAMPLE_PROGS) $(TESTNS) $(LDNS_DPA) $(LDNS_DANE) $(EX_SSL_PROGS) examples/ldns-dane.1 examples/ldns-verify-zone.1
	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 -d $(DESTDIR)$(mandir)
	$(INSTALL) -m 755 -d $(DESTDIR)$(mandir)/man1
	for p in $(EXAMPLE_PROGS) $(TESTNS) $(LDNS_DPA) $(LDNS_DANE) $(EX_SSL_PROGS) ; do \
		$(LIBTOOL) --mode=install cp $$p $(DESTDIR)$(bindir) ; \
		if test -f $$p.1 ; \
		then $(INSTALL) -m 644 $$p.1 $(DESTDIR)$(mandir)/man1 ; \
		else $(INSTALL) -m 644 $(srcdir)/$$p.1 $(DESTDIR)$(mandir)/man1 ; \
		fi ; \
	done

uninstall-examples:
	for p in $(EX_PROGS_BASENM) ; do \
		rm -f $(DESTDIR)$(bindir)/$$p $(DESTDIR)$(mandir)/man1/$$p.1 ;\
	done
	test ! -d $(DESTDIR)$(mandir) || rmdir -p $(DESTDIR)$(mandir)/man1 || :;
	test ! -d $(DESTDIR)$(bindir) || rmdir -p $(DESTDIR)$(bindir) || : ;

clean-examples:
	$(LIBTOOL) --mode clean rm -f $(EXAMPLE_PROGS) 
	$(LIBTOOL) --mode clean rm -f $(TESTNS) $(LDNS_DPA) $(LDNS_DANE) $(EX_SSL_PROGS)
	$(LIBTOOL) --mode clean rm -f $(EXAMPLE_LOBJS)
	$(LIBTOOL) --mode clean rm -f examples/ldns-dane.1 examples/ldns-verify-zone.1

linktest: $(srcdir)/linktest.c libldns.la
	$(COMP_LIB) $(LIBSSL_CPPFLAGS) -c $(srcdir)/linktest.c -o linktest.lo
	$(LINK_EXE) linktest.lo $(LIBS) $(LIBSSL_LIBS) -lldns -o linktest

lib: libldns.la

lib-export-all: libldns.la-export-all

libldns.la: $(LDNS_ALL_LOBJS)
	$(LINK_LIB) $(LIBSSL_LDFLAGS) $(LIBSSL_LIBS) -export-symbols-regex '^(ldns_|b32_[pn]to[pn]|mktime_from_utc|qsort_rr_compare_nsec3)' -o libldns.la $(LDNS_ALL_LOBJS) -rpath $(libdir) $(RUNTIME_PATH)

libldns.la-export-all: $(LDNS_ALL_LOBJS)
	$(LINK_LIB) -o libldns.la $(LDNS_ALL_LOBJS) -rpath $(libdir) $(RUNTIME_PATH)

mancheck:
	sh -c 'find . -name \*.\[13\] -exec troff -z {} \;' 2>&1 | sed "s/^\.\///" | sed "s/\(:[0\-9]\+:\)/\1 warning:/g"

doxygen: manpages
	@if test ! -e doc/header.html ; then \
		$(INSTALL) -c -m 644 $(srcdir)/doc/header.html doc/ ; \
	fi ;
	$(doxygen) $(srcdir)/libdns.doxygen

doc: manpages $(doxygen)
	@$(INSTALL) -d doc

manpages: $(srcdir)/doc/function_manpages 
	@$(INSTALL) -d doc
	@cat $(srcdir)/ldns/*.h \
	| $(srcdir)/doc/doxyparse.pl \
		-m $(srcdir)/doc/function_manpages \
	| grep -v ^doxygen | grep -v ^cat  > doc/ldns_manpages

manpage-create-errors: $(srcdir)/doc/function_manpages 
	@$(INSTALL) -d doc
	@cat $(srcdir)/ldns/*.h \
	| $(srcdir)/doc/doxyparse.pl -e \
		-m $(srcdir)/doc/function_manpages >/dev/null

manpage-errors:
	@man --version >/dev/null 2>&1 && \
	for m in `cat $(srcdir)/ldns/*.h | $(srcdir)/doc/doxyparse.pl -m $(srcdir)/doc/function_manpages 2>&1 | grep -v ^doxygen | grep -v ^cat` ; do\
		LC_ALL=en_US.UTF-8 MANROFFSEQ='' MANWIDTH=80 \
			man --warnings -E UTF-8 -l -Tutf8 -Z doc/man/man3/$${m}.3 2>&1 >/dev/null \
			| awk "-vpage=$${m}.3" '{printf("%s: ", page);print}'; \
		if ! lexgrog doc/man/man3/$${m}.3 >/dev/null 2>&1 ; \
		then \
			echo doc/man/man3/$${m}.3: manpage-has-bad-whatis-entry; \
		fi; \
	done || echo "WARNING!: Cannot detect manpage errors on `uname`"
	
pyldns: _ldns.la

$(pywrapdir)/ldns_wrapper.c: $(PYLDNS_I_FILES) ldns/config.h
	$(swig) $(swigpy_flags) -o $@ $(PYTHON_CPPFLAGS) $(pywrapdir)/ldns.i

ldns_wrapper.lo: $(pywrapdir)/ldns_wrapper.c ldns/config.h
	$(COMP_LIB) -I./include/ldns $(LIBSSL_CPPFLAGS) $(PYTHON_CPPFLAGS) $(PYTHON_X_CFLAGS) -c $(pywrapdir)/ldns_wrapper.c -o $@

_ldns.la: ldns_wrapper.lo libldns.la 
	$(LIBTOOL) --tag=CC --mode=link $(CC) $(CFLAGS) $(PYTHON_CFLAGS) $(LDFLAGS) $(PYTHON_LDFLAGS) -module -version-info $(version_info) -no-undefined -o $@ ldns_wrapper.lo -rpath $(python_site) -L. -L.libs -lldns $(LIBS)

$(p5_dns_ldns_dir)/Makefile: $(p5_dns_ldns_dir)/Makefile.PL
	BUILDDIR=`pwd`; cd $(p5_dns_ldns_dir); LD_LIBRARY_PATH="$$BUILDDIR/.libs:$$LD_LIBRARY_PATH" DYLD_LIBRARY_PATH="$$BUILDDIR/.libs:$$DYLD_LIBRARY_PATH" $(PERL) Makefile.PL LIBS="-L$$BUILDDIR/.libs -lldns" INC="-I$$BUILDDIR"

$(p5_dns_ldns_dir)/blib/arch/auto/DNS/LDNS/LDNS.so: $(p5_dns_ldns_dir)/Makefile
	cd $(p5_dns_ldns_dir); $(MAKE)

p5-dns-ldns: $(p5_dns_ldns_dir)/blib/arch/auto/DNS/LDNS/LDNS.so

install-p5-dns-ldns: $(p5_dns_ldns_dir)/Makefile
	cd $(p5_dns_ldns_dir); $(MAKE) install

uninstall-p5-dns-ldns: $(p5_dns_ldns_dir)/Makefile
	cd $(p5_dns_ldns_dir); $(MAKE) uninstall

clean-p5-dns-ldns: $(p5_dns_ldns_dir)/Makefile
	cd $(p5_dns_ldns_dir); $(MAKE) clean

test-p5-dns-ldns: $(p5_dns_ldns_dir)/Makefile
	cd $(p5_dns_ldns_dir); $(MAKE) test

install: install-h install-lib install-config install-manpages $(pyldns_inst) $(pyldnsx_inst)  install-drill install-examples

uninstall: uninstall-manpages uninstall-config uninstall-h uninstall-lib $(pyldns_uninst) $(pyldnsx_uninst)  uninstall-drill uninstall-examples

destclean: uninstall

install-config:
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -c -m 755 packaging/ldns-config $(DESTDIR)$(bindir)

uninstall-config:
	rm -f $(DESTDIR)$(bindir)/ldns-config
	test ! -d $(DESTDIR)$(bindir) || rmdir -p $(DESTDIR)$(bindir) || echo "ok, dir already gone"

install-config-manpage:
	${INSTALL} -d $(DESTDIR)$(mandir)/man1
	${INSTALL} -c -m 444 $(srcdir)/packaging/ldns-config.1 $(DESTDIR)$(mandir)/man1/


uninstall-config-manpage:
	rm -f $(DESTDIR)$(mandir)/man1/ldns-config.1
	test ! -d $(DESTDIR)$(mandir)/man1 || rmdir -p $(DESTDIR)$(mandir)/man1 || echo "ok, dir already gone"

install-manpages: manpages  install-config-manpage
	${INSTALL} -d $(DESTDIR)$(mandir)/man3
	for f in doc/man/man3/*; do \
		${INSTALL} -c -m 444 $$f $(DESTDIR)$(mandir)/man3/; \
	done

uninstall-manpages: uninstall-config-manpage
	for m in `cat $(srcdir)/ldns/*.h | perl $(srcdir)/doc/doxyparse.pl -m $(srcdir)/doc/function_manpages 2>&1 | grep -v ^doxygen | grep -v ^cat` ; do \
		rm -f $(DESTDIR)$(mandir)/man3/$$m.3 ; done
	test ! -d $(DESTDIR)$(mandir)/man3 || rmdir -p $(DESTDIR)$(mandir)/man3 || echo "ok, dir already gone"

install-h: lib
	$(INSTALL) -m 755 -d $(DESTDIR)$(includedir)/ldns
	for i in $(LDNS_HEADERS); do \
		$(INSTALL) -c -m 644 $(srcdir)/ldns/$$i $(DESTDIR)$(includedir)/ldns/; done
	for i in $(LDNS_HEADERS_GEN); do \
		$(INSTALL) -c -m 644 ldns/$$i $(DESTDIR)$(includedir)/ldns/; done

uninstall-h:
	for i in $(LDNS_HEADERS) $(LDNS_HEADERS_GEN); do \
		rm -f $(DESTDIR)$(includedir)/ldns/$$i; done
	test ! -d $(DESTDIR)$(includedir)/ldns || rmdir -p $(DESTDIR)$(includedir)/ldns || echo "ok, dir already gone"
	exit 0

install-lib: lib
	$(INSTALL) -m 755 -d $(DESTDIR)$(libdir)
	$(LIBTOOL) --mode=install cp libldns.la $(DESTDIR)$(libdir)
	$(LIBTOOL) --mode=finish $(DESTDIR)$(libdir)

uninstall-lib:	
	$(LIBTOOL) --mode=uninstall rm -f $(DESTDIR)$(libdir)/libldns.la
	test ! -d $(DESTDIR)$(libdir) || rmdir -p $(DESTDIR)$(libdir) || echo "ok, dir already gone"

install-pyldns: 
	$(INSTALL) -m 755 -d $(DESTDIR)$(python_site)/ldns
	$(INSTALL) -c -m 644 $(pywrapdir)/ldns.py $(DESTDIR)$(python_site)/ldns.py
	$(LIBTOOL) --mode=install cp _ldns.la $(DESTDIR)$(python_site)
	$(LIBTOOL) --mode=finish $(DESTDIR)$(python_site)

uninstall-pyldns:	
	rm -f $(DESTDIR)$(python_site)/ldns/*
	test ! -d $(DESTDIR)$(python_site)/ldns || rmdir $(DESTDIR)$(python_site)/ldns || echo "ok, dir already gone"

install-pyldnsx:
	$(INSTALL) -c -m 644 $(pyldnsxwrapdir)/ldnsx.py $(DESTDIR)$(python_site)/ldnsx.py

uninstall-pyldnsx:
	rm -f $(DESTDIR)$(python_site)/ldnsx.py

clean-manpages:
	for m in `cat $(srcdir)/ldns/*.h | $(srcdir)/doc/doxyparse.pl -m $(srcdir)/doc/function_manpages 2>&1 | grep -v ^doxygen | grep -v ^cat` ; do\
		rm -f doc/man/man3/$${m}.3 ; done
	rm -f doc/ldns_manpages
	test ! -d doc/man/man3 || rmdir -p doc/man/man3 || :

clean-lib:
	$(LIBTOOL) --mode clean rm -f $(LDNS_LOBJS) $(LIBLOBJS)
	$(LIBTOOL) --mode clean rm -f linktest libldns.la
	$(LIBTOOL) --mode clean rm -f $(pywrapdir)/ldns_wrapper.c
	$(LIBTOOL) --mode clean rm -f $(pywrapdir)/ldns.py

clean: clean-drill clean-examples  clean-manpages clean-lib  putdown-builddir

realclean: clean docclean
	rm -f config.status
	rm -f config.log
	rm -f $(CONFIG_FILES)
	rm -f ldns/config.h
	if test -d packaging -a ! -f packaging/ldns-config.in ; then \
            rmdir packaging || : ; fi
	rm -f libtool
	if test -d ldns ; then \
		echo "is builddir srcdir" > ldns/YES ; \
                if test -f $(srcdir)/ldns/YES ; then \
			echo Leaving headers files because srcdir == builddir;\
			rm -f ldns/YES; \
		else \
                        echo Removing header files in builddir;\
			for f in `(cd $(srcdir); echo ldns/*.h)`; do \
				rm -f $$f ; done ; \
			rm -f ldns/YES; \
			test ! -d ldns || rmdir ldns || : ; \
                fi ;\
	fi

docclean:
	rm -rf doc/html/
	rm -rf doc/man/
	rm -rf doc/latex/
	rm -f doc/*.txt
	rm -f doc/*.tex
	rm -f doc/ldns_manpages

distclean: realclean
	rm -fr autom4te.cache 
	rm -f config.guess config.sub configure ltmain.sh ldns/config.h.in

## No need for changes here

lint: lint-lib lint-drill lint-examples
lint-lib:
	for i in $(srcdir)/*.c; do \
		$(LINT) $(LINTFLAGS) -I. -I$(srcdir) $(srcdir)/$$i ; \
		if test $$? -ne 0 ; then exit 1 ; fi ; \
	done

lint-drill:
	for i in $(srcdir)/drill/*.c; do \
		$(LINT) $(LINTFLAGS) -I. -I$(srcdir) $(srcdir)/$$i ; \
		if test $$? -ne 0 ; then exit 1 ; fi ; \
	done

lint-examples:
	for i in $(srcdir)/examples/*.c; do \
		$(LINT) $(LINTFLAGS) -I. -I$(srcdir) $(srcdir)/$$i ; \
		if test $$? -ne 0 ; then exit 1 ; fi ; \
	done

tags:	$(srcdir)/*.c ldns/*.[ch]
	ctags  -f $(srcdir)/tags $(srcdir)/*.[ch] ldns/*.[ch]

allclean: test-clean clean

test-clean:
	tpkg -b test clean

test: 
	if test -x "`which bash`"; then bash test/test_all.sh; else sh test/test_all.sh; fi


# Recreate symbols file, only needed when API changes
# make clean first (and after this make clean; make again)
symbols: lib-export-all
	nm -g lib/libldns.so | cut -d " " -f 3 | grep ldns | sort > $(srcdir)/ldns_symbols.def

TMP_FILE=temporary.tmp
sources:
	for mf in $(srcdir)/Makefile.in Makefile ; do \
		if test -e $$mf ; then \
			cp $$mf $$mf.bak ;\
			sed 	-e 's/^LDNS_LOBJS[ 	]*=.*$$/LDNS_LOBJS	= '"`(cd $(srcdir); ls -1 *.c | egrep -v '$(LDNS_LOBJS_EX)' | sed 's/\.c/\.lo/g' | tr '\n' ' ')`"'/g' \
				-e 's/^LDNS_HEADERS[ 	]*=.*$$/LDNS_HEADERS	= '"`(cd $(srcdir)/ldns; ls -1 *.h | egrep -v '$(LDNS_HEADERS_EX)' | tr '\n' ' ')`"'/g' \
				-e 's?^PYLDNS_I_FILES[ 	]*=.*$$?PYLDNS_I_FILES	= '"`(cd $(srcdir)/contrib; echo python/*.i | sed 's/python/\$$(pywrapdir)/g')`"'?g' \
				-e 's?^DRILL_LOBJS[ 	]*=.*$$?DRILL_LOBJS	= '"`(cd $(srcdir); echo drill/*.c | sed 's/\.c/\.lo/g')`"'?g' \
				-e 's?^EXAMPLE_LOBJS[ 	]*=.*$$?EXAMPLE_LOBJS	= '"`(cd $(srcdir); echo examples/*.c | sed 's/\.c/\.lo/g')`"'?g' \
				-e 's?^EXAMPLE_PROGS[ 	]*=.*$$?EXAMPLE_PROGS	= '"`(cd $(srcdir); ls -1 examples/*.c | egrep -v '$(EXAMPLE_PROGS_EX)' | sed 's/\.c//g' | tr '\n' ' ')`"'?g' \
				-e 's?^EX_PROGS_BASENM[ 	]*=.*$$?EX_PROGS_BASENM	= '"`(cd $(srcdir); ls -1 examples/*.c | sed -e 's/\.c//g' -e 's?examples/??g' | tr '\n' ' ')`"'?g' \
				$$mf > $(TMP_FILE) ;\
			mv $(TMP_FILE) $$mf ;\
		fi;\
	done


# dependency generation
DEPEND_TMP=depend1073.tmp
DEPEND_TMP2=depend1074.tmp
DEPEND_TARGET=Makefile
DEPEND_TARGET2=$(srcdir)/Makefile.in
# actions: generate deplines from gcc,
# then, filter out home/xx, /usr/xx and /opt/xx lines (some cc already do this)
# then, remove empty " \" lines
# then, add srcdir before .c and .h in deps.
# then, remove srcdir from the (generated) parser and lexer.
# and mention the .lo
depend:
	if test ! -e config.h ; then ln -s ldns/config.h . ; fi
	echo "" > $(DEPEND_TMP)
	for builddir in `pwd` ; do \
		for subdir in . compat examples drill; do \
			(cd $(srcdir) ; $(CC) $(DEPFLAG) $(CPPFLAGS) $(CFLAGS) -I$$builddir -I$$subdir $$subdir/*.c) | \
			sed -e 's!'$$HOME'[^ ]* !!g' -e 's!'$$HOME'[^ ]*$$!!g' \
				-e 's!/usr[^ ]* !!g' -e 's!/usr[^ ]*$$!!g' \
				-e 's!/opt[^ ]* !!g' -e 's!/opt[^ ]*$$!!g' | \
			sed -e '/^ \\$$/d' | \
			sed -e 's? *\([^ ]*\.[ch]\)? $$(srcdir)/\1?g' | \
			sed -e 's? *\([^ ]*\.inc\)? $$(srcdir)/\1?g' | \
			sed     -e 's?$$(srcdir)/ldns/config.h?ldns/config.h?g' \
				-e 's?$$(srcdir)/config.h?ldns/config.h?g' \
				-e 's?$$(srcdir)/ldns/common.h?ldns/common.h?g' \
				-e 's?$$(srcdir)/ldns/util.h?ldns/util.h?g' \
				-e 's?$$(srcdir)/ldns/net.h?ldns/net.h?g' \
				-e 's!\(.*\)\.o[ :]*!'"$$subdir/"'\1.lo '"$$subdir/"'\1.o: !g' \
				-e 's?^\.\/??g' -e 's? \.\/? ?g' \
				>> $(DEPEND_TMP) ;\
		done; \
	done
	for p in $(EXAMPLE_PROGS) $(LDNS_DPA) $(LDNS_DANE) $(EX_SSL_PROGS); do \
		echo "$$p: $$p.lo $$p.o \$$(LIB)" >> $(DEPEND_TMP) ; done
	echo "$(TESTNS): `for o in $(TESTNS_LOBJS) ; do \
				echo -n "$$o $${o%lo}o " ; done` \$$(LIB)" \
			       	>> $(DEPEND_TMP)
	cp $(DEPEND_TARGET) $(DEPEND_TMP2)
	head -`egrep -n "# Dependencies" $(DEPEND_TARGET) | tail -1 | sed -e 's/:.*$$//'` $(DEPEND_TMP2) > $(DEPEND_TARGET)
	cat $(DEPEND_TMP) >> $(DEPEND_TARGET)
	@if diff $(DEPEND_TARGET) $(DEPEND_TMP2); then echo "	$(DEPEND_TARGET) unchanged"; else echo "	Updated $(DEPEND_TARGET))"; fi
	@if test -f $(DEPEND_TARGET2); then \
		cp $(DEPEND_TARGET2) $(DEPEND_TMP2); \
		head -`egrep -n "# Dependencies" $(DEPEND_TARGET2) | tail -1 | sed -e 's/:.*$$//'` $(DEPEND_TMP2) > $(DEPEND_TARGET2); \
		cat $(DEPEND_TMP) >> $(DEPEND_TARGET2); \
		if diff $(DEPEND_TARGET2) $(DEPEND_TMP2); then echo "   $(DEPEND_TARGET2) unchanged"; else echo "       Updated $(DEPEND_TARGET2))"; fi; \
	fi
	rm -f $(DEPEND_TMP) $(DEPEND_TMP2)

# Dependencies

buffer.lo buffer.o: $(srcdir)/buffer.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
dane.lo dane.o: $(srcdir)/dane.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
dname.lo dname.o: $(srcdir)/dname.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
dnssec.lo dnssec.o: $(srcdir)/dnssec.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
dnssec_sign.lo dnssec_sign.o: $(srcdir)/dnssec_sign.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
dnssec_verify.lo dnssec_verify.o: $(srcdir)/dnssec_verify.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
dnssec_zone.lo dnssec_zone.o: $(srcdir)/dnssec_zone.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
duration.lo duration.o: $(srcdir)/duration.c ldns/config.h $(srcdir)/ldns/duration.h
error.lo error.o: $(srcdir)/error.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
higher.lo higher.o: $(srcdir)/higher.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
host2str.lo host2str.o: $(srcdir)/host2str.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
host2wire.lo host2wire.o: $(srcdir)/host2wire.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
keys.lo keys.o: $(srcdir)/keys.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
linktest.lo linktest.o: $(srcdir)/linktest.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
net.lo net.o: $(srcdir)/net.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
packet.lo packet.o: $(srcdir)/packet.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
parse.lo parse.o: $(srcdir)/parse.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
radix.lo radix.o: $(srcdir)/radix.c ldns/config.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/error.h ldns/util.h \
 ldns/common.h
rbtree.lo rbtree.o: $(srcdir)/rbtree.c ldns/config.h $(srcdir)/ldns/rbtree.h ldns/util.h ldns/common.h
rdata.lo rdata.o: $(srcdir)/rdata.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
resolver.lo resolver.o: $(srcdir)/resolver.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
rr.lo rr.o: $(srcdir)/rr.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
rr_functions.lo rr_functions.o: $(srcdir)/rr_functions.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
sha1.lo sha1.o: $(srcdir)/sha1.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
sha2.lo sha2.o: $(srcdir)/sha2.c ldns/config.h $(srcdir)/ldns/sha2.h
str2host.lo str2host.o: $(srcdir)/str2host.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
tsig.lo tsig.o: $(srcdir)/tsig.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
update.lo update.o: $(srcdir)/update.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
util.lo util.o: $(srcdir)/util.c ldns/config.h $(srcdir)/ldns/rdata.h ldns/common.h $(srcdir)/ldns/error.h \
 ldns/util.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/buffer.h
wire2host.lo wire2host.o: $(srcdir)/wire2host.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
zone.lo zone.o: $(srcdir)/zone.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
compat/b64_ntop.lo compat/b64_ntop.o: $(srcdir)/compat/b64_ntop.c ldns/config.h
compat/b64_pton.lo compat/b64_pton.o: $(srcdir)/compat/b64_pton.c ldns/config.h
compat/calloc.lo compat/calloc.o: $(srcdir)/compat/calloc.c ldns/config.h
compat/ctime_r.lo compat/ctime_r.o: $(srcdir)/compat/ctime_r.c ldns/config.h
compat/fake-rfc2553.lo compat/fake-rfc2553.o: $(srcdir)/compat/fake-rfc2553.c ldns/config.h ldns/common.h \
 $(srcdir)/compat/fake-rfc2553.h
compat/gmtime_r.lo compat/gmtime_r.o: $(srcdir)/compat/gmtime_r.c ldns/config.h
compat/inet_aton.lo compat/inet_aton.o: $(srcdir)/compat/inet_aton.c ldns/config.h
compat/inet_ntop.lo compat/inet_ntop.o: $(srcdir)/compat/inet_ntop.c ldns/config.h
compat/inet_pton.lo compat/inet_pton.o: $(srcdir)/compat/inet_pton.c ldns/config.h
compat/isascii.lo compat/isascii.o: $(srcdir)/compat/isascii.c ldns/config.h
compat/isblank.lo compat/isblank.o: $(srcdir)/compat/isblank.c ldns/config.h
compat/localtime_r.lo compat/localtime_r.o: $(srcdir)/compat/localtime_r.c ldns/config.h
compat/malloc.lo compat/malloc.o: $(srcdir)/compat/malloc.c ldns/config.h
compat/memmove.lo compat/memmove.o: $(srcdir)/compat/memmove.c ldns/config.h
compat/realloc.lo compat/realloc.o: $(srcdir)/compat/realloc.c ldns/config.h
compat/snprintf.lo compat/snprintf.o: $(srcdir)/compat/snprintf.c ldns/config.h
compat/strlcpy.lo compat/strlcpy.o: $(srcdir)/compat/strlcpy.c ldns/config.h
compat/timegm.lo compat/timegm.o: $(srcdir)/compat/timegm.c ldns/config.h
examples/ldns-chaos.lo examples/ldns-chaos.o: $(srcdir)/examples/ldns-chaos.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-compare-zones.lo examples/ldns-compare-zones.o: $(srcdir)/examples/ldns-compare-zones.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-dane.lo examples/ldns-dane.o: $(srcdir)/examples/ldns-dane.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldnsd.lo examples/ldnsd.o: $(srcdir)/examples/ldnsd.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h \
 $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h \
 $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h \
 $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-dpa.lo examples/ldns-dpa.o: $(srcdir)/examples/ldns-dpa.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h $(srcdir)/examples/ldns-dpa.h
examples/ldns-gen-zone.lo examples/ldns-gen-zone.o: $(srcdir)/examples/ldns-gen-zone.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-key2ds.lo examples/ldns-key2ds.o: $(srcdir)/examples/ldns-key2ds.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-keyfetcher.lo examples/ldns-keyfetcher.o: $(srcdir)/examples/ldns-keyfetcher.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-keygen.lo examples/ldns-keygen.o: $(srcdir)/examples/ldns-keygen.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-mx.lo examples/ldns-mx.o: $(srcdir)/examples/ldns-mx.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-notify.lo examples/ldns-notify.o: $(srcdir)/examples/ldns-notify.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-nsec3-hash.lo examples/ldns-nsec3-hash.o: $(srcdir)/examples/ldns-nsec3-hash.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-read-zone.lo examples/ldns-read-zone.o: $(srcdir)/examples/ldns-read-zone.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-resolver.lo examples/ldns-resolver.o: $(srcdir)/examples/ldns-resolver.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-revoke.lo examples/ldns-revoke.o: $(srcdir)/examples/ldns-revoke.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-rrsig.lo examples/ldns-rrsig.o: $(srcdir)/examples/ldns-rrsig.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-signzone.lo examples/ldns-signzone.o: $(srcdir)/examples/ldns-signzone.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-test-edns.lo examples/ldns-test-edns.o: $(srcdir)/examples/ldns-test-edns.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-testns.lo examples/ldns-testns.o: $(srcdir)/examples/ldns-testns.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h $(srcdir)/examples/ldns-testpkts.h
examples/ldns-testpkts.lo examples/ldns-testpkts.o: $(srcdir)/examples/ldns-testpkts.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h \
 $(srcdir)/examples/ldns-testpkts.h
examples/ldns-update.lo examples/ldns-update.o: $(srcdir)/examples/ldns-update.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-verify-zone.lo examples/ldns-verify-zone.o: $(srcdir)/examples/ldns-verify-zone.c ldns/config.h $(srcdir)/ldns/ldns.h \
 ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h \
 $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h \
 $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h \
 $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h \
 $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h \
 $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h \
 $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-version.lo examples/ldns-version.o: $(srcdir)/examples/ldns-version.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-walk.lo examples/ldns-walk.o: $(srcdir)/examples/ldns-walk.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-zcat.lo examples/ldns-zcat.o: $(srcdir)/examples/ldns-zcat.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-zsplit.lo examples/ldns-zsplit.o: $(srcdir)/examples/ldns-zsplit.c ldns/config.h $(srcdir)/ldns/ldns.h ldns/util.h \
 ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h \
 $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h \
 $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h \
 $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h \
 $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
drill/chasetrace.lo drill/chasetrace.o: $(srcdir)/drill/chasetrace.c $(srcdir)/drill/drill.h ldns/config.h \
 $(srcdir)/drill/drill_util.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h \
 $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h \
 $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h \
 $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h \
 $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h \
 $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
drill/dnssec.lo drill/dnssec.o: $(srcdir)/drill/dnssec.c $(srcdir)/drill/drill.h ldns/config.h $(srcdir)/drill/drill_util.h \
 $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h \
 $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h \
 $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h \
 $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h \
 $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h \
 ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h \
 $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
drill/drill.lo drill/drill.o: $(srcdir)/drill/drill.c $(srcdir)/drill/drill.h ldns/config.h $(srcdir)/drill/drill_util.h \
 $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h \
 $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h \
 $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h \
 $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h \
 $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h \
 ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h \
 $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
drill/drill_util.lo drill/drill_util.o: $(srcdir)/drill/drill_util.c $(srcdir)/drill/drill.h ldns/config.h \
 $(srcdir)/drill/drill_util.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h \
 $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h \
 $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h \
 $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h \
 $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h \
 $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
drill/error.lo drill/error.o: $(srcdir)/drill/error.c $(srcdir)/drill/drill.h ldns/config.h $(srcdir)/drill/drill_util.h \
 $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h \
 $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h \
 $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h \
 $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h \
 $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h \
 ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h \
 $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
drill/root.lo drill/root.o: $(srcdir)/drill/root.c $(srcdir)/drill/drill.h ldns/config.h $(srcdir)/drill/drill_util.h \
 $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h \
 $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h \
 $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h \
 $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h \
 $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h \
 ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h \
 $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
drill/securetrace.lo drill/securetrace.o: $(srcdir)/drill/securetrace.c $(srcdir)/drill/drill.h ldns/config.h \
 $(srcdir)/drill/drill_util.h $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h \
 $(srcdir)/ldns/error.h $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h \
 $(srcdir)/ldns/dnssec.h $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h \
 $(srcdir)/ldns/tsig.h $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h \
 $(srcdir)/ldns/dnssec_verify.h $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h \
 $(srcdir)/ldns/host2wire.h ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h \
 $(srcdir)/ldns/wire2host.h $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h \
 $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
drill/work.lo drill/work.o: $(srcdir)/drill/work.c $(srcdir)/drill/drill.h ldns/config.h $(srcdir)/drill/drill_util.h \
 $(srcdir)/ldns/ldns.h ldns/util.h ldns/common.h $(srcdir)/ldns/buffer.h $(srcdir)/ldns/error.h \
 $(srcdir)/ldns/dane.h $(srcdir)/ldns/rdata.h $(srcdir)/ldns/rr.h $(srcdir)/ldns/dname.h $(srcdir)/ldns/dnssec.h \
 $(srcdir)/ldns/packet.h $(srcdir)/ldns/keys.h $(srcdir)/ldns/zone.h $(srcdir)/ldns/resolver.h $(srcdir)/ldns/tsig.h \
 $(srcdir)/ldns/dnssec_zone.h $(srcdir)/ldns/rbtree.h $(srcdir)/ldns/host2str.h $(srcdir)/ldns/dnssec_verify.h \
 $(srcdir)/ldns/dnssec_sign.h $(srcdir)/ldns/duration.h $(srcdir)/ldns/higher.h $(srcdir)/ldns/host2wire.h \
 ldns/net.h $(srcdir)/ldns/str2host.h $(srcdir)/ldns/update.h $(srcdir)/ldns/wire2host.h \
 $(srcdir)/ldns/rr_functions.h $(srcdir)/ldns/parse.h $(srcdir)/ldns/radix.h $(srcdir)/ldns/sha1.h $(srcdir)/ldns/sha2.h
examples/ldns-chaos: examples/ldns-chaos.lo examples/ldns-chaos.o $(LIB)
examples/ldns-compare-zones: examples/ldns-compare-zones.lo examples/ldns-compare-zones.o $(LIB)
examples/ldnsd: examples/ldnsd.lo examples/ldnsd.o $(LIB)
examples/ldns-gen-zone: examples/ldns-gen-zone.lo examples/ldns-gen-zone.o $(LIB)
examples/ldns-key2ds: examples/ldns-key2ds.lo examples/ldns-key2ds.o $(LIB)
examples/ldns-keyfetcher: examples/ldns-keyfetcher.lo examples/ldns-keyfetcher.o $(LIB)
examples/ldns-keygen: examples/ldns-keygen.lo examples/ldns-keygen.o $(LIB)
examples/ldns-mx: examples/ldns-mx.lo examples/ldns-mx.o $(LIB)
examples/ldns-notify: examples/ldns-notify.lo examples/ldns-notify.o $(LIB)
examples/ldns-read-zone: examples/ldns-read-zone.lo examples/ldns-read-zone.o $(LIB)
examples/ldns-resolver: examples/ldns-resolver.lo examples/ldns-resolver.o $(LIB)
examples/ldns-rrsig: examples/ldns-rrsig.lo examples/ldns-rrsig.o $(LIB)
examples/ldns-test-edns: examples/ldns-test-edns.lo examples/ldns-test-edns.o $(LIB)
examples/ldns-update: examples/ldns-update.lo examples/ldns-update.o $(LIB)
examples/ldns-version: examples/ldns-version.lo examples/ldns-version.o $(LIB)
examples/ldns-walk: examples/ldns-walk.lo examples/ldns-walk.o $(LIB)
examples/ldns-zcat: examples/ldns-zcat.lo examples/ldns-zcat.o $(LIB)
examples/ldns-zsplit: examples/ldns-zsplit.lo examples/ldns-zsplit.o $(LIB)
examples/ldns-dpa: examples/ldns-dpa.lo examples/ldns-dpa.o $(LIB)
examples/ldns-dane: examples/ldns-dane.lo examples/ldns-dane.o $(LIB)
examples/ldns-nsec3-hash: examples/ldns-nsec3-hash.lo examples/ldns-nsec3-hash.o $(LIB)
examples/ldns-revoke: examples/ldns-revoke.lo examples/ldns-revoke.o $(LIB)
examples/ldns-signzone: examples/ldns-signzone.lo examples/ldns-signzone.o $(LIB)
examples/ldns-verify-zone: examples/ldns-verify-zone.lo examples/ldns-verify-zone.o $(LIB)
examples/ldns-testns: examples/ldns-testns.lo examples/ldns-testns.o examples/ldns-testpkts.lo examples/ldns-testpkts.o  $(LIB)
