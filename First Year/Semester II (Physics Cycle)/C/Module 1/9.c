// to check if a given number is equal to 10, 50 or 100 using switch statement

#include <stdio.h>

int task(int myNum) {
  switch (myNum) {
  case 10:
    printf("The given number is 10");
    break;
  case 50:
    printf("The given number is 50");
    break;
  case 100:
    printf("The given number is 100");
    break;
  default:
    printf("The given number isn't 10 or 50 or 100");
  }
  return 0;
}

int main() {
  int k;
  printf("Enter the number: ");
  scanf("%d", &k);
  task(k);
  return 0;
}