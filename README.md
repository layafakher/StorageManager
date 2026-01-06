## 📌 Overview

This project implements a **Storage Manager** module for a simple Database Management System (DBMS).  
The storage manager is responsible for managing **page-based file I/O**, allowing pages to be read from disk into memory and written back to disk.

This assignment serves as the foundation for later components such as the **Buffer Manager** and **Record Manager**.

---

## 🎯 Objectives

The Storage Manager supports the following functionality:

- Page-based file access with a fixed page size
- Creating, opening, closing, and deleting page files
- Reading pages using both absolute and relative addressing
- Writing pages to disk
- Automatically extending files when capacity is insufficient

---

## 🧱 Core Concepts

### Page Management
- Files are divided into **fixed-size pages** (`PAGE_SIZE`)
- Each page can be read or written independently
- Pages are addressed using page numbers starting from 0

### File Metadata
Each open file is represented by a file handle that stores:
- File name
- Total number of pages
- Current page position
- Internal management information (e.g., file descriptor)

---

## 🗂️ Data Structures

### `SM_FileHandle`

```c
typedef struct SM_FileHandle {
    char *fileName;
    int totalNumPages;
    int curPagePos;
    void *mgmtInfo;
} SM_FileHandle;
````

* Represents an open page file
* `curPagePos` tracks the current read/write position
* `mgmtInfo` is used for internal bookkeeping

### `SM_PageHandle`

```c
typedef char *SM_PageHandle;
```

* Points to a memory region of size `PAGE_SIZE`
* Used as the buffer for reading and writing pages

---

## 🔌 Storage Manager Interface

The Storage Manager implements the interface defined in `storage_mgr.h`.

### File Operations

* `initStorageManager`
* `createPageFile`
* `openPageFile`
* `closePageFile`
* `destroyPageFile`

### Read Operations

* `readBlock`
* `getBlockPos`
* `readFirstBlock`
* `readPreviousBlock`
* `readCurrentBlock`
* `readNextBlock`
* `readLastBlock`

### Write Operations

* `writeBlock`
* `writeCurrentBlock`
* `appendEmptyBlock`
* `ensureCapacity`

All functions return an `RC` (return code) indicating success or the type of error.

---

## ⚠️ Error Handling

* All return codes are defined in `dberror.h`
* On success, functions return `RC_OK`
* Errors such as attempting to read a non-existing page return appropriate error codes
* Error messages can be printed using `printError`

---

## 📁 Project Structure

```
assign1/
├── README.md
├── dberror.c
├── dberror.h
├── storage_mgr.c
├── storage_mgr.h
├── test_assign1_1.c
├── test_helper.h
└── Makefile
```

---

## 🧪 Testing

* The provided test file `test_assign1_1.c` validates:

  * File creation and deletion
  * Page reads and writes
  * Page boundary conditions
* The `Makefile` builds an executable named `test_assign1`
* Additional tests were written to ensure robustness

---

## 🛠️ Build Instructions

```bash
make
```

This will compile all source files and generate the `test_assign1` executable.

---

## ✅ Status

* All required functionalities implemented
* All provided test cases pass successfully
* Code is modular, well-documented, and follows the specified interface

---
