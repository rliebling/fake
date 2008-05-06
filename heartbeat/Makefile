######################################################################
# Makefile for fake                                       October 2002
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
RESOURCE=fake
HB_RESOURCE_DIR=$(ROOT_DIR)/usr/lib/heartbeat

.PHONY: all install clean

all:

clean:

install: all
	test -d $(HB_RESOURCE_DIR) || mkdir -p $(HB_RESOURCE_DIR)
	install -c -m 755 $(RESOURCE) $(HB_RESOURCE_DIR)
