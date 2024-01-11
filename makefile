# Determine the operating system
ifeq ($(OS), Windows_NT)
	RM = del
	EXECUTABLE_EXTENSION = .exe
else
	RM = rm -f
	EXECUTABLE_EXTENSION = 
endif

# Compiler settings
CXX = g++
CXXFLAGS = -std=c++17

# Executable file
EXECUTABLE = program$(EXECUTABLE_EXTENSION)

# Directory structure
OBJ_DIR = obj

# Main target
$(EXECUTABLE): $(OBJ_DIR)/main.o
	g++ -std=c++17 $(OBJ_DIR)/main.o -o $(EXECUTABLE)

# Rule for creating main.o
$(OBJ_DIR)/main.o: main.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@

# Clean target
clean:
	$(RM) $(OBJ_DIR)\*.o $(EXECUTABLE)