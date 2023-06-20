// Program to print fibonacci series upto n numbers

#include <stdio.h>

int printFib(n) {
  int a1 = 1;
  int a2 = 1;
  printf("%d\n", a1);
  printf("%d\n", a2);
  int ak;
  int i = 2;
  while (i < n) {
    ak = a1 + a2;
    printf("%d\n", ak);
    a2 = a1;
    a1 = ak;
    i++;
  }
  return 0;
}

int main() {
  printFib(9);
  return 0;
}