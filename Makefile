######################################################################
# Makefile for fake                                       October 1998
# Horms                                             horms@verge.net.au
#
# Fake
# Script to spoof an ip
# Designed to create redundant servers
# Copyright (C) 1998  Horms <horms@verge.net.au>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330,
######################################################################

ROOT_DIR=
BIN_DIR=$(ROOT_DIR)/usr/sbin
BIN=fake
CONFIG_DIR=$(ROOT_DIR)/etc/fake
CONFIG=.fakerc clear_routers
INSTANCE_CONFIG_DIR=$(ROOT_DIR)/etc/fake/instance_config
INSTANCE_CONFIG=instance_config/203.12.97.7.cfg \
instance_config/192.168.89.19.cfg
MAN8=fake.8 send_arp.8
MAN8_DIR=$(ROOT_DIR)/usr/man/man8
DOC_DIR=$(ROOT_DIR)/usr/doc/fake-1.1.9
DOCS=README AUTHORS COPYING ChangeLog
SUBDIR=send_arp heartbeat

.PHONY: all install clean patch

all: patch
	for i in $(SUBDIR); do make -C $$i all; done

clean: patch
	for i in $(SUBDIR); do make -C $$i clean; done
	make unpatch
	rm -f core send_arp/send_arp.c.orig

install: all
	for i in $(SUBDIR); do make -C $$i install; done
	test -d $(BIN_DIR) || mkdir -p $(BIN_DIR)
	install -c -m 755 $(BIN) $(BIN_DIR)
	test -d $(CONFIG_DIR) || mkdir -p $(CONFIG_DIR)
	install -c -m 644 $(CONFIG) $(CONFIG_DIR)
	test -d $(INSTANCE_CONFIG_DIR) || mkdir -p $(INSTANCE_CONFIG_DIR)
	install -c -m 644 $(INSTANCE_CONFIG) $(INSTANCE_CONFIG_DIR)
	test -d $(DOC_DIR) || mkdir -p $(DOC_DIR)
	install -c -m 644 $(DOCS) $(DOC_DIR)
	test -d $(MAN8_DIR) || mkdir -p $(MAN8_DIR)
	install -c -m 644 $(MAN8) $(MAN8_DIR)

patch:
	cd send_arp ; test -f Makefile ||  \
		( patch -p 1 < ../send_arp.patch ; \
		patch -p 1 < ../send_arp.dev.patch ; \
		patch -p 1 < ../send_arp.l2.patch ; \
		patch -p 1 < ../send_arp.request_reply.patch ; )

unpatch:
	cd send_arp ; test -f Makefile &&  \
		( patch -p 1 -R < ../send_arp.request_reply.patch ; \
		patch -p 1 -R < ../send_arp.l2.patch ; \
		patch -p 1 -R < ../send_arp.dev.patch ; \
		patch -p 1 -R < ../send_arp.patch )
	cd send_arp ; rm -f Makefile

