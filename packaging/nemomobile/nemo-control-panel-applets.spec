Summary: Nemo mobile control panel plugins
Name: nemo-control-panel-applets
Version: 0.1
Release: 1
License: GPLv2
Group: System/UI
BuildArch: noarch
URL: https://github.com/nemomobile/nemo-control-panel-applets
Source0: %{name}-%{version}.tar.bz2
Requires: nemo-control-panel

%description
Nemo Mobile QML control panel applets

%define qml_dir %{_libdir}/qt4/imports
%define plugins_dir %{_datadir}/duicontrolpanel
%define shortcuts_dir %{_libdir}/duicontrolpanel
%define media_dir %{_datadir}/themes/blanco/meegotouch

%prep
%setup -q -n %{name}-%{version}

%build


%install
rm -rf %{buildroot}
%make_install LIBDIR=%{_libdir} DATADIR=%{_datadir}

%clean
rm -rf %{buildroot}

%package -n nemo-control-panel-common
Summary: Data shared by control panel applets
Group: System/UI
%description -n nemo-control-panel-common
%{summary}

%package -n nemo-control-panel-applet-power
Summary:    Power control panel applet
Group:      System/UI
Requires: contextkit-qml, contextkit-plugin-power
Requires: nemo-control-panel-common = %{version}
%description -n nemo-control-panel-applet-power
%{summary}

%files -n nemo-control-panel-common
%defattr(-,root,root,-)
%{qml_dir}/org/nemomobile/controlpanel/*.qml
%{qml_dir}/org/nemomobile/controlpanel/qmldir
%{media_dir}/icons/*.svg

%files -n nemo-control-panel-applet-power
%defattr(-,root,root,-)
%{shortcuts_dir}/nemo-cp-power.desktop
%{plugins_dir}/power/*.qml
