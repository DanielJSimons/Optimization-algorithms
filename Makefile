CC = gcc
CFLAGS = -Iinclude -Wall -Werror -std=c11
SRCDIR = src\linear_programming
OBJDIR = obj
BINDIR = bin

# Executable
EXECUTABLE = $(BINDIR)\linear_programming_example

# Object Files
OBJECTS = $(OBJDIR)\linear_programming_example.o \
	$(OBJDIR)\simplex.o \
	$(OBJDIR)\helper_functions.o

# Compile and link the program
$(EXECUTABLE): $(OBJECTS) | $(BINDIR)
	$(CC) $(OBJECTS) -o $@

# Compile linear_programming_example.c into an object file
$(OBJDIR)\linear_programming_example.o: linear_programming_example.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c linear_programming_example.c -o $@

# Compile simplex.c into an object file
$(OBJDIR)\simplex.o: $(SRCDIR)\simplex.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $(SRCDIR)\simplex.c -o $@

# Compile helper_functions.c into an object file
$(OBJDIR)\helper_functions.o: $(SRCDIR)\helper_functions.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $(SRCDIR)\helper_functions.c -o $@

# Create necessary directories
$(BINDIR) $(OBJDIR):
	if not exist "$@" mkdir $@

# Clean up
clean:
	if exist "$(OBJDIR)\*.o" del "$(OBJDIR)\*.o"
	if exist "$(BINDIR)\linear_programming_example.exe" del "$(BINDIR)\linear_programming_example.exe"

# Phony targets
.PHONY: all clean

# Default target
all: $(EXECUTABLE)
