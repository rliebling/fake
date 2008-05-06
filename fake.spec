# Note that this is NOT a relocatable package
%define ver      1.1.8
%define rel      1
%define prefix   /usr

Summary: Switches in redundant servers using arp spoofing
Name: fake
Version: %ver
Release: %rel
Copyright: GPL
Group: Networking/Utilities
Source: http://www.vergenet.net/linux/fake/download/%{ver}/fake-%{ver}.tar.gz
Obsoletes: fake
BuildRoot: /tmp/fake-root
Packager: Horms <horms@verge.net.au>
URL: http://www.vergenet.net/linux/fake/

%description
Fake is a utility that enables the IP address be taken over
by bringing up a second interface on the host machine and
using gratuitous arp. Designed to switch in backup servers
on a LAN.


%prep
%setup -n fake-%{ver}
#%patch -p1

%build
make patch
make CFLAGS="$RPM_OPT_FLAGS -s"

%install
rm -rf $RPM_BUILD_ROOT

make ROOT_DIR=$RPM_BUILD_ROOT MAN8_DIR=$RPM_BUILD_ROOT/%{_mandir}/man8 install

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-, root, root)

%doc AUTHORS 
%doc README
%doc ChangeLog
%doc docs/arp_fun.txt
%doc docs/redundant_linux.txt
%doc instance_config/203.12.97.7.cfg
%doc instance_config/192.168.89.19.cfg
%doc heartbeat/fake

%{prefix}/sbin/*
%{_mandir}/man8/*
%dir /etc/fake
%dir /etc/fake/instance_config
%config /etc/fake/.fakerc
%config /etc/fake/clear_routers
%{prefix}/lib/heartbeat/fake
