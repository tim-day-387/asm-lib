int main();
void stdout(char *, int);
int len_data_buffer(char *, int);
void exit(int);

int _start()
{
  exit(main());
}

int main()
{
  int buffer_len = 25;
  char text[buffer_len];

  for(int i = 0; i < 10; i++) {
    text[i] = 97 + i;
  }

  text[10] = '\n';

  int text_len = len_data_buffer(text, buffer_len);

  stdout(text, text_len);

  return 0;
}
