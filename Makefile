run:
	mkdir -p build
	cd ./build && \
		cmake .. \
			-G Ninja \
			-D CMAKE_BUILD_TYPE=Release \
			-D LLVM_ENABLE_PROJECTS=clang \
			-D CMAKE_EXPORT_COMPILE_COMMANDS=1 \
			-D CMAKE_CXX_COMPILER=/opt/homebrew/opt/llvm/bin/clang++ && \
		ninja && \
	cd ../
	./build/main