// to check if a given number is negative
#include <stdio.h>

int main() {
  int a;
  printf("Enter the number: ");
  scanf("%d", &a);
  if (a < 0) {
    printf("It's a negative number");
  } else {
    printf("It's a positive number");
  }
  return 0;
}