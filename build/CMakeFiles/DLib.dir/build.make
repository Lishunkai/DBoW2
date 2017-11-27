# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bst2017/slam/DBoW2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bst2017/slam/DBoW2/build

# Utility rule file for DLib.

# Include the progress variables for this target.
include CMakeFiles/DLib.dir/progress.make

CMakeFiles/DLib: CMakeFiles/DLib-complete

CMakeFiles/DLib-complete: dependencies/src/DLib-stamp/DLib-install
CMakeFiles/DLib-complete: dependencies/src/DLib-stamp/DLib-mkdir
CMakeFiles/DLib-complete: dependencies/src/DLib-stamp/DLib-download
CMakeFiles/DLib-complete: dependencies/src/DLib-stamp/DLib-update
CMakeFiles/DLib-complete: dependencies/src/DLib-stamp/DLib-patch
CMakeFiles/DLib-complete: dependencies/src/DLib-stamp/DLib-configure
CMakeFiles/DLib-complete: dependencies/src/DLib-stamp/DLib-build
CMakeFiles/DLib-complete: dependencies/src/DLib-stamp/DLib-install
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bst2017/slam/DBoW2/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Completed 'DLib'"
	/usr/bin/cmake -E make_directory /home/bst2017/slam/DBoW2/build/CMakeFiles
	/usr/bin/cmake -E touch /home/bst2017/slam/DBoW2/build/CMakeFiles/DLib-complete
	/usr/bin/cmake -E touch /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-stamp/DLib-done

dependencies/src/DLib-stamp/DLib-install: dependencies/src/DLib-stamp/DLib-build
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bst2017/slam/DBoW2/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing install step for 'DLib'"
	cd /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-build && $(MAKE) install
	cd /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-build && /usr/bin/cmake -E touch /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-stamp/DLib-install

dependencies/src/DLib-stamp/DLib-mkdir:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bst2017/slam/DBoW2/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Creating directories for 'DLib'"
	/usr/bin/cmake -E make_directory /home/bst2017/slam/DBoW2/build/dependencies/src/DLib
	/usr/bin/cmake -E make_directory /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-build
	/usr/bin/cmake -E make_directory /home/bst2017/slam/DBoW2/build/dependencies/install
	/usr/bin/cmake -E make_directory /home/bst2017/slam/DBoW2/build/dependencies/tmp
	/usr/bin/cmake -E make_directory /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-stamp
	/usr/bin/cmake -E make_directory /home/bst2017/slam/DBoW2/build/dependencies/src
	/usr/bin/cmake -E touch /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-stamp/DLib-mkdir

dependencies/src/DLib-stamp/DLib-download: dependencies/src/DLib-stamp/DLib-gitinfo.txt
dependencies/src/DLib-stamp/DLib-download: dependencies/src/DLib-stamp/DLib-mkdir
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bst2017/slam/DBoW2/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing download step (git clone) for 'DLib'"
	cd /home/bst2017/slam/DBoW2/build/dependencies/src && /usr/bin/cmake -P /home/bst2017/slam/DBoW2/build/dependencies/tmp/DLib-gitclone.cmake
	cd /home/bst2017/slam/DBoW2/build/dependencies/src && /usr/bin/cmake -E touch /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-stamp/DLib-download

dependencies/src/DLib-stamp/DLib-update: dependencies/src/DLib-stamp/DLib-download
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bst2017/slam/DBoW2/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing update step for 'DLib'"
	cd /home/bst2017/slam/DBoW2/build/dependencies/src/DLib && /usr/bin/cmake -P /home/bst2017/slam/DBoW2/build/dependencies/tmp/DLib-gitupdate.cmake

dependencies/src/DLib-stamp/DLib-patch: dependencies/src/DLib-stamp/DLib-download
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bst2017/slam/DBoW2/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "No patch step for 'DLib'"
	/usr/bin/cmake -E touch /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-stamp/DLib-patch

dependencies/src/DLib-stamp/DLib-configure: dependencies/tmp/DLib-cfgcmd.txt
dependencies/src/DLib-stamp/DLib-configure: dependencies/src/DLib-stamp/DLib-update
dependencies/src/DLib-stamp/DLib-configure: dependencies/src/DLib-stamp/DLib-patch
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bst2017/slam/DBoW2/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing configure step for 'DLib'"
	cd /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-build && /usr/bin/cmake -DCMAKE_INSTALL_PREFIX=/home/bst2017/slam/DBoW2/build/dependencies/install "-GUnix Makefiles" /home/bst2017/slam/DBoW2/build/dependencies/src/DLib
	cd /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-build && /usr/bin/cmake -E touch /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-stamp/DLib-configure

dependencies/src/DLib-stamp/DLib-build: dependencies/src/DLib-stamp/DLib-configure
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bst2017/slam/DBoW2/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing build step for 'DLib'"
	cd /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-build && $(MAKE)
	cd /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-build && /usr/bin/cmake -E touch /home/bst2017/slam/DBoW2/build/dependencies/src/DLib-stamp/DLib-build

DLib: CMakeFiles/DLib
DLib: CMakeFiles/DLib-complete
DLib: dependencies/src/DLib-stamp/DLib-install
DLib: dependencies/src/DLib-stamp/DLib-mkdir
DLib: dependencies/src/DLib-stamp/DLib-download
DLib: dependencies/src/DLib-stamp/DLib-update
DLib: dependencies/src/DLib-stamp/DLib-patch
DLib: dependencies/src/DLib-stamp/DLib-configure
DLib: dependencies/src/DLib-stamp/DLib-build
DLib: CMakeFiles/DLib.dir/build.make
.PHONY : DLib

# Rule to build all files generated by this target.
CMakeFiles/DLib.dir/build: DLib
.PHONY : CMakeFiles/DLib.dir/build

CMakeFiles/DLib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/DLib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/DLib.dir/clean

CMakeFiles/DLib.dir/depend:
	cd /home/bst2017/slam/DBoW2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bst2017/slam/DBoW2 /home/bst2017/slam/DBoW2 /home/bst2017/slam/DBoW2/build /home/bst2017/slam/DBoW2/build /home/bst2017/slam/DBoW2/build/CMakeFiles/DLib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DLib.dir/depend

