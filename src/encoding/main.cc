// Copyright (c) <YEAR> <COPYRIGHT HOLDER>.
// Licensed under the MIT License.

#ifdef _DEBUG
#include <crtdbg.h>
#endif
#include <cstdio>

int main() {
  // check heap memory leak
#ifdef _DEBUG
  _CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
#endif

  // set utf-8 encoding
  // ...

  printf("Welcome to this C++ project template!\n");

  return 0;
}
