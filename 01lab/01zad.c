#include <stdio.h>

char maska[8];

void intmask()
{
  int pot2 = 1, i;
  for (i = 0; i < 8; i++)
  {
    maska[i] = (char)pot2;
    pot2 = pot2*2;
  }
}


void obraz_bit(char z)
{
  int i;
  for (i = 7; i >= 0; i--)
  {
    if ((z & maska[i]) == 0) printf("0");
    else printf("1");
  }
}


int main()
{
  intmask();
  int i;

  printf(" ZNAK |      BIN | DEC \n");
  printf("-----------------------\n");

  for (i = 0; i < 127; i++)
  {
    if (i < 33) printf("      | ");
    else printf("    %c | ", i);
    char z = (char)i;
    obraz_bit(z);
    printf(" | %3i", i);
    switch(i)
    {
      case 0:
        printf("   //  Null");
        break;
      case 1:
        printf("   //  Start Of Heading");
        break;
      case 2:
        printf("   //  Start Of Text");
        break;
      case 3:
        printf("   //  End Of Text");
        break;
      case 4:
        printf("   //  End Of Transmission");
        break;
      case 5:
        printf("   //  Enquiry");
        break;
      case 6:
        printf("   //  Acknowledge");
        break;
      case 7:
        printf("   //  Bell");
        break;
      case 8:
        printf("   //  Backspace");
        break;
      case 9:
        printf("   //  Horizontal Tab");
        break;
      case 10:
        printf("   //  Line Feed");
        break;
      case 11:
        printf("   //  Vertical Tab");
        break;
      case 12:
        printf("   //  Form Feed");
        break;
      case 13:
        printf("   //  Carriage Return");
        break;
      case 14:
        printf("   //  Shift Out");
        break;
      case 15:
        printf("   //  Shift In");
        break;
      case 16:
        printf("   //  Data Link Escape");
        break;
      case 17:
        printf("   //  Device Control 1 (XON)");
        break;
      case 18:
        printf("   //  Device Control 2");
        break;
      case 19:
        printf("   //  Device Control 3 (XOFF)");
        break;
      case 20:
        printf("   //  Device Control 4");
        break;
      case 21:
        printf("   //  Negative Acknowledge");
        break;
      case 22:
        printf("   //  Synchronous Idle");
        break;
      case 23:
        printf("   //  End Of Transmission Block");
        break;
      case 24:
        printf("   //  Cancel");
        break;
      case 25:
        printf("   //  End Of Medium");
        break;
      case 26:
        printf("   //  Substitute");
        break;
      case 27:
        printf("   //  Escape");
        break;
      case 28:
        printf("   //  File Separator");
        break;
      case 29:
        printf("   //  Group Separator");
        break;
      case 30:
        printf("   //  Record Separator");
        break;
      case 31:
        printf("   //  Unit Separator");
        break;
      case 32:
        printf("   //  Space");
        break;
      default:
        break;
    }
    printf("\n");
  }

  return 0;
}
