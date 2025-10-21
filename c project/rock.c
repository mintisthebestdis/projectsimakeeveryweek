#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int main() {
    srand(time(0));
    char playing[50];
    int botplaying;

    start:
    printf("Welcome to Rock, Paper, Scissors!\n");
    scanf("%s", playing);
    botplaying = rand() % 3;

    if (strcmp(playing, "rock") == 0) {
        if (botplaying == 0) {
            printf("Draw! Rock vs Rock.\n");
            goto start;
        } else if (botplaying == 1) {
            printf("You lose... Bot chose Paper.\n");
            goto start;
        } else if (botplaying == 2) {
            printf("You win! Rock beats Scissors.\n");
            goto start;
        }
    } else if (strcmp(playing, "paper") == 0) {
        if (botplaying == 0) {
            printf("You win! Paper beats Rock.\n");
            goto start;
        } else if (botplaying == 1) {
            printf("Draw! Paper vs Paper.\n");
            goto start;
        } else if (botplaying == 2) {
            printf("You lose... Scissors beats Paper.\n");
            goto start;
        }
    } else if (strcmp(playing, "scissors") == 0) {
        if (botplaying == 0) {
            printf("You lose... Rock beats Scissors.\n");
            goto start;
        } else if (botplaying == 1) {
            printf("You win! Scissors beats Paper!\n");
            goto start;
        } else if (botplaying == 2) {
            printf("Draw! Scissors vs Scissors.\n");
            goto start;
        }
    } else if (strcmp(playing, "q") == 0) {
        exit(0);
    } else {
        printf("choose a vaild option (rock,paper,scissors,q(to quit))\n");
        goto start;
    }

    return 0;
}
