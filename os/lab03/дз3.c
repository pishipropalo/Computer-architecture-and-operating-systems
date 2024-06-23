#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

int main(int argc, char *argv[]) {
    regex_t r;
    regmatch_t m;

    regcomp(&r, argv[1], REG_EXTENDED);

    size_t sz = strlen(argv[2]) + 1;
    char *text2 = (char *)malloc(sz);
    text2[0] = '\0';

    const char *s = argv[2];
    while (regexec(&r, s, 1, &m, 0) == 0) {
        strncat(text2, s, m.rm_so);
        strcat(text2, argv[3]);

        s += m.rm_eo;

        sz += strlen(argv[3]) - (m.rm_eo - m.rm_so);
        text2 = (char *)realloc(text2, sz);
    }

    strcat(text2, s);

    printf("%s\n", text2);

    free(text2);
    regfree(&r);
    return 0;
}
