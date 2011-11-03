#include <stdio.h>

int main()
{
  float x;

  scanf("%f", &x);

  int a = (int)(x*100), lewa = a/100, prawa, i, pom, j = 0, k = 0, stop = 0;
  if (x < 0)
  {
    lewa = -lewa;
    prawa = -a%100;
  }
  else prawa = a%100;
  char L[8], P[2];

  for (i = 1000000000; i != 0; i /= 10)
  {
      pom = lewa/i;
      L[j] = (char)(pom + 48);
      lewa = lewa - pom*i;
      j++;
  }

  for (i = 10; i != 0; i /= 10)
  {
    pom = prawa/i;
    P[k] = (char)(pom + 48);
    prawa = prawa - pom*i;
    k++;
  }

  if (x < 0) putchar('-');
  for (i = 0; i < j; i++)
  {
    if (L[i] != '0' || stop == 1)
    {
    putchar(L[i]);
    stop = 1;
    }
  }
  if (stop == 0) putchar('0');
  putchar('.');
  for (i = 0; i < k; i++) putchar(P[i]);
  putchar('\n');

  return 0;
}
