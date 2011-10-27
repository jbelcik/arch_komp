#include <stdio.h>

int main()
{
  int i;

  printf("\n\n   Podaj liczbe:\n   ");
  scanf("%i", &i);

  printf("\n   Liczba do niej odwrotna to:\n   %i\n\n\n", ~i+1);

  return 0;
}
