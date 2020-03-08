THEME_FOLDER:=themes/titef

check_system_dependencies:
	node -v
	hugo version

install_theme_dependencies: check_system_dependencies
	cd ${THEME_FOLDER} && npm install

build_theme: install_theme_dependencies
	cd ${THEME_FOLDER} && npm run build

## build: Build the static site
build: build_theme
	hugo

## develop: Run a server for local development
develop: build_theme
	hugo server

## help: Show help and exit.
help: Makefile
	@echo
	@echo "  Choose a command:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

PHONY: check_system_dependencies,install_theme_dependencies,build_theme,build,develop