.PHONY: help get format analyze build-runner gen-i18n fix-web run-web run-windows

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  get           Run flutter pub get"
	@echo "  format        Run dart format ."
	@echo "  analyze       Run flutter analyze"
	@echo "  build-runner  Run build_runner build"
	@echo "  gen-i18n      Sync translations from CSV to JSON"
	@echo "  fix-web       Apply Isar web fixes"
	@echo "  run-web       Run flutter run -d chrome"
	@echo "  run-windows   Run flutter run -d windows"

get:
	flutter pub get

format:
	dart format .

analyze:
	flutter analyze

build-runner:
	flutter pub run build_runner build --delete-conflicting-outputs

gen-i18n:
	dart run scripts/generate_i18n.dart

fix-web:
	dart run scripts/fix_isar_web_ids.dart

run-web:
	flutter run -d chrome

run-windows:
	flutter run -d windows
