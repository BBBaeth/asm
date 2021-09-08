#include "libasm.h"

#include <fcntl.h>
#include <string.h>
#include <stdio.h>

#define SOURCE "./libasm.h"
#define CHARLIMIT 12

int		main(int argc, char **argv)
{

//lEN

	printf("length of argv[1] for my ft_strlen : |%zd|\n", ft_strlen(argv[1]));

//CMP

	printf("cmp argv[1] argv[2] for my ft_strcmp : |%d|\n", ft_strcmp(argv[1], argv[2]));

//DUP

	errno = 0;
	printf("errno before dup of argv[1] with my ft_strdup : %d\n", errno);
	ft_strdup(argv[1]);
	printf("errno after dup argv[1] with my strdup : %d\n", errno);

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
	r_ft_read = ft_read(fd, dest, 4);
	close(fd);
	printf("my ft_read : %s, ret : %d, errno : %d\n", dest, r_ft_read, errno);


	fd = open(SOURCE, O_RDONLY);
	errno = 0;
	r_ft_read = ft_read(fd, dest, 4);
	close(fd);
	printf("ret : %d, errno : %d\n", r_ft_read, errno);

// WRITE

	errno = 0;
	printf(" :: ft_write (number of bytes written): '%ld'", ft_write(1, "hello!\n", 5));
	printf(", errno : %d\n", errno);

	errno = 0;
	printf(" :: ft_write (argv[1] capped at CHARLIMIT) : %ld", ft_write(1, argv[1], CHARLIMIT));
	printf(", errno : %d\n", errno);

	errno = 0;
	printf("ft_write (argv[2] capped at negative) : %ld", ft_write(1, argv[2], -10));
	printf(", errno : %d\n", errno);

// COPY

	char mystring[] = "hello world";
	char mycopy[] = "hi";
	char mycopy2[] = "I love sushi and cute little puppies.";
	char empty[] = "";
	char longstring[] = "blablablablablabla";

	printf("my ft_strcpy    (test1) : |%s|\n", ft_strcpy(mystring, mycopy));
	printf("my ft_strcpy    (test2) : |%s|\n", ft_strcpy(mycopy2, empty));
	printf("my ft_strcpy    (test3) : |%s|\n", ft_strcpy(empty, longstring));
	printf("my ft_strcpy    (argv[1], argv[2]) : |%s|\n", ft_strcpy(argv[1], argv[2]));
	return (0);
}
