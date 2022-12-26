.PHONY: build lstpu

build: 
	if ! [ -d "build" ]; then \
		mkdir build; \
	fi

	cd build && cmake .. -G Ninja \
		-DTEST_BUILD_LSTPU=OFF \
		-DMAX_CORAL_MODE=OFF \
	
	cd build && ninja


lstpu:
	if ! [ -d "build" ]; then \
		mkdir build; \
	fi

	cd build && cmake .. -G Ninja \
		-DTEST_BUILD_LSTPU=ON \
		-DMAX_CORAL_MODE=OFF \
	
	cd build && ninja



