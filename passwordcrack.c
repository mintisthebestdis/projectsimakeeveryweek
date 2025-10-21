#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <windows.h>
#define LENGTH 100


void generateRandomString(char *str, int length) {
    const char charset[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()";
    
    for (int i = 0; i < length; i++) {
        int key = rand() % (sizeof(charset) - 1); 
        str[i] = charset[key];
    }
    str[length] = '\0'; 
}








int main() {
srand(time(NULL));
    char userPassword[50];
char Passwordcracker[LENGTH + 1];
printf("make a password to crack:\n");
scanf("%s", userPassword);
while (1) {
    generateRandomString(Passwordcracker, LENGTH);
    printf("cracking..\n");
    Sleep(1000);
    if (strcmp(userPassword, Passwordcracker) == 0) {
       printf("your password is: %s\n", Passwordcracker);
     break;
    }


    
}
return 0;
}

