#include <stdio.h>

void foo(int c, int z) {
  int a = 9, h, m = 0, n = 0, q, r = 0, y = 0;

LOOP:
  z = z + 1;
  y = c + 3;
  q = c + 7;
  if (z < 5) {
    a = a + 2;
    h = c + 3;
  } else {
    a = a - 1;
    h = c + 4;
    if (z >= 10) {
      goto EXIT;
    }
  }
  m = y + 7;
  n = h + 2;
  y = c + 7;
  r = q + 5;
  goto LOOP;
EXIT:
  printf("%d,%d,%d,%d,%d,%d,%d,%d\n", a, h, m, n, q, r, y, z);
}

int main() {
  foo(0, 4);
  foo(0, 12);
  return 0;
}