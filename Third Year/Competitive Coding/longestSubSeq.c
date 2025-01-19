// No DP table
// So expensive with TC of O(2^n)

#include <stdio.h>
#include <string.h>

int longestCommonSubsequenceRec(char* text1, char* text2, int i, int j) {
    // Base case: if either string is empty
    if (i == 0 || j == 0) {
        return 0;
    }
    // If the last characters match
    if (text1[i - 1] == text2[j - 1]) {
        return 1 + longestCommonSubsequenceRec(text1, text2, i - 1, j - 1);
    }
    // If the last characters do not match
    int excludeText1 = longestCommonSubsequenceRec(text1, text2, i - 1, j);
    int excludeText2 = longestCommonSubsequenceRec(text1, text2, i, j - 1);
    return (excludeText1 > excludeText2) ? excludeText1 : excludeText2; // returning maximum of two
}

int main() {
    char text1[] = "abcde";
    char text2[] = "ace";
    int result = longestCommonSubsequenceRec(text1, text2, 5, 3);
    printf("Length of the longest common subsequence: %d\n", result); // 3 => for "ace"
    return 0;
}
