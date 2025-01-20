// this is 0/1 knapsack
// brute force approach
// with TC of O(2^n)

#include <stdio.h>
#include <limits.h>

int max(int a, int b) {
    return (a > b) ? a : b;
}
// index = size-1;
int knapsack(int W, int wt[], int val[], int index) {
    if(index == 0) { // base case
        if(wt[0] <= W) {
            return val[0];
        }
        return 0;
    }
    int notTake = knapsack(W, wt, val, index-1);
    int take = INT_MIN;
    if(wt[index] <= W) {
        take = val[index] + knapsack(W-wt[index],wt,val,index-1);
    }
    return max(take,notTake);
}

int main() {
    int val[] = {60, 100, 120};
    int wt[] = {10, 20, 30};
    int W = 50;
    int maxValue = knapsack(W, wt, val, 2);
    printf("Maximum value in Knapsack = %d\n", maxValue);
    return 0;
}