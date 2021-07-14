#include "libasm.h"

#include <fcntl.h>
#include <string.h>
#include <stdio.h>
int		main(int argc, char **argv)
{
	if (argc > 1 && argv && argv[2])
	{
	}
		printf(" length of arg1 for asm : |%zd|\n", ft_strlen(argv[1]));
		printf(" length of 'salut les potes': |%zd|\n", ft_strlen("salut les potes"));
		if (argv[1] && argv[2])
			printf(" arg for asm : |%d|\n", ft_strcmp(argv[1], argv[2]));
		if (argv[1] && argv[2])
			printf(" arg for cmp : |%d|\n", strcmp(argv[1], argv[2]));
		errno = 0;
		printf("avant : %d\n", errno);
		ft_strdup(argv[1]);
		printf("errno : %d\n", errno);
		errno = 0;
		if (argv[1])
			strdup(argv[1]);
		printf("errno : %d\n", errno);

//READ

	int fd;
	int r_read;
	int r_ft_read;
	char *src;
	char *dest;

	src = malloc(5);
	dest = malloc(5);
	fd = open("./Makefile", O_RDONLY);
	errno = 0;
	r_read = read(fd, src, 4);
	close(fd);
	printf("read : %s, ret : %d, errno : %d\n", src, r_read, errno);
	fd = open("./Makefile", O_RDONLY);
	errno = 0;
	r_ft_read = ft_read(fd, dest, 4);
	close(fd);
	printf("ft_read : %s, ret : %d, errno : %d\n", dest, r_ft_read, errno);


	fd = open("./SUPERalbatros", O_RDONLY);
	errno = 0;
	r_read = read(fd, src, 4);
	close(fd);
	printf("ret : %d, errno : %d\n", r_read, errno);
	fd = open("./SUPERalbatros", O_RDONLY);
	errno = 0;
	r_ft_read = ft_read(fd, dest, 4);
	close(fd);
	printf("ret : %d, errno : %d\n", r_ft_read, errno);

// WRITE

	errno = 0;
	printf("write : %ld", write(1, "hello!\n", 5));
	printf(", errno : %d\n", errno);
	errno = 0;
	printf("ft_write : %ld", ft_write(1, "hello!\n", 5));
	printf(", errno : %d\n", errno);

	errno = 0;
	printf("write : %ld", write(1, argv[1], 12));
	printf(", errno : %d\n", errno);
	errno = 0;
	printf("ft_write : %ld", ft_write(1, argv[1], 12));
	printf(", errno : %d\n", errno);

	errno = 0;
	printf("write : %ld", write(1, argv[2], -10));
	printf(", errno : %d\n", errno);
	errno = 0;
	printf("ft_write : %ld", ft_write(1, argv[2], -10));
	printf(", errno : %d\n", errno);

	return (0);
}
