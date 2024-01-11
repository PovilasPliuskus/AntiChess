# Determine the operating system
ifeq ($(OS), Windows_NT)
	RM = del
	EXECUTABLE_EXTENSION = .exe
	MKDIR = mkdir
else
	RM = rm -f
	EXECUTABLE_EXTENSION = 
	MKDIR = mkdir -p
endif

# Compiler settings
CXX = g++
CXXFLAGS = -std=c++17

# Executable file
EXECUTABLE = program$(EXECUTABLE_EXTENSION)

# Directory structure
OBJ_DIR = obj

# Main target
$(EXECUTABLE): $(OBJ_DIR)/main.o | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) $(OBJ_DIR)/main.o -o $(EXECUTABLE)

# Rule for creating main.o
$(OBJ_DIR)/main.o: main.cpp | $(OBJ_DIR)
	$(CXX) -c $(CXXFLAGS) $< -o $@

# Create obj/ directory if it doesn't exist
$(OBJ_DIR):
	$(MKDIR) $(OBJ_DIR)

# Clean target
clean:
	$(RM) $(OBJ_DIR)\*.o $(EXECUTABLE)