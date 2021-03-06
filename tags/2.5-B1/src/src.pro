TEMPLATE = app
unix:TARGET = launchy
win32:TARGET = Launchy
CONFIG += debug_and_release
PRECOMPILED_HEADER = precompiled.h

# CONFIG += qt release
INCLUDEPATH += ../common
QT += network
SOURCES = main.cpp \
    globals.cpp \
    options.cpp \
    catalog.cpp \
    catalog_builder.cpp \
    plugin_handler.cpp \
    platform_base_hotkey.cpp \
    icon_delegate.cpp \
    plugin_interface.cpp \
    catalog_types.cpp \
    icon_extractor.cpp \
    ../common/FileBrowserDelegate.cpp \
    ../common/FileBrowser.cpp \
    ../common/DropListWidget.cpp \
    Fader.cpp \
    CharListWidget.cpp \
    CharLineEdit.cpp \
    CommandHistory.cpp \
    InputDataList.cpp \
    FileSearch.cpp
HEADERS = platform_base.h \
    globals.h \
    globals.h \
    main.h \
    catalog.h \
    catalog_builder.h \
    plugin_interface.h \
    plugin_handler.h \
    options.h \
    catalog_types.h \
    icon_delegate.h \
    icon_extractor.h \
    ../common/FileBrowserDelegate.h \
    ../common/FileBrowser.h \
    ../common/DropListWidget.h \
    CharListWidget.h \
    CharLineEdit.h \
    Fader.h \
    precompiled.h \
    CommandHistory.h \
    InputDataList.h \
    FileSearch.h
ICON = Launchy.ico
first.target = blah
unix { 
    FORMS = options.ui
    PREFIX = /usr
    DEFINES += SKINS_PATH=\\\"$$PREFIX/share/launchy/skins/\\\" \
        PLUGINS_PATH=\\\"$$PREFIX/lib/launchy/plugins/\\\" \
        PLATFORMS_PATH=\\\"$$PREFIX/lib/launchy/\\\"
    if(!debug_and_release|build_pass) { 
        CONFIG(debug, debug|release):DESTDIR = ../debug/
        CONFIG(release, debug|release):DESTDIR = ../release/
    }
    target.path = $$PREFIX/bin/
    skins.path = $$PREFIX/share/launchy/skins/
    skins.files = ../skins/*
    icon.path = $$PREFIX/share/pixmaps
    icon.files = ../misc/Launchy_Icon/launchy_icon.png
    desktop.path = $$PREFIX/share/applications/
    desktop.files = ../linux/launchy.desktop
    INSTALLS += target \
        skins \
        icon \
        desktop
}
win32 { 
    if(!debug_and_release|build_pass):CONFIG(debug, debug|release):CONFIG += console
    SOURCES += ../platforms/win/platform_win.cpp \
        ../platforms/win/platform_win_hotkey.cpp \
        ../platforms/win/platform_win_util.cpp \
        ../platforms/win/WinIconProvider.cpp
    HEADERS += ../platforms/win/WinIconProvider.h \
        platform_base_hotkey.h \
        platform_base_hottrigger.h \
        ../platforms/win/platform_win.h \
        ../platforms/win/platform_win_util.h
    CONFIG += embed_manifest_exe
    INCLUDEPATH += c:/boost/
    FORMS = options.ui
    RC_FILE = ../win/launchy.rc
    LIBS += shell32.lib \
        user32.lib \
        gdi32.lib \
        ole32.lib \
        comctl32.lib \
        advapi32.lib \
		userenv.lib \
		netapi32.lib
    DEFINES = VC_EXTRALEAN \
        WIN32 \
        _UNICODE \
        UNICODE \
        WINVER=0x0510 \
        _WIN32_WINNT=0x0510 \
        _WIN32_WINDOWS=0x0510 \
        _WIN32_IE=0x0600
    if(!debug_and_release|build_pass) { 
        CONFIG(debug, debug|release):DESTDIR = ../debug/
        CONFIG(release, debug|release):DESTDIR = ../release/
    }
}
TRANSLATIONS = ../translations/launchy_fr.ts \
    ../translations/launchy_nl.ts \
    ../translations/launchy_zh.ts \
    ../translations/launchy_es.ts \
    ../translations/launchy_de.ts \
    ../translations/launchy_ja.ts
OBJECTS_DIR = build
MOC_DIR = build
RESOURCES += launchy.qrc
