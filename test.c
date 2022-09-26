int main();

void test_1();
void test_2();

void stdout(char *, int);
int len_data_buffer(char *, int);
void exit(int);
void syscall(int, ...);

int _start()
{
  int exit_code = main();

  exit(exit_code);
}

int main()
{
  char t1[] = "test_1\n";
  stdout(t1, 7);
  test_1();

  char t2[] = "test_2\n";
  stdout(t2, 7);
  test_2();

  return 0;
}

// Test stdout, len_data_buffer
void test_1()
{
  int buffer_len = 25;
  char text[buffer_len];

  for(int i = 0; i < 10; i++) {
    text[i] = 97 + i;
  }

  text[10] = '\n';

  int text_len = len_data_buffer(text, buffer_len);

  stdout(text, text_len);

  return;
}

// Test syscall, len_data_buffer
void test_2()
{
  int buffer_len = 250;
  char newline = '\n';
  char path[buffer_len];

  syscall(79, path, buffer_len);

  int path_len = len_data_buffer(path, buffer_len);

  syscall(1, 1, path, path_len);
  syscall(1, 1, &newline, 1);

  return;
}
