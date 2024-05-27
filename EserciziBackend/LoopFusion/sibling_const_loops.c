void f(int *a, int *b, int *c, int *d) {
  for (int i=0; i<101; i++) {
    a[i] = b[i] + c[i];
  }

  for (int i=0; i<102; i++) {
    d[i] = a[i] + d[i];
  }
}