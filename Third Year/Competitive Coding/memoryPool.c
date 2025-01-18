#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define POOL_SIZE 1024  // Total pool size in bytes
#define BLOCK_SIZE 16   // Size of each block in the pool

// typedef is a keyword used to create a new name (alias) for an existing data type.
// typedef int Integer; 
// Integer age; 

typedef struct {
    unsigned char pool[POOL_SIZE]; // The memory pool
    int free_list[POOL_SIZE / BLOCK_SIZE]; // Free list (1 = free, 0 = used)
    int block_count;               // Total number of blocks
} MemoryPool;

// Initialize the memory pool
void init_pool(MemoryPool *mp) {
    mp->block_count = POOL_SIZE / BLOCK_SIZE;
    for (int i = 0; i < mp->block_count; i++) {
        mp->free_list[i] = 1; // All blocks are initially free
    }
}

// Allocate memory from the pool
void* pool_alloc(MemoryPool *mp) {
    for (int i = 0; i < mp->block_count; i++) {
        if (mp->free_list[i] == 1) { // Find the first free block
            mp->free_list[i] = 0; // Mark the block as used
            return &(mp->pool[i * BLOCK_SIZE]); // Return a pointer to the block
        }
    }
    return NULL; // No free blocks available
}

// Free memory back to the pool
void pool_free(MemoryPool *mp, void *ptr) {
    if (ptr >= (void*)mp->pool && ptr < (void*)(mp->pool + POOL_SIZE)) {
        int block_index = ((unsigned char*)ptr - mp->pool) / BLOCK_SIZE;
        mp->free_list[block_index] = 1; // Mark the block as free
    }
}

// Example usage
int main() {
    MemoryPool mp;
    init_pool(&mp);

    // Allocate two blocks
    void *block1 = pool_alloc(&mp);
    void *block2 = pool_alloc(&mp);

    if (block1 && block2) {
        printf("Block 1 allocated at address: %p\n", block1);
        printf("Block 2 allocated at address: %p\n", block2);

        // Use the blocks
        strcpy(block1, "Hello");
        strcpy(block2, "World");

        printf("Block 1 content: %s\n", (char*)block1);
        printf("Block 2 content: %s\n", (char*)block2);
    } else {
        printf("Memory allocation failed!\n");
    }

    // Free the blocks
    pool_free(&mp, block1);
    pool_free(&mp, block2);

    return 0;
}
