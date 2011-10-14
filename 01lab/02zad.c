#include <stdio.h>
#include <string.h>


void AND(char bin1[8], char bin2[8])
{
  int i;
  char eq[8];
  for (i = 0; i < 8; i++) printf("%c", bin1[i]);
  printf(" AND ");
  for (i = 0; i < 8; i++) printf("%c", bin2[i]);
  printf(" = ");
  for (i = 0; i < 8; i++)
  {
    eq[i] = bin1[i] & bin2[i];
    printf("%c", eq[i]);
  }
  printf("\n");
}


void NAND(char bin1[8], char bin2[8])
{
  int i, eq[8];
  for (i = 0; i < 8; i++) printf("%c", bin1[i]);
  printf(" NAND ");
  for (i = 0; i < 8; i++) printf("%c", bin2[i]);
  printf(" = ");
  for (i = 0; i < 8; i++)
  {
    if ((bin1[i] & bin2[i]) == '1') eq[i] = 0;
    else eq[i] = 1;
    printf("%i", eq[i]);
  }
  printf("\n");
}


void OR(char bin1[8], char bin2[8])
{
  int i;
  char eq[8];
  for (i = 0; i < 8; i++) printf("%c", bin1[i]);
  printf(" OR ");
  for (i = 0; i < 8; i++) printf("%c", bin2[i]);
  printf(" = ");
  for (i = 0; i < 8; i++)
  {
    eq[i] = bin1[i] | bin2[i];
    printf("%c", eq[i]);
  }
  printf("\n");
}


void NOR(char bin1[8], char bin2[8])
{
  int i, eq[8];
  for (i = 0; i < 8; i++) printf("%c", bin1[i]);
  printf(" NOR ");
  for (i = 0; i < 8; i++) printf("%c", bin2[i]);
  printf(" = ");
  for (i = 0; i < 8; i++)
  {
    if ((bin1[i] | bin2[i]) == '1') eq[i] = 0;
    else eq[i] = 1;
    printf("%i", eq[i]);
  }
  printf("\n");
}

void XOR(char bin1[8], char bin2[8])
{
  int i;
  int eq[8];
  for (i = 0; i < 8; i++) printf("%c", bin1[i]);
  printf(" XOR ");
  for (i = 0; i < 8; i++) printf("%c", bin2[i]);
  printf(" = ");
  for (i = 0; i < 8; i++)
  {
    eq[i] = (int)bin1[i] ^ (int)bin2[i];
    printf("%i", eq[i]);
  }
  printf("\n");
}


void NOT(char bin[8])
{
  int i, eq[8];
  printf("NOT ");
  for (i = 0; i < 8; i++) printf("%c", bin[i]);
  printf(" = ");
  for (i = 0; i < 8; i++)
  {
    if (bin[i] == '1') eq[i] = 0;
    else eq[i] = 1;
    printf("%i", eq[i]);
  }
  printf("\n");
}


int main()
{
  char slowo[8], bin1[8], bin2[8], sen[4];
  int i = 0;

  FILE *f = fopen("dane.txt", "r");

  while (fscanf(f, "%s", slowo) != EOF) 
  {
    if (slowo[0] == 'N' && i == 0)
    {
      strcpy(sen, slowo);
      i = 1;
    }
    else if (slowo[0] != 'N' && i == 0)
    {
      strcpy(bin1, slowo);
      i = 2;
    }
    else if (i == 1)
    {
      strcpy(bin1, slowo);
      NOT(bin1);
      i = 0;
    }
    else if (i == 2)
    {
      strcpy(sen, slowo);
      i = 3;
    }
    else if (i == 3)
    {
      strcpy(bin2, slowo);
      if (sen[0] == 'A') AND(bin1, bin2);
      else if (sen[0] == 'N' && sen[2] == 'N') NAND(bin1, bin2);
      else if (sen[0] == 'O') OR(bin1, bin2);
      else if (sen[0] == 'N' && sen[2] == 'R') NOR(bin1, bin2);
      else if (sen[0] == 'X') XOR(bin1, bin2);
      i = 0;
    }
  }

  fclose(f);
  return 0;
}
