void f(int *a, int *b, int *c, int *d, int n) {
  for (int i=0; i<n; i++) {
    a[i] = b[i] + c[i];
  }

  for (int i=0; i<n; i++) {
    d[i] = a[i] + d[i];
  }
}