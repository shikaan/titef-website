THEME_FOLDER:=themes/titef

check_system_dependencies:
	node -v
	hugo check

install_theme_dependencies: check_system_dependencies
	cd ${THEME_FOLDER} && npm install

build_theme: install_theme_dependencies
	cd ${THEME_FOLDER} && npm run build

build: build_theme
	hugo

develop: build_theme
	hugo server

PHONY: check,install,build