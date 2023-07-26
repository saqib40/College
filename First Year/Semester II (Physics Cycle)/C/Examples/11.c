// Program to print sum of even natural numbers upto a given number

#include <stdio.h>

int task(int a) {
  int sum = 0;
  int i = 2;
  while (i <= a) {
    if (i % 2 == 0) {
      sum += i;
    }
    i++;
  }
  return sum;
}

int main() {
  printf("Enter the number: ");
  int k;
  scanf("%d", &k);
  int m = task(k);
  printf("%d", m);
  return 0;
}