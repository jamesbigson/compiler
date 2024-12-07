#include <stdio.h>
#include <ctype.h>
#include <string.h>

int isIdentifier(char *str) {
    int i;
    if (!isalpha(str[0]) && str[0] != '_') 
        return 0;

    for (i = 1; str[i] != '\0'; i++) {
        if (!isalnum(str[i]) && str[i] != '_') 
            return 0;
    }
    return 1;
}


int isConstant(char *str) {
    int i;
    for (i = 0; str[i] != '\0'; i++) {
        if (!isdigit(str[i]))
            return 0;
    }
    return 1;
}

int main() {
    char token[100];

    printf("Enter a token (or type 'exit' to quit): ");
    while (1) {
        scanf("%s", token);

        if (strcmp(token, "exit") == 0) {
            printf("Exiting the program.\n");
            break;
        }

        if (isIdentifier(token)) {
            printf("'%s' is an Identifier.\n", token);
        } else if (isConstant(token)) {
            printf("'%s' is a Constant.\n", token);
        } else {
            printf("'%s' is an Invalid token.\n", token);
        }

        printf("\nEnter another token (or type 'exit' to quit): ");
    }
    return 0;
}
