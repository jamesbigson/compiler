#include <stdio.h>
#include <conio.h>
#include <string.h>
void main()
{
    char icode[10][30], str[20], opr[10];
    int i = 0;

    printf(" Enter the set of intermediate code (terminated by exit):");
    do
    {
        scanf("%s", icode[i]);
    } while (strcmp(icode[i++], "exit") != 0);
    printf(" \ntarget code generation\n");
    printf("\n************************\n");
    i = 0;
    do
    {
        strcpy(str, icode[i]);
        switch (str[3])
        {
        case '+':
            strcpy(opr, "ADD ");
            break;
        case '-':
            strcpy(opr, "SUB ");
            break;
        case '*':
            strcpy(opr, "MUL ");
            break;
        case '/':
            strcpy(opr, "DIV ");
            break;
        }
		printf("\nMov %c,R%d", str[2], i);
		printf("\n%s%c,R%d", opr, str[4], i);
		printf("\nMov R%d,%c", i, str[0]);
    } while (strcmp(icode[++i], "exit") != 0);
    getch();
}
