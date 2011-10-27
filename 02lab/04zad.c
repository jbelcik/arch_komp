#include <stdio.h>
#include <string.h>


int potega(int pod, int wyk)
{
  int i, wynik = 1;

  for (i = 0; i < wyk; i++) wynik *= pod;

  return wynik;
}


int zamiana(int sys, char liczba[])
{
  int poz, znak, i, wynik = 0;

  poz = strlen(liczba) - 1;

  if(liczba[0] == '-') znak = 1;
  else znak = 0;
  
  switch(sys)
  {
    case 2:
      for(i = poz; i >= znak; i--)
      {
        if(liczba[i] == '1') wynik += potega(2, poz - i);
      }
      break;
    case 8:
      for(i = poz; i >= znak; i--) wynik += ((int)liczba[i] - 48)*potega(8, poz - i);
      break;
    case 10:
      for(i = poz; i >= znak; i--) wynik += ((int)liczba[i] - 48)*potega(10, poz - i);
      break;
    case 16:
      for(i = poz; i >= znak; i--)
      {
        int hc;

        switch(liczba[i])
        {
          case 'A':
            hc = 10;
            break;
          case 'B':
            hc = 11;
            break;
          case 'C':
            hc = 12;
            break;
          case 'D':
            hc = 13;
            break;
          case 'E':
            hc = 14;
            break;
          case 'F':
            hc = 15;
            break;
          default:
            hc = (int)liczba[i] - 48;
            break;
        }
        wynik += hc*potega(16, poz - i);
      }
      break;
  }

  if (znak == 1) wynik *= -1;
  return wynik;
}


int main()
{
  int sys, i;
  char liczba[10];

  printf("\n\n   Wybierz system liczbowy:\n   ( 2 - binarny,\n     8 - oktalny,\n     10 - dziesietny,\n     16 - heksadecymalny )\n   ");
  scanf("%d", &sys);

  printf("\n   Podaj liczbe, ktora chcesz zamienic:\n   ");
  scanf("%s", liczba);
  printf("\n   Wynik:\n   ");

  int wynik = zamiana(sys, liczba);
  char z;
  
  for ( i = 31 ; i >= 0 ; i-- )
  {
    if (wynik & potega(2, i)) z = '1';
    else z = '0';
    if (i == 23) putchar(' ');
    if (i == 15) putchar(' ');
    if (i == 7) putchar(' ');
    putchar(z);
  }
  
  printf("\n\n\n");
  return 0;
}
