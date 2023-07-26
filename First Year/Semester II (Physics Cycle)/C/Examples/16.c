// to check if a given number is palindrome using while loop
#include <stdio.h>

int reverseNum(int a) {
  int remainder;
  int reverse = 0;
  while (a != 0) {
    remainder = a % 10;
    reverse = (reverse * 10) + remainder;
    a = a / 10;
  }
  return reverse;
}

int main() {
  int k;
  printf("Enter the number: ");
  scanf("%d", &k);
  if (reverseNum(k) == k) {
    printf("It is a palindrome");
  } else {
    printf("It is not a palindrome");
  }
  return 0;
}