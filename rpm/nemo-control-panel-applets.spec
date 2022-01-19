Summary: Nemo mobile control panel plugins
Name: nemo-control-panel-applets
Version: 0.1.2
Release: 1
License: GPLv2
Group: System/System Control
BuildArch: noarch
URL: https://github.com/nemomobile/nemo-control-panel-applets
Source0: %{name}-%{version}.tar.bz2
BuildRequires: cmake
Requires: nemo-control-panel

%description
Nemo Mobile QML control panel applets

%define qml_dir %{_libdir}/qt5/imports
%define plugins_dir %{_datadir}/duicontrolpanel
%define shortcuts_dir %{_libdir}/duicontrolpanel

%prep
%setup -q -n %{name}-%{version}

%build
cmake -DCMAKE_INSTALL_PREFIX=%{_prefix} .
make

%install
rm -rf %{buildroot}
%make_install

%package -n nemo-control-panel-common
Summary: Data shared by control panel applets
Group: System/System Control
%description -n nemo-control-panel-common
%{summary}

%package -n nemo-control-panel-applet-power
Summary: Power control panel applet
Group: System/System Control
Requires: nemo-qml-plugin-contextkit, contextkit-plugin-power
Requires: nemo-control-panel
Requires: nemo-control-panel-common = %{version}
Obsoletes: meegotouchcp-battery <= 0.21.13
Provides: meegotouchcp-battery = 0.21.14
%description -n nemo-control-panel-applet-power
%{summary}

%files -n nemo-control-panel-common
%defattr(-,root,root,-)
%{qml_dir}/org/nemomobile/controlpanel/*.qml
%{qml_dir}/org/nemomobile/controlpanel/qmldir

%files -n nemo-control-panel-applet-power
%defattr(-,root,root,-)
%{shortcuts_dir}/nemo-cp-power.desktop
%{plugins_dir}/power/*.qml
