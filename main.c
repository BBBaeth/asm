#include "libasm.h"

#include <fcntl.h>
#include <string.h>
#include <stdio.h>
int		main(int argc, char **argv)
{
	if (argc > 1 && argv && argv[2])
	{
	}
		char	str1[] = "ChatonBananePeche";
		char	str2[] = "Chiot";
		printf(" length of arg1 for asm : |%zd|\n", ft_strlen(argv[1]));
		printf(" length of 'salut les potes': |%zd|\n", ft_strlen("salut les potes"));
		printf(" arg for asm : |%d|\n", ft_strcmp(argv[1], argv[2]));
		if (argv[1] && argv[2])
		printf(" arg for cmp : |%d|\n", strcmp(argv[1], argv[2]));
		printf("return asmcpy : |%s|\n", ft_strcpy(str1, str2));
		printf("return cpy: |%s|\n", strcpy(str1, str2));
		errno = 0;
		char *duplicated_str = ft_strdup(argv[1]);
		printf("errno : %d\n", errno);
		if (duplicated_str)
			printf("%p : %s, errno : %d\n", duplicated_str, duplicated_str, errno);
//		else
//		char *duplicated_str2 = strdup("\0");
//		if (duplicated_str2)
//			printf("%p : %s, errno : %d\n", duplicated_str2, duplicated_str2, errno);
//		else
//			printf("%p, errno : %d\n", duplicated_str2, errno);
return (0);
}
