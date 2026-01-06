# ---- Configuration ----
CC      := gcc
CFLAGS  := -std=c11 -Wall -Wextra -Wpedantic -O2 -MMD -MP
LDFLAGS := 
TARGET  := test_assign1

SRC := dberror.c storage_mgr.c test_assign1_1.c
OBJ := $(SRC:.c=.o)
DEP := $(OBJ:.o=.d)

# ---- Default target ----
all: $(TARGET)

# ---- Link ----
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LDFLAGS)

# ---- Compile ----
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# ---- Helpers ----
.PHONY: clean run rebuild

run: $(TARGET)
	./$(TARGET)

rebuild: clean all

clean:
	rm -f $(OBJ) $(DEP) $(TARGET)

# Include auto-generated dependency files (if they exist)
-include $(DEP)
