genapi:
	cd domain && ls . && \
	rm -rf lib/api && \
	dart run build_runner build
