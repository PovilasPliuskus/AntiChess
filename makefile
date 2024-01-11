# Executable file
EXECUTABLE = program.exe

# Directory structure
OBJ_DIR = obj

# Main target
$(EXECUTABLE): $(OBJ_DIR)/main.o
	g++ -std=c++17 $(OBJ_DIR)/main.o -o $(EXECUTABLE)

# Rule for creating main.o
$(OBJ_DIR)/main.o: main.cpp
	g++ -c $< -o $@

# Clean target
clean:
	del $(OBJ_DIR)\*.o $(EXECUTABLE)